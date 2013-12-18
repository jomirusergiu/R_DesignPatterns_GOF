//
//  Interpreter.m
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

#import "Interpreter.h"

#pragma mark - Context

//Context
@implementation Context
@end

#pragma mark - Structural Example

//Interpreter pattern -- Structural example
//Abstract Expression
@implementation AbstractExpression
-(void)InterpretFrom:(Context *)context{}
@end

//Terminal Expression
@implementation TerminalExpression
-(void)InterpretFrom:(Context *)context
{
    NSLog(@"Teminal");
}
@end

//NonTerminal Expression
@implementation NonTerminalExpression
-(void)InterpretFrom:(Context *)context
{
    NSLog(@"NonTeminal");
}
@end

#pragma mark - Real World Example

//Interpreter pattern -- Real World example
//Real Abstract Expression
@implementation RealAbstractExpression

-(void)InterpretFrom:(Context *)context
{
    if ([context Input].length == 0)
        return;
    while ([[context Input] hasPrefix:_Nine])
    {
        context.Output = [NSString stringWithFormat:@"%ld", [context.Output integerValue]+  (9*_Multiplier)];
        NSRange range = [context.Input rangeOfString:_Nine];
        context.Input = [context.Input stringByReplacingCharactersInRange:range withString:@""];
    }
    while ([[context Input] hasPrefix:_Four])
    {
        context.Output = [NSString stringWithFormat:@"%ld", [context.Output integerValue]+  (4*_Multiplier)];
        NSRange range = [context.Input rangeOfString:_Four];
        context.Input = [context.Input stringByReplacingCharactersInRange:range withString:@""];
    }
    while ([[context Input] hasPrefix:_Five])
    {
        context.Output = [NSString stringWithFormat:@"%ld", [context.Output integerValue]+  (5*_Multiplier)];
        NSRange range = [context.Input rangeOfString:_Five];
        context.Input = [context.Input stringByReplacingCharactersInRange:range withString:@""];
    }
    
    while ([[context Input] hasPrefix:_One])
    {
        context.Output = [NSString stringWithFormat:@"%ld", [context.Output integerValue]+  (1*_Multiplier)];
        NSRange range = [context.Input rangeOfString:_One];
        context.Input = [context.Input stringByReplacingCharactersInRange:range withString:@""];
    }
}
@end

//Terminal Expression
@implementation OneExpression
-(void)InterpretFrom:(Context *)context
{
    super.One = @"I";
    super.Four = @"IV";
    super.Five = @"V";
    super.Nine = @"IX";
    super.Multiplier = 1;
    [super InterpretFrom:context];
}
@end

//Terminal Expression
@implementation TenExpression
-(void)InterpretFrom:(Context *)context
{
    super.One = @"X";
    super.Four = @"XL";
    super.Five = @"L";
    super.Nine = @"XC";
    super.Multiplier = 10;
    [super InterpretFrom:context];
}
@end

//Terminal Expression
@implementation HundredExpression
-(void)InterpretFrom:(Context *)context
{
    super.One = @"C";
    super.Four = @"CD";
    super.Five = @"D";
    super.Nine = @"CM";
    super.Multiplier = 100;
    [super InterpretFrom:context];
}
@end

//Terminal Expression
@implementation ThousandExpression
-(void)InterpretFrom:(Context *)context
{
    super.One = @"M";
    super.Four = @" ";
    super.Five = @" ";
    super.Nine = @" ";
    super.Multiplier = 1000;
    [super InterpretFrom:context];
}
@end

#pragma mark [Application Interface]

//Application Interface
@implementation Interpreter

-(void)structuralExample{
    NSLog(@"Structural Example:");
    
    Context *context = [Context new];
    TerminalExpression *terminal = [TerminalExpression new];
    NonTerminalExpression *nonTerminal = [NonTerminalExpression new];
    NSMutableArray *array = [NSMutableArray new];
    [array addObject:terminal];
    [array addObject:nonTerminal];
    
    for (AbstractExpression* exp in array) {
        [exp InterpretFrom:context];
    }
    
}

-(void)realWorldExample{
    NSLog(@"Real World Example:");
    
    NSString *roman = @"MCMXXXVIII";
    Context *context = [Context new];
    OneExpression *oneExpression = [OneExpression new];
    TenExpression *tenExpression = [TenExpression new];
    HundredExpression *hundredExpression = [HundredExpression new];
    ThousandExpression *thousandExpression = [ThousandExpression new];
    NSMutableArray *array = [NSMutableArray new];
    [array addObject:thousandExpression];
    [array addObject:hundredExpression];
    [array addObject:tenExpression];
    [array addObject:oneExpression];
    context.Input = roman;
    
    for (RealAbstractExpression* exp in array) {
        [exp InterpretFrom:context];
    }
    NSLog(@"Roman Number %@ would be %@ in decimal", roman, context.Output);
}

- (id)init
{
    NSLog(@"Interpretator Created");
    
    [self structuralExample];
    [self realWorldExample];
   
    NSLog(@"\n");
    return self;
}
@end
