//
//  Decorator.m
//  R_DesignPatterns(GOF)
//
//  Created by RocKK on 12/6/13.
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

#import "Decorator.h"

#pragma mark ChristmasTree

//Concrete Component
@implementation ChristmasTree
- (NSString*) show
{
    return [NSString stringWithFormat:@"I'm a %@", self.class];
}
@end

#pragma mark Christmas Tree Decorators

//Decorator
@implementation PrettyDecorator
@synthesize component;
- (id) initWithComponent:(NSObject<ChristmasDecoration>*)decoration
{
    if ([super init] != nil)
    {
        self.component = decoration;
    }
    return self;
}
- (NSString*) show
{
    return [component show];
}
- (void) dealloc
{
    component = nil;
}
@end

//Concrete Decorator
@implementation ChristmasTreeDecorations
- (NSString*) show
{
    NSString* parentDescription = [component show];
    return [NSString stringWithFormat:@"%@ with %@", parentDescription, self.class];
}
@end

//Concrete Decorator
@implementation ChristmasTreeLights
- (NSString*) show
{
    NSString* parentDescription = [component show];
    return [NSString stringWithFormat:@"%@ and beautiful %@", parentDescription, self.class];
}
@end

#pragma mark Helpful function

NSObject<ChristmasDecoration>* createChristmasTree()
{
    return [[ChristmasTreeLights alloc] initWithComponent:
             [[ChristmasTreeDecorations alloc] initWithComponent:
               [ChristmasTree new] ]];
}

#pragma mark [Application Interface]

//Application Interface
@implementation Decorator
- (id)init
{
    NSLog(@"Decorator Created");
    
    NSObject<ChristmasDecoration>* christmasTree = createChristmasTree();
    NSLog(@"%@", [christmasTree show]);
    
    NSLog(@"\n");
    return self;
}
@end
