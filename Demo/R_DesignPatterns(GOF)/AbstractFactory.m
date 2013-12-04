//
//  AbstractFactory.m
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
#import "AbstractFactory.h"

#pragma mark Abstract Widget Family

//Abstract Product
@implementation Button
@end

//Abstract Product
@implementation Window
@end

//Abstract Factory
@implementation WidgetFactory
- (Button*) createButton
{
    return nil;
}
- (Window*) createWindow
{
    return nil;
}
@end

#pragma mark iOS Widget Family

//Concrete Product
@implementation iOSButton
@end

//Concrete Product
@implementation iOSWindow
@end

//Concrete Factory
@implementation iOSWidgetFactory
- (Button*) createButton
{
    return [iOSButton new];
}
- (Window*) createWindow
{
    return [iOSWindow new];
}
@end

#pragma mark Linux Widget Family

//Concrete Product
@implementation LinuxButton
@end

//Concrete Product
@implementation LinuxWindow
@end

//Concrete Factory
@implementation LinuxWidgetFactory
- (Button*) createButton
{
    return [LinuxButton new];
}
- (Window*) createWindow
{
    return[LinuxWindow new];
}
@end

#pragma mark Helpful Functions

//This function uses only interfaces declared in abstract factory and abstract products.
//Instance of class inherited from abstract factory
 
void createWidgets(WidgetFactory* widgetFactory)
{
    Window* window = [widgetFactory createWindow];
    NSLog(@"Window type: %@", [window class]);
    
    Button* Button = [widgetFactory createButton];
    NSLog(@"Button type: %@", [Button class]);
}

#pragma mark Abstract Factory Init

//Abstract Factory
@implementation AbstractFactory
-(id)init{
    
    NSLog(@"Abstract Factory Created");
    
    if([[[UIDevice currentDevice] systemName] isEqualToString:@"iPhone OS"]){
        NSLog(@"iOS detected");
        WidgetFactory* widgetFactory = [iOSWidgetFactory new];
        createWidgets(widgetFactory);
        widgetFactory = nil;
    }
    else if([[[UIDevice currentDevice] systemName] isEqualToString:@"Linux OS"]){
        NSLog(@"Linux detected");
        WidgetFactory *widgetFactory = [LinuxWidgetFactory new];
        createWidgets(widgetFactory);
        widgetFactory = nil;
    }
    else
        NSLog(@"Error your operating system is neither iOS or Linux");
    NSLog(@"\n");
    return self;
}

@end
