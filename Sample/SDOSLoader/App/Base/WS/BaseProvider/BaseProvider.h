//
//  BaseProvider.h
//
//  Created by Rafael Fernandez Alvarez on 10/3/16.
//  Copyright © 2016 SDOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseDAOProtocol.h"
#import "GenericProvider.h"


/**
 *  Interfaz Generica para el provider
 */
@interface BaseProvider : GenericProvider

@end
/**
 *  Interfaz para el proveedor de servicions
 */
@interface BaseServiceProvider : GenericServiceProvider

@end
/**
 *  Interfaz para el proveedor de BBDD
 */
@interface BaseDatabaseProvider : GenericDatabaseProvider

@end

