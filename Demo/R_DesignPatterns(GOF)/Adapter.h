//
//  Adapter.h
//  R_DesignPatterns(GOF)
//
//  Created by RocKKon 12/4/13.
//  Copyright (c) 2013 RocKK.
//  All rights reserved.
//
//  Redistribution and use in source and binary forms are permitted
//  provided that the above copyright notice and this paragraph are
//  duplicated in all such forms and that any documentation,
//  advertising materials, and other materials related to such
//  distribution and use acknowledge that the software was developed
//  by the RocKK.  The name of the
//  RocKK may not be used to endorse or promote products derived
//  from this software without specific prior written permission.
//  THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS OR
//  IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
//  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.

#import <Foundation/Foundation.h>

#pragma mark - Chargers

//Charger
@interface Charger : NSObject
-(void) charge;
@end

//Euro
@protocol EuropeanLaptopChargerDelegate
-(void) chargetLaptopRoundHoles:(Charger *)charger;
@end

@interface EuropeanLaptopCharger : Charger <EuropeanLaptopChargerDelegate>
{
    @private id<EuropeanLaptopChargerDelegate> _delegate;
}
@property (nonatomic, strong) id<EuropeanLaptopChargerDelegate> delegate;
@end

//US
@interface USALaptopCharger : NSObject
-(void) chargeLaptopRectHoles:(Charger *) charger;
@end

#pragma mark Adapter

//US_TO_EU_Adapter
@interface USALaptopEuropeanAdapter : Charger <EuropeanLaptopChargerDelegate>
@property (nonatomic, strong) USALaptopCharger *usaCharger;
-(id) initWithUSALaptopCharger:(USALaptopCharger *) charger;
-(void) charge;
@end

#pragma mark - Adapter [Application Interface]

//Application [Adapter Interface]
@interface Adapter : NSObject
@end
