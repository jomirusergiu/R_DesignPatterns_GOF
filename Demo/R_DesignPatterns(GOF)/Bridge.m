//
//  Bridge.m
//  R_DesignPatterns(GOF)
//
//  Created by RocKK on 12/5/13.
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

#import "Bridge.h"

#pragma mark Guns

//Implementator
@implementation Gun
- (void) fire {}
@end

//Concrete Implementator
@implementation Colt
- (void) fire { NSLog(@"with %@", [self class]); }
@end

//Concrete Implementator
@implementation SniperRifle
- (void) fire { NSLog(@"with %@", [self class]); }
@end

#pragma mark Shooters

//Abstraction
@implementation Shooter
@synthesize gun;
- (void) shoot {}
- (void) dealloc
{
    gun = nil;
}
@end

//Refined Abstraction
@implementation Cowboy
- (id) init
{
    if ([super init] != nil)
    {
        gun = [[Colt alloc] init];
    }
    return self;
}
- (void) shoot
{
    NSLog(@"%@ is shooting", [self class]);
    [self.gun fire];
}
@end

//Refined Abstraction
@implementation Sniper
- (id) init
{
    if ([super init] != nil)
    {
        gun = [[SniperRifle alloc] init];
    }
    return self;
}
- (void) shoot
{
    NSLog(@"%@ is shooting", [self class]);
    [self.gun fire];
}
@end


#pragma mark Bridge [Application Interface]

//Application Interface
@implementation Bridge
- (id)init
{
    NSLog(@"Bridge Created");
    
    // using standard "implementations" of gun
    Shooter* cowboy = [Cowboy new];
    Shooter* sniper = [Sniper new];
    [cowboy shoot];
    [sniper shoot];
    
    NSLog(@"Swaping guns.");
    
    // dynamically changing "implementation" of gun
    cowboy.gun = [SniperRifle new];
    sniper.gun = [Colt new];
    [cowboy shoot];
    [sniper shoot];
    
    NSLog(@"\n");
    return self;
}

@end
