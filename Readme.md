- [SDOSLoader](#sdosloader)
  - [Introducción](#introducción)
  - [Instalación](#instalación)
    - [Cocoapods](#cocoapods)
    - [Swift Package Manager](#swift-package-manager)
      - [**En el "Project"**](#en-el-project)
      - [**En un Package.swift**](#en-un-packageswift)
  - [Cómo se usa](#cómo-se-usa)
    - [Implementación](#implementación)
  - [Dependencias](#dependencias)
  - [Referencias](#referencias)

# SDOSLoader

- Enlace confluence: https://kc.sdos.es/x/pQXLAQ
- Changelog: https://github.com/SDOSLabs/SDOSLoader/blob/master/CHANGELOG.md

## Introducción

SDOSLoader ofrece una forma sencilla de crear loaders más visuales y más personalizables que el tipo UIActivityIndicatorView nativo del sistema. La librería se encarga de centralizar la creación de los loaders de una forma única. Se integra con el sistema de asignación de estilos de SDOS

## Instalación

### Cocoapods

Usaremos [CocoaPods](https://cocoapods.org). 

Añadir el "source" privado de SDOSLabs al `Podfile`. Añadir también el source público de cocoapods para poder seguir instalando dependencias desde éste:
```ruby
source 'https://github.com/SDOSLabs/cocoapods-specs.git' #SDOSLabs source
source 'https://github.com/CocoaPods/Specs.git' #Cocoapods source
```

Añadir la dependencia al `Podfile`:
```ruby
pod 'SDOSLoader', '~>3.1.0'
```

De forma opcional podéis añadir estas dependencias si os encontráis con algún problema de resolución
```ruby
pod 'M13ProgressSuite', :git => 'https://github.com/SDOSLabs/M13ProgressSuite.git', :tag => '1.3.1'
pod 'DGActivityIndicatorView', :git => 'https://github.com/SDOSLabs/DGActivityIndicatorView.git', :tag => '2.2.1'
```

### Swift Package Manager

A partir de Xcode 12 podemos incluir esta librería a través de Swift package Manager. Existen 2 formas de añadirla a un proyecto:

#### **En el "Project"**

Debemos abrir nuestro proyecto en Xcode y seleccionar el proyecto para abrir su configuración. Una vez aquí seleccionar la pestaña "Swift Packages" y añadir el siguiente repositorio

```
https://github.com/SDOSLabs/SDOSLoader.git
```

En el siguiente paso deberemos seleccionar la versión que queremos instalar. Recomentamos indicar "Up to Next Major" 3.2.1.

Por último deberemos indicar el o los targets donde se deberá incluir la librería

#### **En un Package.swift**

Incluir la dependencia en el bloque `dependencies`:

``` swift
dependencies: [
    .package(url: "https://github.com/SDOSLabs/SDOSLoader.git", .upToNextMajor(from: "3.2.1"))
]
```

Incluir la librería en el o los targets desados:

```js
.target(
    name: "YourDependency",
    dependencies: [
        "SDOSLoader"
    ]
)
```

## Cómo se usa

### Implementación

Actualmente SDOSLoader consta de varios tipos de loaders. Los loaders son instancias de LoaderObject (ver la página https://kc.sdos.es/x/pQXLAQ para ver ejemplos visuales).
```js
public enum LoaderType {
    case text(_ style: Style<MBProgressHUD>?)
    case progressBar(_ style: Style<MBProgressHUD>?)
    case progressCircular(_ style: Style<MBProgressHUD>?)
    case progressCircularWithProgress(_ style: Style<M13ProgressViewRing>?)
    case indeterminateCircular(_ style: Style<SDOSLoaderProgress>?)
    case indeterminateLinear(_ style: Style<SDOSLoaderProgress>?)
    case determinateCircular(_ style: Style<SDOSLoaderProgress>?)
    case determinateLinear(_ style: Style<SDOSLoaderProgress>?)
    case nineDots(_ style: Style<DGActivityIndicatorView>?)
    case triplePulse(_ style: Style<DGActivityIndicatorView>?)
    case fiveDots(_ style: Style<DGActivityIndicatorView>?)
    case rotatingSquares(_ style: Style<DGActivityIndicatorView>?)
    case doubleBounce(_ style: Style<DGActivityIndicatorView>?)
    case twoDots(_ style: Style<DGActivityIndicatorView>?)
    case threeDots(_ style: Style<DGActivityIndicatorView>?)
    case ballPulse(_ style: Style<DGActivityIndicatorView>?)
    case ballClipRotate(_ style: Style<DGActivityIndicatorView>?)
    case ballClipRotatePulse(_ style: Style<DGActivityIndicatorView>?)
    case ballClipRotateMultiple(_ style: Style<DGActivityIndicatorView>?)
    case ballRotate(_ style: Style<DGActivityIndicatorView>?)
    case ballZigZag(_ style: Style<DGActivityIndicatorView>?)
    case ballZigZagDeflect(_ style: Style<DGActivityIndicatorView>?)
    case ballTrianglePath(_ style: Style<DGActivityIndicatorView>?)
    case ballScale(_ style: Style<DGActivityIndicatorView>?)
    case lineScale(_ style: Style<DGActivityIndicatorView>?)
    case lineScaleParty(_ style: Style<DGActivityIndicatorView>?)
    case ballScaleMultiple(_ style: Style<DGActivityIndicatorView>?)
    case ballPulseSync(_ style: Style<DGActivityIndicatorView>?)
    case ballBeat(_ style: Style<DGActivityIndicatorView>?)
    case lineScalePulseOut(_ style: Style<DGActivityIndicatorView>?)
    case lineScalePulseOutRapid(_ style: Style<DGActivityIndicatorView>?)
    case ballScaleRipple(_ style: Style<DGActivityIndicatorView>?)
    case ballScaleRippleMultiple(_ style: Style<DGActivityIndicatorView>?)
    case triangleSkewSpin(_ style: Style<DGActivityIndicatorView>?)
    case ballGridBeat(_ style: Style<DGActivityIndicatorView>?)
    case ballGridPulse(_ style: Style<DGActivityIndicatorView>?)
    case rotatingSandglass(_ style: Style<DGActivityIndicatorView>?)
    case rotatingTrigons(_ style: Style<DGActivityIndicatorView>?)
    case tripleRings(_ style: Style<DGActivityIndicatorView>?)
    case cookieTerminator(_ style: Style<DGActivityIndicatorView>?)
    case ballSpinFadeLoader(_ style: Style<DGActivityIndicatorView>?)
}
```

Interfaz pública del manager del loader
```js
public class LoaderManager : NSObject {
    public class func loader(loaderType: LoaderType, inView view: UIView, size: CGSize?) -> LoaderObject
    public class func showLoader(_ loaderObject: LoaderObject?, delay: TimeInterval = 0)
    public class func changeProgress(newValue value: Float, loaderObject: LoaderObject?)
    public class func changeText(_ text: String?, loaderObject: LoaderObject?)
    public class func hideLoader(_ loaderObject: LoaderObject?)
    public class func hideLoaderOfView(_ view: UIView)
    public static func loaderOfView(_ view: UIView) -> [LoaderObject]?
    public static func hideAllLoaders()
}
```

Cualquier acción que se realice sobre un loader será llevada a cabo a partir de `LoaderManager`. Esta clase centraliza todas las operaciones que se realizan sobre los loaders

Creación de loader y asignación de estilo
```js
var loaderObject = LoaderManager.loader(loaderType: .indeterminateCircular(LoaderObject.style.styleSDOSLoaderProgress), size: size, inView: view)
```

Durante la creación del tipo de loader se puede asignar un estilo para personalizar su componente. En el ejemplo se ha creado un estilo sobre el componente `LoaderObject`, pero se puede crear sobre el propio objeto del loader.
```js
extension LoaderObject {
    enum style {
        static var styleSDOSLoaderProgress: Style<SDOSLoaderProgress> {
            return Style<SDOSLoaderProgress> {
                $0.progressColor = .green
                $0.trackColor = .orange
                $0.trackWidth = 20
            }
        }
    }
}
```

Mostrar loader
```js
LoaderManager.showLoader(loaderObject)
```

Cambiar el texto del loader (Si lo soporta)
```js
LoaderManager.changeText("Cargando", loaderObject: loaderObject)
```

Cambiar el progreso del loader (Si lo soporta). El valor es entre 0 y 1
```js
LoaderManager.changeProgress(newValue: value, loaderObject: loaderObject)
```

Ocultar un loader
```js
LoaderManager.hideLoader(loaderObject)
```

Ocultar todos los loaders de una vista y cargados desde el manager
```js
LoaderManager.hideLoaderOfView(view)
```

Ocultar **todos** los loaders cargados desde el manager
```js
LoaderManager.hideAllLoaders()
```

Adicionalmente, sobre la propia instancia de `LoaderObject` que nos creamos, podemos asignar parámetros adicionales para desactivar y ocultar vistas. Estas acciones se ejecutarán cuando se muestra el loader y cuando se oculta
```js
loaderObject.disableControls = [btnDone]
loaderObject.disableUserInteractionViews = [view]
loaderObject.hideViews = [tableView]
```

## Dependencias
* [MBProgressHUD](https://github.com/jdg/MBProgressHUD) - ~> 1.2
* [M13ProgressSuite](https://github.com/SDOSLabs/M13ProgressSuite.git) - 1.3.0
* [DGActivityIndicatorView](https://github.com/SDOSLabs/DGActivityIndicatorView.git) - 2.2.0
* [SDOSCustomLoader](https://github.com/SDOSLabs/SDOSCustomLoader) - ~> 1.1
* [SDOSSwiftExtension](https://github.com/SDOSLabs/SDOSSwiftExtension) - ~> 1.1

## Referencias
* https://github.com/SDOSLabs/SDOSLoader
