//
//  Iterator.m
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

#import "Iterator.h"

#pragma mark - Iterators

//Iterator
@implementation BasicEnumerator
-(id)initWithItems:(NSMutableArray *)anItems
{
    return nil;
}
-(NSArray *)allObjects
{
    return nil;
}
-(id) nextObject
{
    return nil;
}
@end

//BadItemsEnumerator
@implementation BadItemsEnumerator
-(id) initWithItems:(NSMutableArray *)anItems
{
    self = [super init];
    itemsArray = [NSMutableArray new];
    for ( ItemInShop *item in anItems)
    {
        if (item.isBroken)
            [itemsArray addObject:item];
    }
    internalEnumerator = [itemsArray objectEnumerator];
    
    return self;
}

-(NSArray *)allObjects
{
    return itemsArray;
}

-(id) nextObject
{
    return [internalEnumerator nextObject];
}
@end

//GoodItemsEnumerator
@implementation GoodItemsEnumerator

-(id) initWithItems:(NSMutableArray *)anItems
{
    self = [super init];
    itemsArray = [NSMutableArray new];
    for ( ItemInShop *item in anItems)
    {
        if (!item.isBroken)
            [itemsArray addObject:item];
    }
    internalEnumerator = [itemsArray objectEnumerator];
    
    return self;
}
-(NSArray *)allObjects
{
    return itemsArray;
}
-(id) nextObject
{
    return [internalEnumerator nextObject];
}
@end

#pragma mark - Aggregate

//Item In Shop
@implementation ItemInShop
-(id) initWithArgs:(NSString *)aName andQualityBroken:(BOOL)isBroken
{
    self = [super init];
    self.name = aName;
    self.isBroken = isBroken;
    return self;
}
@end

//Shop Warehouse
@implementation ShopWarehouse
-(id) init
{
    self = [super init];
    
    goods = [NSMutableArray new];
    
    return self;
}

-(void) addItem:(ItemInShop *)anItem
{
    [goods addObject:anItem];
}

-(NSObject *) getBrokenItemsEnumerator
{
    badItemsEnumerator = [[BadItemsEnumerator alloc] initWithItems:goods];
    return badItemsEnumerator;
}

-(NSObject *) getGoodItemsEnumerator
{
    goodItemsEnumerator = [[GoodItemsEnumerator alloc] initWithItems:goods];
    return goodItemsEnumerator;
}
@end

#pragma mark [Application Interface]

//Application Interface
@implementation Iterator
- (id)init
{
    NSLog(@"Iterator Created");
    
    ShopWarehouse *shopWarehouse = [ShopWarehouse new];
    [shopWarehouse addItem:[[ItemInShop alloc]initWithArgs:@"Item1" andQualityBroken:NO]];
    [shopWarehouse addItem:[[ItemInShop alloc]initWithArgs:@"Item2" andQualityBroken:NO]];
    [shopWarehouse addItem:[[ItemInShop alloc]initWithArgs:@"Item3" andQualityBroken:YES]];
    [shopWarehouse addItem:[[ItemInShop alloc]initWithArgs:@"Item4" andQualityBroken:YES]];
    [shopWarehouse addItem:[[ItemInShop alloc]initWithArgs:@"Item5" andQualityBroken:NO]];
    
    GoodItemsEnumerator *goodIterator = (id)[shopWarehouse getGoodItemsEnumerator];
    BadItemsEnumerator *badIterator = (id)[shopWarehouse getBrokenItemsEnumerator];
    ItemInShop *element;
    
    while (element = [goodIterator nextObject])
        NSLog(@"Good Item = %@", element.name);
    while (element = [badIterator nextObject])
        NSLog(@"Bad Item = %@", element.name);
    
    NSLog(@"\n");
    return self;
}
@end
