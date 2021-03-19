## Head

### New

- Add news variables `startTimeAnimation` and `finishTimeAnimation` in `LoaderObject` to customize time animation when hide or show views
- Improve animation between show and hide loader when time between methods is short

### Fix

- Fix a bug where the loader is not being hidden when calling hideLoader inmediately after showLoader with a zero delay [#1](https://github.com/SDOSLabs/SDOSLoader/issues/1)

## [3.1.0 Support Swift Package Manager](https://github.com/SDOSLabs/SDOSLoader/tree/3.1.0)

-  Add support for Swift Package Manager

## [3.0.2 Refactor](https://github.com/SDOSLabs/SDOSLoader/tree/v3.0.2)

- Modificado el LoaderObject para que el objeto parentView sea weak

## [3.0.1 Refactor](https://github.com/SDOSLabs/SDOSLoader/tree/v3.0.1)

- Modificado el LoaderObject para que el objeto loadable sea internal

## [3.0.0 Rediseño completo para la adaptación a Swift](https://github.com/SDOSLabs/SDOSLoader/tree/v3.0.0)

- Se ha rediseñado la librería para su uso nativo en Swift. En esencia es igual que antes pero ahora se ha adaptado la funcionalidad para la asginación de estilos

## [2.0.2 Cambio URL dependencia](https://github.com/SDOSLabs/SDOSLoader/tree/v2.0.2)

- Modificada url source de la dependencia

## [2.0.1 Variables renombradas](https://github.com/SDOSLabs/SDOSLoader/tree/v2.0.1)

- Renombradas variables para evitar conflictos con otras librerías

## [2.0.0 Eliminación de dependencias. Comentarios y estructura del podspec](https://github.com/SDOSLabs/SDOSLoader/tree/v2.0.0)

- Se han eliminado dependencias de la librería MaterialControlCustom. Ahora la clase del loader ha cambiado de MDProgress a SDOSLoaderProgress para la personalización
- Se ha eliminado la dependencia de SDOSLocalizableString
- Se ha modificado la estructura del podspec
- Se han eliminado comentarios de las cabeceras de los ficheros

## [1.1.0 Nuevos loaders añadidos](https://github.com/SDOSLabs/SDOSLoader/tree/v1.1.0)

- Se ha integrado una nueva librería de loaders (https://github.com/ninjaprox/DGActivityIndicatorView). 

## [1.0.0 Primera versión](https://github.com/SDOSLabs/SDOSLoader/tree/v1.0.0)

- Separación de la parte del proyecto CoreiOS original que afecta al módulo de los loaders
