//
//  Visitor.h
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

#import <Foundation/Foundation.h>

#pragma mark Basic Visitor

//Basic Visitor
@protocol BasicVisitor
-(void) visit:(id)anObject;
@end

//Warehouse Item
@interface WarehouseItem : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic) BOOL isBroken;
@property (nonatomic) int price;
-(id) initWithArgs:(NSString *)aName andQuality:(BOOL) isBrokenState andPrice:(int)aPrice;
@end

//Warehouse
@interface Warehouse : NSObject
{
@private NSMutableArray *_itemsArray;
}
-(void) addItem:(WarehouseItem *) anItem;
-(void) accept:(id) visitor;
@end

#pragma mark Visitors

//Quality Checker Visitor
@interface QualityCheckerVisitor : NSObject
@end

//Price Checker Visitor
@interface PriceCheckerVisitor : NSObject
@end

#pragma mark [Application Interface]

//[Application Interface]
@interface Visitor : NSObject
@end
