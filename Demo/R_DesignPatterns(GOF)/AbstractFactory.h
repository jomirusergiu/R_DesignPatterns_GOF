//
//  AbstractFactory.h
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

#pragma mark Abstract Widget Family

//Abstract Product
@interface Button : NSObject
@end
//Abstract Product
@interface Window : NSObject
@end
//Abstract Factory
@interface WidgetFactory : NSObject
- (Button*) createButton;
- (Window*) createWindow;
@end

#pragma mark iOS Widget Family

//Concrete Product
@interface iOSButton : Button
@end
//Concrete Product
@interface iOSWindow : Window
@end
//Concrete Factory
@interface iOSWidgetFactory : WidgetFactory
@end

#pragma mark Linux Widget Family

//Concrete Product
@interface LinuxButton : Button
@end
//Concrete Product
@interface LinuxWindow : Window
@end
//Concrete Factory
@interface LinuxWidgetFactory : WidgetFactory
@end

#pragma mark Abstract Factory [Application Interface]

//Application Interface
@interface AbstractFactory : NSObject
@end
