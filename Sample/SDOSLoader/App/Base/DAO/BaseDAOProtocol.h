//
//  BaseDAOProtocol.h
//  BaseProject
//
//  Created by Rafael Fernandez Alvarez on 19/11/15.
//  Copyright © 2015 SDOS. All rights reserved.
//

#import "GenericDAOProtocol.h"

//Tipos de bloque de salida de los servicios
typedef void (^AFSessionTaskSuccess)(NSURLSessionDataTask *task, id responseObject);
typedef void (^AFSessionTaskFailure)(NSURLSessionDataTask *task, NSError *error);

typedef void (^AFMultipleSessionTaskSuccess)(NSArray *tasks, id responseObject);
typedef void (^AFMultipleSessionTaskFailure)(NSArray *tasks, NSArray *errors);
typedef void (^DatabaseTaskSuccess)(id responseObject);
typedef void (^DatabaseTaskFailure)(NSError *error);
/**
 *  Protocolo para el proveedor de servicios
 */
@protocol BaseDAOServiceProtocol <GenericDAOServiceProtocol>

@end
/**
 *  Protocolo para el proveedor de BBDD
 */
@protocol BaseDAODatabaseProtocol <GenericDAODatabaseProtocol>

@end


