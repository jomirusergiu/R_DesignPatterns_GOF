//
//  Mediator.m
//  R_DesignPatterns(GOF)
//
//  Created by RocKK on 12/17/13.
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
//  THIS SOFTWARE IS PROVIDED ''AS IS'' AND WITHOUT ANY EXPRESS OR
//  IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
//  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.

#import "Mediator.h"
@implementation SmartHousePart

#pragma mark Colleague

//Colleague
-(id) initWithCore:(CentrallProcessor *)processor
{
    self = [super init];
    _processor = processor;
    return self;
}

-(void) numbersChanged
{
    [_processor valueChanged:self];
}
@end

//Concrete Colleague
@implementation Thermometer

-(void)changeTemperatureTo:(int)temperature
{
    NSLog(@"Temperature changed to %d", temperature);
    self.temperature = temperature;
    [self numbersChanged];
}

@end

//Concrete Colleague
@implementation ConditioningSystem
-(void)startCondition
{
     NSLog(@"Conditioning System starts conditioning with new temperature");
}
@end

#pragma mark Mediator

//Medator
@implementation CentrallProcessor
-(void) valueChanged:(SmartHousePart *) aPart
{
    NSLog(@"Some value changed! Central Processor needs to detect which module had changes!");
    
    //Detecting if changes were done by thermometer
    if ( [aPart isKindOfClass:[Thermometer class]])
    {
        NSLog(@"Central Processor detected that thermometer module changed temperature");
        NSLog(@"Central Processor sends command to the conditioning system.");
        [[self _condSystem] startCondition];
    }
}
@end

#pragma mark [Application Interface]

//Application Interface
@implementation Mediator
- (id)init
{
    NSLog(@"Mediator Created");
    
    CentrallProcessor *proccessor = [CentrallProcessor new];
    Thermometer *therm = [[Thermometer alloc] initWithCore:proccessor];
    ConditioningSystem *condSystem = [[ConditioningSystem alloc] initWithCore:proccessor];
    
    proccessor._condSystem = condSystem;
    proccessor._thermometer = therm;
    
    [therm changeTemperatureTo:45];
    
    NSLog(@"\n");
    return self;
}
@end
