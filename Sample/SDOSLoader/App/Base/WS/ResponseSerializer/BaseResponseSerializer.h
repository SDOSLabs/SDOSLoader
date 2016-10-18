//
//  BaseResponseSerializer.h
//  BaseProject
//
//  Created by Rafael Fernandez Alvarez on 19/11/15.
//  Copyright © 2015 SDOS. All rights reserved.
//

#import "GenericResponseSerializer.h"

@interface BaseJSONResponseSerializer : GenericJSONResponseSerializer

@end

@interface BaseHTTPResponseSerializer : GenericHTTPResponseSerializer

@end

@interface BaseXMLParserResponseSerializer : GenericXMLParserResponseSerializer

@end

@interface BasePropertyListResponseSerializer : GenericPropertyListResponseSerializer

@end

@interface BaseImageResponseSerializer : GenericImageResponseSerializer

@end

@interface BaseCompoundResponseSerializer : GenericCompoundResponseSerializer

@end