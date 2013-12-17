//
//  Singleton.m
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

#import "Singleton.h"

#pragma mark Single God

//Singleton

@implementation God
static God* god = nil;
@synthesize name;
+ (God*) getInstance
{
    @synchronized(self)
    {
        if (god == nil)
        {
            god = [[super allocWithZone:NULL] init];
        }
    }
    return god;
}
+ (id) allocWithZone:(NSZone *)zone
{
    return [self getInstance];
}
@end

#pragma mark - Application [Singleton Init]

//Application [Singleton Interface]
@implementation Singleton
- (id)init
{
    NSLog(@"Singleton Created");
    
    God* godOfMuslim = [God getInstance];
    godOfMuslim.name = @"Allah";
    God* godOfChristian = [God getInstance];
    godOfChristian.name = @"Jesus";
    God* godOfWar = [God getInstance];
    godOfWar.name = @"Kratos";
    
    if((godOfChristian == godOfMuslim) && (godOfChristian == godOfWar) && (godOfWar == godOfMuslim))
        NSLog(@"All gods are one: %@", [God getInstance].name);
    NSLog(@"\n");
    return self;
}

@end
