//
//  Command.h
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

#pragma mark Commands

//Base Command
@interface BaseCommand : NSObject
-(void) execute;
-(void) undo;
@end

//First Command
@interface FirstCommand : BaseCommand
{
@private NSString *_originalString;
@private NSString *_currentString;
}
-(id) initWithArguments: (NSString *) anArgument;
-(void) printString;
@end

//Second Command
@interface SecondCommand : BaseCommand
{
@private int _originalNumber;
@private int _currentNumber;
}
-(id) initWithArguments: (int) aNumber;
-(void) printNumber;
@end

#pragma mark Executor

//Command Executor
@interface CommandExecutor : NSObject
{
@private NSMutableArray *_arrayOfCommands;
}
-(void) addCommand:(BaseCommand *) aCommand;
-(void) executeCommands;
-(void) undoAll;
@end

#pragma mark [Application Interface]

//Application Interface
@interface Command : NSObject
@end
