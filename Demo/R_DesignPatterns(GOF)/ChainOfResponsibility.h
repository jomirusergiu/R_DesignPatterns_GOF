//
//  ChainOfResponsibility.h
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

#import <Foundation/Foundation.h>

#pragma mark Items

//Basic Item
@interface BasicItem : NSObject
@end

//Toy
@interface Toy : BasicItem
@end

//Electronics
@interface Electronics : BasicItem
@end

//Trash
@interface Trash : BasicItem
@end

#pragma mark Handlers

//Handler
@interface BasicHandler : NSObject
{
@private BasicHandler *_nextHandler;
}
@property (nonatomic, strong) BasicHandler *nextHandler;
-(void) handleItem:(BasicItem *) item;
@end

//Toy Handler
@interface ToysHandler : BasicHandler
@end

//Electronics Handler
@interface ElectronicsHandler : BasicHandler
@end

//Trash Handler
@interface TrashHandler : BasicHandler
@end

#pragma mark [Application Interface]

//Application Interface
@interface ChainOfResponsibility : NSObject
@end
