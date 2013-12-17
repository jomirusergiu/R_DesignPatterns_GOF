//
//  Composite.m
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

#import "Composite.h"

#pragma mark Design Parts

//Leaf
@implementation Dimentions
@synthesize description;
- (id)   initWithDescription:(NSString *)desc
{
    if ([super init] != nil)
    {
        self.description = desc;
    }
    return self;
}
- (void) present
{
    NSLog(@" - %@ : %@", self.class, [self description]);
}
- (void) add:(NSObject<Designable>*)design
{}
- (NSObject<Designable>*) getDesign:(NSUInteger)index
{
    return nil;
}
- (void) dealloc
{
    description = nil;
}
@end

//Leaf
@implementation Materials
@synthesize description;
- (id)   initWithDescription:(NSString *)desc
{
    if ([super init] != nil)
    {
        self.description = desc;
    }
    return self;
}
- (void) present
{
    NSLog(@" - %@  : %@", self.class, self.description);
}
- (void) add:(NSObject<Designable>*)design
{}
- (NSObject<Designable>*) getDesign:(NSUInteger)index
{ return nil; }
- (void) dealloc
{
    description = nil;
}
@end

//Composite
@implementation LevelDesign
@synthesize description;
- (id) initWithDescription:(NSString*)desc
{
    if ([self init] != nil)
    {
        self.description = desc;
        designs = [[NSMutableArray alloc] init];
    }
    return self;
}
- (void) present
{
    NSLog(@"Presenting design for %@:", self.description);
    NSEnumerator* e = [designs objectEnumerator];
    NSObject<Designable>* object;
    while (object = (NSObject<Designable>*)[e nextObject])
    {
        [object present];
    }
}
- (void) add:(NSObject<Designable>*)design
{
    [designs addObject:(id)design];
}
- (NSObject<Designable>*) getDesign:(NSUInteger)index
{
    return (NSObject<Designable>*)[designs objectAtIndex:index];
}
- (void) dealloc
{
    designs = nil;
}
@end

#pragma mark Design Creation

//Design Creation
NSObject<Designable>* makeHouseDesign()
{
    LevelDesign* house = [[LevelDesign alloc] initWithDescription:@"My House"];
    [house add:[[Dimentions alloc] initWithDescription:@"pretty large"]];
    [house add:[[Materials alloc] initWithDescription:@"extra strong"]];
    [house add:[[LevelDesign alloc] initWithDescription:@"First Floor"]];
    [[house getDesign:2] add:[[Dimentions alloc] initWithDescription:@"high enough"]];
    [[house getDesign:2] add:[[Materials alloc] initWithDescription:@"exclusive"]];
    [house add:[[LevelDesign alloc] initWithDescription:@"Roof"] ];
    [[house getDesign:3] add:[[Materials alloc] initWithDescription:@"glass"]];
    return house;
}


#pragma mark Composite [Application Interface]

//Application Interface
@implementation Composite
- (id)init
{
    NSLog(@"Composite Created");
    
    NSObject<Designable>* houseProject = makeHouseDesign();
    [houseProject present];
    
    NSLog(@"\n");
    return self;
}

@end
