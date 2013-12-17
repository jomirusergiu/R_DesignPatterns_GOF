//
//  Flyweight.h
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

#import <Foundation/Foundation.h>

#pragma mark Basic Unit

//Basic Unit
@interface BasicUnit : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic) int health;
@property (nonatomic, strong) UIImage *image;
@end

#pragma mark FlyweightImageFactory

//FlyweightImageFactory
@interface FlyweightImageFactory : NSObject
+(UIImage *) getImage:(NSString *)imageName;
@end

#pragma mark Concrete Units

//Dragon
@interface Dragon : BasicUnit
@end

//Goblin
@interface Goblin : BasicUnit
@end

#pragma mark Composite [Application Interface]

//Application Interface
@interface Flyweight : NSObject
@end
