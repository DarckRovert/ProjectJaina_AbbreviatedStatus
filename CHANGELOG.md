# Registro de Cambios — WoWPeru_AbbreviatedStatus

Todos los cambios notables de este proyecto están documentados en este archivo siguiendo el estándar [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/).

---

## [v1.2.1-wp] — 2026-10-05
### Correcciones de Estabilidad y Gobernanza (WoW Perú)
- **Prevención de `NaN` (División por Cero):** Validación de `valueMax > 0` antes de computar porcentajes de vida y maná (`value / valueMax * 100`), previniendo caídas del intérprete Lua y textos corruptos en barras vacías.
- **Clampeo de Índices Numéricos:** Asegurado que el índice de prefijo del slider no acceda a valores negativos en la tabla `NUMBER_ABBREVIATION_DATA`.
- **Blindaje de Marcos de Estado:** Añadidos guardias nil en `GetStatusBarType` y `SetPosition` para evitar excepciones con barras de estado anónimas del cliente.
- **Higiene de Repositorio:** Creación de `NOTICE.md`, `.gitattributes` y ficha técnica `ECOSYSTEM_REGISTRY.md`.

---

## [v1.2.1] — Upstream (RomanSpector)
### Características Base
- Abreviación compacta de números en barras de vida, maná y recursos alternativos para WotLK 3.3.5a.
- Panel de opciones en el menú de interfaz de Blizzard (`AbbreviatedStatusOption.lua`).
- Soporte de localización inicial (`enUS`, `ruRU`).
