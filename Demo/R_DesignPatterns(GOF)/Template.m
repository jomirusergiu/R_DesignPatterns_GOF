//
//  Template.m
//  R_DesignPatterns(GOF)
//
//  Created by RocKK on 12/18/13.
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

#import "Template.h"

#pragma mark Any Phone Template

//Any Phone Template
@implementation AnyPhoneTemplate
-(void) makePhone
{
    NSLog(@"////%@ Creating Product////", [self class]);
    [self takeBox];
    [self takeCamera];
    [self takeMicrophone];
    [self assemble];
}
-(void) takeBox
{
    NSLog(@"Taking a box");
}
-(void) takeCamera
{
    NSLog(@"Taking a camera");
}
-(void) takeMicrophone
{
    NSLog(@"Taking a microphone");
}
-(void) assemble
{
    NSLog(@"Assembling everythig");
}
@end

//iPhone Maker
@implementation iPhoneMaker
-(void) assemble
{
    [self design];
    [super assemble];
}
-(void) design
{
    NSLog(@"Putting label 'Designed in California'");
}
@end

//Android Maker
@implementation AndroidMaker
-(void) assemble
{
    [self addCPU];
    [self addRam];
    [super assemble];
}
-(void) addCPU
{
    NSLog(@"Installing 4 more CPUs");
}
-(void) addRam
{
    NSLog(@"Installing 2Gigs of RAM");
}
@end

#pragma mark [Application Interface]

//[Application Interface]
@implementation Template
- (id)init
{
    NSLog(@"Template Created");
    
    AndroidMaker *android = [[AndroidMaker alloc] init];
    iPhoneMaker *iphone = [[iPhoneMaker alloc] init];
    [android makePhone];
    [iphone makePhone];
    
    NSLog(@"\n");
    return self;
}
@end
