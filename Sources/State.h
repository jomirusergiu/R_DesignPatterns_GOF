//
//  State.h
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

#pragma mark States

@class StateContext;

//SateLike
@interface StateLike : NSObject
- (void) writeName:(StateContext*) context andString:(NSString*)name;
@end

//StateA
@interface StateA : StateLike
@end

//StateB
@interface StateB : StateLike{
@private int i;
}
@end

#pragma mark Context

//Context
@interface StateContext : NSString{
@private StateLike *myState;
}
- (void) setState:(StateLike*)newState;
- (void) writeName:(NSString*)name;
@end

#pragma mark [Application Interface]

//Application Interface
@interface State : NSObject
@end
