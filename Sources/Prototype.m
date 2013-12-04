//
//  Prototype.m
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

#import "Prototype.h"

#pragma mark Prototype - Warriors

//Prototype
@implementation Warrior
- (void) presentMyself
{
    NSLog(@"Just a warrior");
}
- (id)copyWithZone:(NSZone *)zone
{
    Warrior* warrior = [[Warrior allocWithZone:zone] init];
    return  warrior;
}
@end

//Concrete Prototype
@implementation StarWarsWarrior
@synthesize type, side, weapon;
- (id) initWithType:(NSString*)hisType side:(NSString*)fightingSide weapon:(NSString*)fightingWeapon
{
    if ([super init] != nil)
    {
        self.type = hisType;
        self.side = fightingSide;
        self.weapon = fightingWeapon;
    }
    return self;
}
- (id)copyWithZone:(NSZone *)zone
{
    StarWarsWarrior* warrior = [[StarWarsWarrior allocWithZone:zone] initWithType:self.type side:self.side weapon:self.weapon];
    return warrior;
}
- (void) presentMyself
{
    NSLog(@"I'm %@, fighting on %@ and I'll kill you with my %@.", self.type, self.side, self.weapon);
}
- (void) dealloc
{
    type = nil;
    side = nil;
    weapon = nil;
}
@end

//Concrete Prototype
@implementation Samurai
@synthesize name, style;
- (id) initWithName:(NSString*)realName style:(NSString*)kungFuStyle
{
    if ([super init] != nil)
    {
        self.name = realName;
        self.style = kungFuStyle;
    }
    return self;
}
- (id)copyWithZone:(NSZone *)zone
{
    Samurai* warrior = [[Samurai allocWithZone:zone] initWithName:self.name style:self.style];
    return warrior;
}
- (void) presentMyself
{
    NSLog(@"My name is %@. I'm using %@ style, so be aware.", self.name, self.style);
}
- (void) dealloc
{
    name = nil;
    style = nil;
}
@end

#pragma mark Helpful method

//Client - Uses this prototype to create new warrior.
void cloneWarrior(Warrior* warriorPrototype)
{
    Warrior* clonedWarrior = [warriorPrototype copy];
    [clonedWarrior presentMyself];
    NSLog(@"I was cloned from %@ prototype",[warriorPrototype class]);
    clonedWarrior = nil;
}

#pragma mark - Prototype Init

@implementation Prototype
- (id)init
{
    NSLog(@"Prototype Created");
    StarWarsWarrior* sithLord = [[StarWarsWarrior alloc] initWithType:@"Sith Lord" side:@"the Dark Side" weapon:@"Red Lightsaber"];
    Samurai* kenshin = [[Samurai alloc] initWithName:@"Himura Kenshin" style:@"Mitsurugi Ryuu"];
    cloneWarrior(sithLord);
    cloneWarrior(kenshin);
    
    kenshin = nil;
    sithLord = nil;
    
    NSLog(@"\n");
    return self;
}

@end
