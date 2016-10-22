//  FICHERO AUTOGENERADO - NO MODIFICAR
//  KZBootstrapConstants.h
//
//  Created by SDOS on 10/22/2016.
//  Copyright (c) 2016 SDOS. All rights reserved.
//

#if !defined(__has_include)
    #error "SDOS won't import anything if your compiler doesn't support __has_include. Please import the headers individually."
#else
    #if __has_include(<KZBootstrap/KZBootstrap.h>)
        #import <KZBootstrap/KZBootstrap.h>

        #define KZ_wsBaseUrl [KZBootstrap envVariableForKey:@"wsBaseUrl"]
        #define KZ_octopushMode [KZBootstrap envVariableForKey:@"octopushMode"]
        #define KZ_googleAnalyticsKey [KZBootstrap envVariableForKey:@"googleAnalyticsKey"]
        #define KZ_showSelectedEnvironmentsOnLoad [KZBootstrap envVariableForKey:@"showSelectedEnvironmentsOnLoad"]
    #endif
#endif  // defined(__has_include)

