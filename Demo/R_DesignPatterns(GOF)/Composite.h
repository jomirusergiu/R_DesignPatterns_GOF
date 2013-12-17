//
//  Composite.h
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

#import <Foundation/Foundation.h>

#pragma mark Design Parts

//Component
@protocol Designable
- (void) present;
- (void) add:(NSObject<Designable>*)design;
- (NSObject<Designable>*) getDesign:(NSUInteger)index;
@end

//Leaf
@interface Dimentions : NSObject <Designable>
{
    NSString* description;
}
@property (nonatomic, retain) NSString* description;
- (id) initWithDescription:(NSString*)desc;
@end

//Leaf
@interface Materials : NSObject <Designable>
{
    NSString* description;
}
@property (nonatomic, retain) NSString* description;
- (id) initWithDescription:(NSString*)desc;
@end

//Composite
@interface LevelDesign : NSObject <Designable>
{
    NSString*       description;
    NSMutableArray* designs;
}
@property (nonatomic, retain) NSString* description;
- (id) initWithDescription:(NSString*)desc;
@end

#pragma mark Composite [Application Interface]

//Application Interface
@interface Composite : NSObject
@end
