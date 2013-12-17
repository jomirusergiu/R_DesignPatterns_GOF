//
//  Mediator.h
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

#import <Foundation/Foundation.h>

#pragma mark Colleague

//Colleague
@class CentrallProcessor;
@interface SmartHousePart : NSObject
{
@private CentrallProcessor *_processor;
}
-(id) initWithCore:(CentrallProcessor *) processor;
-(void) numbersChanged;
@end

//Concrete Colleague
@interface Thermometer : SmartHousePart
@property (nonatomic) int temperature;
-(void)changeTemperatureTo:(int) temperature;
@end

//Concrete Colleague
@interface ConditioningSystem : SmartHousePart
-(void) startCondition;
@end

#pragma mark Mediator

//Medator
@interface CentrallProcessor : NSObject
@property (nonatomic, weak) Thermometer *_thermometer;
@property (nonatomic, weak) ConditioningSystem *_condSystem;
-(void) valueChanged:(SmartHousePart *) aPart;
@end

#pragma mark [Application Interface]

//Application Interface
@interface Mediator : NSObject
@end
