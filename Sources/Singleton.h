//
//  Singleton.h
//  R_DesignPatterns(GOF)
//
//  Created by RocKK on 12/4/13.
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
//  THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS OR
//  IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
//  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.

#import <Foundation/Foundation.h>

#pragma mark Singleton God

//Singleton
@interface God : NSObject
{
    NSString* name;
}
@property (nonatomic, retain) NSString* name;
+ (God*) getInstance;
@end

#pragma mark - Singleton [Application Interface]

//Application [Singleton Interface]
@interface Singleton : NSObject
@end
