//
//  State.m
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

#import "State.h"

#pragma mark States

//SateLike
@implementation StateLike
- (void) writeName:(StateContext*) context andString:(NSString*)stringName{};
@end

//StateA
@implementation StateA
-(void)writeName:(StateContext *)context andString:(NSString *)name{
    NSLog(@"%@", [name lowercaseString]);
    [context setState:[StateB new]];
}
@end

//StateB
@implementation StateB
-(void)writeName:(StateContext *)context andString:(NSString *)name{
    NSLog(@"%@", [name uppercaseString]);
    if(++i > 1)
        [context setState:[StateA new]];
}
@end

#pragma mark Context

//Context
@implementation StateContext
- (id)init
{
    myState = [StateA new];
    return self;
}
- (void) setState:(StateLike*)newState{
    myState = newState;
}
- (void) writeName:(NSString*)name{
    [myState writeName:self andString:name];
}
@end

#pragma mark [Application Interface]

//Application Interface
@implementation State
- (id)init
{
    NSLog(@"State Created");
    
    StateContext *stateContext = [StateContext new];
    [stateContext writeName:@"Sunday"];
    [stateContext writeName:@"Monday"];
    [stateContext writeName:@"Tuesday"];
    [stateContext writeName:@"Wednesday"];
    [stateContext writeName:@"Thursday"];
    [stateContext writeName:@"Friday"];
    [stateContext writeName:@"Saturday"];
    
    NSLog(@"\n");
    return self;
}
@end
