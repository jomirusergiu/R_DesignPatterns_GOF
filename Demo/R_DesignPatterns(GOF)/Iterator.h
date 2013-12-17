//
//  Iterator.h
//  R_DesignPatterns(GOF)
//
//  Created by RocKK on 12/17/13.
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

#pragma mark - Iterators

//Iterator
@interface BasicEnumerator : NSEnumerator
-(id)initWithItems:(NSMutableArray *)anItems;
-(NSArray *)allObjects;
-(id) nextObject;
@end

//BadItemsEnumerator
@interface BadItemsEnumerator : BasicEnumerator
{
@private NSMutableArray *itemsArray;
@private NSEnumerator *internalEnumerator;
}
@end

//GoodItemsEnumerator
@interface GoodItemsEnumerator : BasicEnumerator
{
@private NSMutableArray *itemsArray;
@private NSEnumerator *internalEnumerator;
}
@end

#pragma mark - Aggregate

//Item In Shop
@interface ItemInShop : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic) BOOL isBroken;
-(id) initWithArgs:(NSString *)aName andQualityBroken:(BOOL)isBroken;
@end

//Shop Warehouse
@interface ShopWarehouse : NSObject
{
@private NSMutableArray *goods;
@private GoodItemsEnumerator *goodItemsEnumerator;
@private BadItemsEnumerator *badItemsEnumerator;
}
-(void) addItem:(ItemInShop *)anItem;
-(NSEnumerator *) getBrokenItemsEnumerator;
-(NSEnumerator *) getGoodItemsEnumerator;
@end

#pragma mark [Application Interface]

//Application Interface
@interface Iterator : NSObject
@end
