# Aviso Legal y Créditos de Código de Terceros — ProjectJaina_AbbreviatedStatus

Este repositorio forma parte del ecosistema oficial de **Project Jaina - Project Jaina**.
Contiene adaptaciones, correcciones de estabilidad y mantenimiento del addon **AbbreviatedStatus** para el cliente World of Warcraft 3.3.5a (Build 12340).

---

## 1. Atribución del Proyecto Original Upstream

* **Autor Original:** RomanSpector
* **Repositorio Upstream:** [RomanSpector/AbbreviatedStatus](https://github.com/RomanSpector/AbbreviatedStatus)
* **Propósito:** Abreviación compacta de números de vida y maná en marcos de unidad y barras de estado.

---

## 2. Estado de Licencia del Código Fuente Upstream

El repositorio upstream de RomanSpector no incluye un archivo formal de licencia abierta (licencia `null` en GitHub). De acuerdo con la legislación internacional de propiedad intelectual y los términos de servicio de GitHub, el autor original retiene todos los derechos sobre la obra base.

Por respeto estricto a la autoría original y conforme a la gobernanza de Project Jaina:
1. No se adjunta una licencia MIT sobre este repositorio para evitar adjudicaciones erróneas de derechos.
2. Se preservan intactos todos los créditos y nombres de autoría en el archivo `.toc` y código fuente.
3. El proyecto se mantiene como fork comunitario sin fines comerciales para garantizar la estabilidad del cliente del Project Jaina.

---

## 3. Correcciones de Estabilidad Implementadas por Project Jaina

El equipo de ingeniería de Project Jaina ha aplicado las siguientes correcciones de bajo nivel sobre el código original:
* **Prevención de `NaN` (División por Cero):** Validación estricta de `valueMax > 0` antes de calcular el porcentaje `value / valueMax * 100`, eliminando crashes en Windows MSVCRT con barras vacías.
* **Control de Índices de Abreviación:** Clampeo del índice del slider de prefijos para evitar indexación negativa en la tabla `NUMBER_ABBREVIATION_DATA`.
* **Guardias contra Marcos Nulos:** Verificación de existencia de marcos antes de invocar `GetStatusBarType` y `SetPosition`.
