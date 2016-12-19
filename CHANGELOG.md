## [2.0 Soporte para tvOS y eliminación de las dependencias de M13ProgressSuite y MaterialControlCustom](http://git.sdos.es/ios/SDOSLoader/tree/v1.0.0)

La eliminación de la dependencia con **M13ProgressSuite** ha supuesto los siguientes cambios:

- Dejamos de tener el progress que responde a progreso circular con progreso que respondía al tipo "LoaderTypeProgressCircularWithProgress".

La eliminación de la dependencia de con **MaterialControlCustom** ha supuesto los siguientes cambios importantes:

- Las clases: MDProgressLayer, MDProgress, UIViewHelper, MDConstants, UIColorHelper, MDCircularProgressLayer, MDLinearProgressLayer pasan a llamarse igual pero con el nombre de la empresa delante. 
Ej: MDProgressLayer --> SDOSMDProgressLayer

Para editar los procesos, debemos llamar a la clase SDOSMDProgress.

```objective-c
@implementation SDOSMDProgress (Design)

- (void) loaderCustomizationInitWithType:(NSString *) loaderType tag:(NSInteger) tag {

    switch (tag) {

        case LOADER_TAG_CUSTOMIZED_LOADER: {

            if ([loaderType isEqualToString: LoaderTypeIndeterminateCircular]) {

                self.progressColor = [UIColor greenColor];

                self.trackColor = [UIColor orangeColor];

                self.trackWidth = 20;
            }

        } break;

        default:

            break;
    }
}

@end
```

## [1.0.0 Primera versión](http://git.sdos.es/ios/SDOSLoader/tree/v1.0.0)

- Separación de la parte del proyecto CoreiOS original que afecta al módulo de los loaders