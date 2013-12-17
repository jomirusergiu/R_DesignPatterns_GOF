//
//  Memento.h
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

#pragma mark Originator

//OriginatorState
@interface OriginatorState : NSObject
@property (nonatomic) int intValue;
@property (nonatomic) NSString *stringValue;
@end

//Originator
@interface Originator : NSObject
{
@private OriginatorState *_localState;
}

-(void) changeValues;
-(OriginatorState *) getState;
-(void) setState:(OriginatorState *)oldState;
@end

#pragma mark State Saver

//State Saver
@interface StateSaver : NSObject
{
@private OriginatorState *_localState;
}

-(id) initWithState:(OriginatorState *)state;
-(OriginatorState*) getState;
@end

#pragma mark Caretaker

//Caretaker
@interface Caretaker : NSObject
{
@private Originator *_originator;
@private StateSaver *_stateSaver;
}

-(void) changeValue;
-(void) saveState;
-(void) loadState;
@end

#pragma mark [Application Interface]

//Application Interface
@interface Memento : NSObject
@end
