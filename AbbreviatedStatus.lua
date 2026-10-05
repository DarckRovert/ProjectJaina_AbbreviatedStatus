--######################################################################
--######                    AbbreviatedStatus                    #######
------------------------------------------------------------------------
--######################################################################
------------------------------------------------------------------------
--######        My Discord: https://discord.gg/Fm9kgfk           #######
------------------------------------------------------------------------
--######################################################################
local UnitIsDeadOrGhost = UnitIsDeadOrGhost;
local UnitIsConnected = UnitIsConnected;
---------------------------------------------------------
NUMBER_ABBREVIATION_DATA = {
    -- Order these from largest to smallest
    -- (significandDivisor and fractionDivisor should multiply to be equal to breakpoint)
    { breakpoint = 10000000000000,   abbreviation = FOURTH_NUMBER_CAP_NO_SPACE,       significandDivisor = 1000000000000,  fractionDivisor = 1  },
    { breakpoint = 1000000000000,    abbreviation = FOURTH_NUMBER_CAP_NO_SPACE,       significandDivisor = 100000000000,   fractionDivisor = 10 },
    { breakpoint = 10000000000,      abbreviation = THIRD_NUMBER_CAP_NO_SPACE,        significandDivisor = 1000000000,     fractionDivisor = 1  },
    { breakpoint = 1000000000,       abbreviation = THIRD_NUMBER_CAP_NO_SPACE,        significandDivisor = 100000000,      fractionDivisor = 10 },
    { breakpoint = 10000000,         abbreviation = SECOND_NUMBER_CAP_NO_SPACE,       significandDivisor = 1000000,        fractionDivisor = 1  },
    { breakpoint = 1000000,          abbreviation = SECOND_NUMBER_CAP_NO_SPACE,       significandDivisor = 100000,         fractionDivisor = 10 },
    { breakpoint = 10000,            abbreviation = FIRST_NUMBER_CAP_NO_SPACE,        significandDivisor = 1000,           fractionDivisor = 1  },
    { breakpoint = 1000,             abbreviation = FIRST_NUMBER_CAP_NO_SPACE,        significandDivisor = 100,            fractionDivisor = 10 },
};

function AbbreviatedStatusNumbers(value)
    if not value or type(value) ~= "number" then return tostring(value or "0"); end
    local remainder = AbbreviatedStatusOption_GetGeneralValue("remainder");
    local prefix = AbbreviatedStatusOption_GetGeneralValue("prefix");
    local index = (prefix and prefix >= 3) and (prefix - 3) or 0;
    for i, data in ipairs(NUMBER_ABBREVIATION_DATA) do
        if ( value >= data.breakpoint ) then
            local clampedIndex = math.max(1, math.min(#NUMBER_ABBREVIATION_DATA, #NUMBER_ABBREVIATION_DATA - index));
            local currentEntry = NUMBER_ABBREVIATION_DATA[clampedIndex];
            local currentValue = currentEntry and currentEntry.breakpoint or data.breakpoint;
            local fmt = "%." .. (tonumber(remainder) or 1) .. "f";
            local finalValue = string.format(fmt, (value / data.significandDivisor) / data.fractionDivisor);
            local abbr = data.abbreviation or "";
            return ( prefix > 1 and currentValue <= data.breakpoint ) and (finalValue .. abbr) or finalValue;
        end
    end
    return tostring(value)
end

function AbbreviateNumbers(value)
    for i, data in ipairs(NUMBER_ABBREVIATION_DATA) do
        if ( value >= data.breakpoint ) then
            local finalValue;
            finalValue = math.floor(value / data.significandDivisor) / data.fractionDivisor;
            return finalValue .. data.abbreviation;
        end
    end
    return tostring(value);
end

local function Abbreviated_UpdateTextString(self)
    if not self or not self.unit then return; end
    local unit = self.unit;
    local unitType = string.gsub(unit, "[%d]", "");
    local unitOption = AbbreviatedStatusGetUnitOption(unitType);
    if not unitOption then
        return;
    end

    local statusText = self.TextString;
    if not statusText then return; end

    local value = self:GetValue() or 0;
    local _, valueMax = self:GetMinMaxValues();
    valueMax = valueMax or 0;

    local stringText = AbbreviatedStatusNumbers(value);
    local percText = (valueMax > 0) and string.format("%.f%%", (value / valueMax) * 100) or "0%";

    local barType = AbbreviatedStatusOption_GetStatusBarType(self);
    if not barType then return; end
    local cvarStatus, cvarPecernt = AbbreviatedStatus_GetCVarBool(unitType, barType);

    if ( not self.TextPercent ) then
        self.TextPercent = CreateFrame("Frame", "$parentPercent", self, "TextPercentBarTemplate");
        self.TextPercent:SetFrameLevel(self:GetFrameLevel() + 1);
        self.TextPercent:SetAllPoints();
        self.TextPercent.text = _G[self.TextPercent:GetName() .. "Text"];
    end
    local precentText = self.TextPercent and self.TextPercent.text;

    if ( cvarPecernt and value > 0 and valueMax > 0 and precentText ) then
        precentText:SetText(percText);
        if ( not UnitIsConnected(unit) or UnitIsDeadOrGhost(unit) ) then
            precentText:Hide();
        else
            precentText:Show();
        end
    elseif precentText then
        precentText:Hide();
    end

    if ( cvarStatus ) then
        AbbreviatedStatusOption_SetText(statusText, unit, stringText);
        if ( barType == "manabar" and ( not UnitIsConnected(unit) or UnitIsDeadOrGhost(unit) ) ) then
            statusText:Hide();
        elseif ( value == 0 and barType == "manabar" ) then
            statusText:Hide();
        else
            statusText:Show();
        end
    else
        statusText:Hide();
    end

    if ( cvarPecernt and cvarStatus and precentText and precentText:IsShown() ) then
        AbbreviatedStatusOption_SetPosition(precentText, "LEFT", self, barType, "percent", unitType);
        AbbreviatedStatusOption_SetPosition(statusText, "RIGHT", self, barType, "status", unitType);
    else
        if precentText then
            AbbreviatedStatusOption_SetPosition(precentText, "CENTER", self, barType, "percent", unitType);
        end
        AbbreviatedStatusOption_SetPosition(statusText, "CENTER", self, barType, "status", unitType);
    end
end

hooksecurefunc("TextStatusBar_UpdateTextString", Abbreviated_UpdateTextString);
