//
//  Strategy.h
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

#pragma mark Strategy

//Basic Strategy
@interface BasicStrategy : NSObject
-(void) actionCharacter1;
-(void) actionCharacter2;
-(void) actionCharacter3;
@end

//Attack Strategy
@interface AttackStrategy : BasicStrategy
@end

//Defence Strategy
@interface DefenceStrategy : BasicStrategy
@end

#pragma mark Player

//Player
@interface Player : NSObject
@property (nonatomic, strong) BasicStrategy *_strategy;
-(void) makeAction;
-(void) changeStrategy:(BasicStrategy *) strategy;
@end

#pragma mark [Application Interface]

//Application Interface
@interface Strategy : NSObject
@end
