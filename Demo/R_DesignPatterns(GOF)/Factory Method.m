//
//  Factory Method.m
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

#import "Factory Method.h"

#pragma mark Products - Drinks

//Product
@implementation Drink
- (void) make {}
@end

//Concrete Product
@implementation BloodyMarryDrink
- (void) make
{
    NSLog(@"%@ done, but from tomato juice, not real blood.", [self class]);
}
@end

//Concrete Product
@implementation MartiniDrink
- (void) make
{
    NSLog(@"%@ done, shaken, not stirred.", [self class]);
}
@end

#pragma mark Creators - Cocktail Shakers

//Creator
@implementation Shaker
- (void) prepare    {}
- (void) makeDrink
{
    [drink make];
}
- (void) dealloc
{
    if (drink != nil)
        drink = nil;
}
@end

//Concrete Creator
@implementation DraculaShaker
- (void) prepare
{
    NSLog(@"%@ preparing drink...", [self class]);
    drink = [BloodyMarryDrink new];
}
@end

//Concrete Creator
@implementation JamesBondShaker
- (void) prepare
{
    NSLog(@"%@ preparing drink...", [self class]);
    drink = [MartiniDrink new];
}
@end

#pragma mark Helpful method

//Client
void createDrink(Shaker* shaker)
{
    [shaker prepare];
    [shaker makeDrink];
}

#pragma mark - Factory Method Init

//Factory Method
@implementation Factory_Method
- (id)init
{
    NSLog(@"Factory Method Created");
    
    Shaker* shaker = [DraculaShaker new];
    createDrink(shaker);
    shaker = nil;
    
    shaker = [JamesBondShaker new];
    createDrink(shaker);
    shaker = nil;
    
    NSLog(@"\n");
    return self;
}

@end
