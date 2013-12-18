//
//  Flyweight.m
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

#import "Flyweight.h"

#pragma mark Basic Unit

//Basic Unit
@implementation BasicUnit
@end

#pragma mark FlyweightImageFactory

//FlyweightImageFactory
@implementation FlyweightImageFactory
NSMutableDictionary *_imageDictionary;
+(UIImage *)getImage:(NSString *)imageName
{
    if (!_imageDictionary)
        _imageDictionary = [[NSMutableDictionary alloc] init];
    
    if (![_imageDictionary objectForKey:imageName])
    {
        [_imageDictionary setObject:[UIImage imageNamed:[[NSString alloc] initWithFormat:@"%@.jpeg",imageName]] forKey:imageName];
        NSLog(@"Loading reusable image of the %@", imageName);
    }
    
    return [_imageDictionary objectForKey:imageName];
}
@end

#pragma mark Concrete Units

//Dragon
@implementation Dragon
-(id) init
{
    self = [super init];
    self.name = @"Flyweight_Dragon";
    self.health = 150;
    self.image = [FlyweightImageFactory getImage:@"Flyweight_Dragon"];
    return self;
    
}
@end

//Goblin
@implementation Goblin
-(id) init
{
    self = [super init];
    
    self.name = @"Flyweight_Goblin";
    self.health = 20;
    self.image = [FlyweightImageFactory getImage:@"Flyweight_Goblin"];
    return self;
    
}
@end

#pragma mark [Application Interface]

//Application Interface
@implementation Flyweight
- (id)init
{
    NSLog(@"Flyweight Created");
    
    NSMutableArray *units = [[NSMutableArray alloc] init];
    for ( int i = 0 ; i < 50000; i++)
    {
        [units addObject:[[Dragon alloc] init]];
    }
    NSLog(@"50000 instances of dragons created");
    for ( int i = 0 ; i < 50000; i++)
    {
        [units addObject:[[Goblin alloc] init]];
    }
    NSLog(@"50000 instances of goblins created");
    
    NSLog(@"\n");
    return self;
}
@end
