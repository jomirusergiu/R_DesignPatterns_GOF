//
//  Observer.h
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

#pragma mark Standard Observer

//Standard Observer
@protocol StandardObserver <NSObject>
-(void) valueChanged:(NSString *)valueName newValue:(NSString *) newValue;
@end

//Standard Subject
@protocol StandardSubject <NSObject>
-(void) addObserver:(id<StandardObserver>) observer;
-(void) removeObserver:(id<StandardObserver>) observer;
-(void) notifyObjects;
@end

//Standard Subject Implementation
@interface StandardSubjectImplementation : NSObject <StandardSubject>
{
@private NSString *_valueName;
@private NSString *_newValue;
}
@property (nonatomic, strong) NSMutableSet *observerCollection;
-(void)changeValue:(NSString *)valueName andValue:(NSString *) newValue;
@end

//Some Subscriber
@interface SomeSubscriber : NSObject <StandardObserver>
@end

//Other Subscrber
@interface OtherSubscriber : NSObject <StandardObserver>
@end

#pragma mark KVO

//KVO Subject
@interface KVOSubject : NSObject
@property (nonatomic, strong) NSString *changeableProperty;
@end

//KVO Observer
@interface KVOObserver : NSObject
@end

#pragma mark [Application Interface]

//Application Interface
@interface Observer : NSObject
@end
