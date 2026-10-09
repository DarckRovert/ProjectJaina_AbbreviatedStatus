# 🔌 Especificación Técnica y API — Wanos_AbbreviatedStatus

[![GitHub](https://img.shields.io/badge/GitHub-DarckRovert%2FWanos_AbbreviatedStatus-black?logo=github)](https://github.com/DarckRovert/Wanos_AbbreviatedStatus)
[![Ecosistema](https://img.shields.io/badge/Ecosistema-WoW%20Per%C3%BA%203.3.5a-gold.svg)](https://worldofwanos.com/)

## 📌 Resumen Arquitectónico
Abreviación inteligente de valores numéricos en barras de salud, maná y energía de marcos de unidad (jugador, objetivo, grupo) con blindaje contra divisiones por cero y soporte esES.

- **Rol en el Ecosistema:** Módulo Oficial #4 — Formateo Numérico de Estado
- **Archivo Principal TOC:** `AbbreviatedStatus.toc`
- **Compatibilidad del Motor:** World of Warcraft 3.3.5a (Build 12340)

---

## ⌨️ Comandos de Consola (Slash Commands)
- *(No expone comandos directos; opera mediante hooks reactivos de eventos y marcos de interfaz)*.

---

## 📡 Protocolo de Red y Eventos
- *(Este addon no utiliza mensajes AddonMessage de red; opera en espacio local del cliente)*.

### Eventos del Motor 3.3.5a Gestionados
- `PLAYER_LOGIN` / `ADDON_LOADED`: Inicialización atómica de tablas de configuración y hooks.
- `PLAYER_ENTERING_WORLD`: Sincronización de estado tras transiciones de pantalla o mapa.
- `PLAYER_LOGOUT`: Guardado seguro en disco de las variables locales.

---

## 💾 Persistencia de Datos (SavedVariables)
- `AbbreviatedStatusDB`: Almacenamiento estructurado de configuración y estado persistente.

---

## 🛠️ Buenas Prácticas de Integración
1. Toda invocación a funciones públicas debe verificar previamente la existencia del espacio de nombres en `_G`.
2. Las tablas de configuración deben consultarse en modo lectura sin sobreescribir valores por omisión no validados.
3. El intercambio de datos con otros addons debe efectuarse a través del bus oficial `Wanos_Companion` o hooks de eventos estándar.
