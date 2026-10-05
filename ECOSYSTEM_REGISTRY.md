# 🌐 Registro de Ecosistema — WoWPeru_AbbreviatedStatus

Ficha técnica oficial de registro en la infraestructura multi-addon de **WoW Perú - Reino Andino**.

---

## 1. Identidad del Addon

| Campo | Valor |
|---|---|
| **Nombre Técnico** | `WoWPeru_AbbreviatedStatus` |
| **Título en Cliente** | `Abbreviated Status Text` |
| **Versión** | `1.2.1` |
| **Tipo de Sistema** | Formateador Visual de Barras de Recursos (Client-Side Only) |
| **Repositorio GitHub** | [DarckRovert/WoWPeru_AbbreviatedStatus](https://github.com/DarckRovert/WoWPeru_AbbreviatedStatus) |
| **Directorio de Instalación** | `Interface\AddOns\AbbreviatedStatus\` |

---

## 2. Red y Mensajería de Addon

| Propiedad | Valor |
|---|---|
| **Prefijo Oficial** | Ninguno (Operación 100% local en cliente) |
| **Canales de Red** | N/A |
| **OpCodes Manejados** | N/A |

---

## 3. Persistencia de Datos

| Variable Global | Tipo | Ámbito | Propósito |
|---|---|---|---|
| `AbbreviatedStatusDB` | Tabla Lua (`SavedVariables`) | Por Cuenta | Guarda preferencias de abreviación, separadores numéricos y posiciones de texto. |

---

## 4. Matriz de Integración del Ecosistema

| Sistema Coexistente | Modo de Interacción | Flujo de Datos |
|---|---|---|
| **`cDF` (Dragonflight UI)** | Coexistencia Visual | Convive armoniosamente formateando las cadenas de texto sobre los marcos de jugador y objetivo. |
| **`WoWPeru_RaidSuite`** | Coexistencia en Combate | Permite lectura rápida del estado de salud de objetivos y foco en entornos de banda. |

---

## 5. Garantías de Rendimiento

- **Tiempo de Cuadro:** < 0.01 ms por frame.
- **Memoria en Tiempo de Ejecución:** < 60 KB de memoria Lua.
- **Compatibilidad de Hardware:** 100% verificado para PCs de cabina con procesadores de baja gama.
