//
//  Adapter.m
//  R_DesignPatterns(GOF)
//
//  Created by RocKK on 12/4/13.
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

#import "Adapter.h"

#pragma mark - Chargers

//Charger
@implementation Charger
-(void) charge
{
    NSLog(@"Laptop is charging");
}
@end

//EU
@implementation EuropeanLaptopCharger
@synthesize delegate = _delegate;

-(id) init
{
    self = [super self];
    self.delegate = self;
    return self;
}
-(void) charge
{
    [_delegate chargetLaptopRoundHoles:self];
    [super charge];
}
-(void) chargetLaptopRoundHoles:(Charger *)charger
{
    NSLog(@"Charge Laptop With 220V, Round Holes!");
}
@end

//US
@implementation USALaptopCharger
-(void) chargeLaptopRectHoles:(Charger *) charger;
{
    NSLog(@"Charge Laptop With 120V, Rect Holes");
}
@end

#pragma mark Adapter

//US_TO_EU_Adapter
@implementation USALaptopEuropeanAdapter
-(id) initWithUSALaptopCharger:(USALaptopCharger *) charger
{
    self = [super init];
    self.usaCharger = charger;
    return self;
}

-(void) chargetLaptopRoundHoles:(Charger *) charger
{
    [self.usaCharger chargeLaptopRectHoles:charger];
}

-(void) charge
{
    EuropeanLaptopCharger *euroCharge = [[EuropeanLaptopCharger alloc] init];
    euroCharge.delegate = self;
    [euroCharge charge];
}
@end

#pragma mark Helpful method

void makeTheLaptopCharge(Charger* aCharger)
{
    [aCharger charge];
}

#pragma mark - Adapter [Application Interface]

//Application [Adapter Interface]
@implementation Adapter
- (id)init
{
    NSLog(@"Adapter Created");
    
    EuropeanLaptopCharger *euroCharger = [EuropeanLaptopCharger new];
    makeTheLaptopCharge(euroCharger);
    euroCharger = nil;
    
    USALaptopCharger *charger = [USALaptopCharger new];
    USALaptopEuropeanAdapter *adapter = [[USALaptopEuropeanAdapter alloc] initWithUSALaptopCharger:charger];
    makeTheLaptopCharge(adapter);
    NSLog(@"\n");
    return self;
}

@end
