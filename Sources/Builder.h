//
//  Builder.h
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

#import <Foundation/Foundation.h>

#pragma mark Abstract Car Builder

///Builder
@interface CarBuilder : NSObject
{
    NSMutableString* Car;
}
@property (nonatomic, retain) NSMutableString* Car;

- (void) setSeatNumber;
- (void) setTripComputer;
- (void) setGPS;
- (void) setABS;
- (void) setUltraBrakes;
- (void) setAdvancedEngine;
- (void) setNeon;
@end

#pragma mark FamilyCar Car Builders

//Concrete Builder
@interface FamilyCarBuilder : CarBuilder
@end

#pragma mark SportCar Car Builders

//Concrete Builder
@interface SportCarBuilder : CarBuilder
@end

#pragma mark Assembler

//Director
@interface CarAssembler : NSObject
{
    CarBuilder* carBuilder;
}
@property (nonatomic, retain) CarBuilder* carBuilder;
- (void) createCar;
- (NSString*) getCar;
@end

#pragma mark Builder [Application Interface]

//Client [Application Interface]
@interface Builder : NSObject
@end
