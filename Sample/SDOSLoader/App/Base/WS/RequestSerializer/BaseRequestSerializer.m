//
//  BaseRequestSerializer.m
//  BaseProject
//
//  Created by Rafael Fernandez Alvarez on 19/11/15.
//  Copyright © 2015 SDOS. All rights reserved.
//

#import "BaseRequestSerializer.h"

/**
 *  Interfaz para crear métodos comunes (Métodos estáticos)
 */
@interface BaseRequestSerializerComun : NSObject

@end

@implementation BaseRequestSerializerComun

+ (NSURLRequest *) processRequest:(NSURLRequest *) request {
    return request;
//    NSMutableURLRequest *mutableRequest = [request mutableCopy];
//    return [mutableRequest copy];
}

@end

#pragma mark - AFNetworking

@implementation BaseHTTPRequestSerializer

- (NSURLRequest *)requestBySerializingRequest:(NSURLRequest *)request withParameters:(id)parameters error:(NSError *__autoreleasing  _Nullable *)error {
    return [BaseRequestSerializerComun processRequest:[super requestBySerializingRequest:request withParameters:parameters error:error]];
}

@end

@implementation BaseJSONRequestSerializer

- (NSURLRequest *)requestBySerializingRequest:(NSURLRequest *)request withParameters:(id)parameters error:(NSError *__autoreleasing  _Nullable *)error {
    return [BaseRequestSerializerComun processRequest:[super requestBySerializingRequest:request withParameters:parameters error:error]];
}

@end

@implementation BasePropertyListRequestSerializer

- (NSURLRequest *)requestBySerializingRequest:(NSURLRequest *)request withParameters:(id)parameters error:(NSError *__autoreleasing  _Nullable *)error {
    return [BaseRequestSerializerComun processRequest:[super requestBySerializingRequest:request withParameters:parameters error:error]];
}

@end
