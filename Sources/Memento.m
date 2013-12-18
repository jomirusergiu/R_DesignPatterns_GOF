//
//  Memento.m
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

#import "Memento.h"

#pragma mark Originator

//OriginatorState
@implementation OriginatorState
@end

//Originator
@implementation Originator
-(id) init
{
    self = [super init];
    _localState = [OriginatorState new];
    _localState.intValue = 100;
    _localState.stringValue = @"Code Monkey!";
    
    return self;
}

-(void) changeValues
{
    _localState.intValue++;
    _localState.stringValue = [NSString stringWithFormat:@"%@ %@", _localState.stringValue, @"!"];
    NSLog(@"Current state = %i, key = %@", _localState.intValue, _localState.stringValue);
}

-(OriginatorState *) getState
{
    return _localState;
}

-(void) setState:(OriginatorState *)oldState
{
    _localState = oldState;
    
    NSLog(@"State Loaded  = %i, key = %@", _localState.intValue, _localState.stringValue);
}
@end

#pragma mark State Saver

//State Saver
@implementation StateSaver
-(id) initWithState:(OriginatorState *)state
{
    self = [super init];
    
    _localState = [OriginatorState new];
    [_localState setIntValue:state.intValue];
    [_localState setStringValue:state.stringValue];
    
    return self;
}
-(OriginatorState *) getState
{
    return _localState;
}
@end

#pragma mark Caretaker

//Caretaker
@implementation Caretaker
-(void) changeValue
{
    if (!_originator)
        _originator = [Originator new];
    
    [_originator changeValues];
}
-(void) saveState
{
    _stateSaver = [[StateSaver alloc] initWithState:[_originator getState]];
    NSLog(@"State Saved   = %i, key = %@",[[_stateSaver getState] intValue ], [[_stateSaver getState] stringValue ]);
}
-(void) loadState
{
    [_originator setState:[_stateSaver getState]];
}
@end

@implementation Memento
- (id)init
{
    NSLog(@"Memento Created");
    
    Caretaker *careTaker = [Caretaker new];
    [careTaker changeValue];
    [careTaker saveState];
    [careTaker changeValue];
    [careTaker changeValue];
    [careTaker changeValue];
    [careTaker loadState];
    
    NSLog(@"\n");
    return self;
}
@end
