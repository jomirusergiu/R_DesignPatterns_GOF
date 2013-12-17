//
//  ChainOfResponsibility.m
//  R_DesignPatterns(GOF)
//
//  Created by RocKK on 12/9/13.
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

#import "ChainOfResponsibility.h"

#pragma mark Items

//Basic Item
@implementation BasicItem
@end

//Toy
@implementation Toy
@end

//Electronics
@implementation Electronics
@end

//Trash
@implementation Trash
@end

#pragma mark Handlers

//Handler
@implementation BasicHandler
-(void)handleItem:(BasicItem *)item{}
@end

//Toy Handler
@implementation ToysHandler
-(void) handleItem:(BasicItem *)item
{
    if ([item isKindOfClass:[Toy class]])
    {
        NSLog(@"Toy found. Handling");
    }
    else
    {
        NSLog(@"Toy not found. Handling using next handler");
        [self.nextHandler handleItem:item];
    }
}
@end

//Electronics Handler
@implementation ElectronicsHandler
-(void) handleItem:(BasicItem *)item
{
    if ([item isKindOfClass:[Electronics class]])
    {
        NSLog(@"Electronics found. Handling");
    }
    else
    {
        NSLog(@"Electronics not found. Handling using next handler");
        [self.nextHandler handleItem:item];
    }
}
@end

//Trash Handler
@implementation TrashHandler

-(void) handleItem:(BasicItem *)item
{
    NSLog(@"Found undefined item. Destroying");
}
@end

#pragma mark [Application Interface]

//Application Interface
@implementation ChainOfResponsibility
- (id)init
{
    NSLog(@"Chain Of Resposibility Created");
    
    //Alloc items and handlers
    BasicItem *toy = [Toy new];
    BasicItem *electronic = [Electronics new];
    BasicItem *trash = [Trash new];
    BasicHandler *toysHandler = [ToysHandler new];
    BasicHandler *electronicsHandler = [ElectronicsHandler new];
    BasicHandler *otherItemHandler = [TrashHandler new];
    
    //Setting chain of responsiblity
    electronicsHandler.nextHandler = otherItemHandler;
    toysHandler.nextHandler = electronicsHandler;
    
    //Handling
    [toysHandler handleItem:toy];
    [toysHandler handleItem:electronic];
    [toysHandler handleItem:trash];
    
    NSLog(@"\n");
    return self;
}
@end
