//
//  Interpreter.h
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

#import <Foundation/Foundation.h>

#pragma mark - Context

//Context
@interface Context : NSObject
@property (nonatomic, retain) NSString *Input;
@property (nonatomic, retain) NSString *Output;
@end

#pragma mark - Structural Example

//Interpreter pattern -- Structural example
//Abstract Expression
@interface AbstractExpression : NSObject
-(void)InterpretFrom:(Context*)context;
@end

//Terminal Expression
@interface TerminalExpression : AbstractExpression
-(void)InterpretFrom:(Context*)context;
@end

//NonTerminal Expression
@interface NonTerminalExpression : AbstractExpression
-(void)InterpretFrom:(Context*)context;
@end

#pragma mark - Real World Example

// Interpreter pattern -- Real World example
//Real Abstract Expression
@interface RealAbstractExpression : NSObject
-(void)InterpretFrom:(Context*)context;
@property (nonatomic, retain) NSString *One;
@property (nonatomic, retain) NSString *Four;
@property (nonatomic, retain) NSString *Five;
@property (nonatomic, retain) NSString *Nine;
@property (nonatomic) int Multiplier;
@end

//Thousand Expression
@interface ThousandExpression : RealAbstractExpression
-(void)InterpretFrom:(Context*)context;
@end

//Hundred Expression
@interface HundredExpression : RealAbstractExpression
-(void)InterpretFrom:(Context*)context;
@end

//Ten Expression
@interface TenExpression : RealAbstractExpression
-(void)InterpretFrom:(Context*)context;
@end

//One Expression
@interface OneExpression : RealAbstractExpression
-(void)InterpretFrom:(Context*)context;
@end

#pragma mark [Application Interface]

//Application Interface
@interface Interpreter : NSObject
@end
