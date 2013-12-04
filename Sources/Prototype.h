//
//  Prototype.h
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

#pragma mark Prototype - Warriors

//Prototype
@interface Warrior : NSObject <NSCopying>
- (void) presentMyself;
@end

//Concrete Prototype
@interface StarWarsWarrior : Warrior
{
    NSString* type;
    NSString* side;
    NSString* weapon;
}
@property (nonatomic, retain) NSString* type;
@property (nonatomic, retain) NSString* side;
@property (nonatomic, retain) NSString* weapon;
- (id) initWithType:(NSString*)hisType side:(NSString*)fightingSide weapon:(NSString*)fightingWeapon;
@end

//Concrete Prototype
@interface Samurai : Warrior
{
    NSString* name;
    NSString* style;
}
@property (nonatomic, retain) NSString* name;
@property (nonatomic, retain) NSString* style;
- (id) initWithName:(NSString*)realName style:(NSString*)kungFuStyle;
@end

#pragma mark Prototype [Application Interface]

//Client [Application Interface]
@interface Prototype : NSObject
@end
