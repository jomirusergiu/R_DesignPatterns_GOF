//
//  ViewController.m
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

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //======================================================================================//
    //Creational                                                                            //
    //Creational patterns are ones that create objects for you, rather than having you      //
    //instantiate objects directly. This gives your program more flexibility in deciding    //
    //which objects need to be created.                                                     //
    //======================================================================================//
    
    //Create Abstract Factory [groups object factories that have a common theme]
    //The essence of the Abstract Factory Pattern is to "Provide an interface for creating families of related or dependent objects without specifying their concrete classes."
    //It should render a button and a window in either a Linux style or iOS style depending on which kind of factory was used. Note that the Application has no idea what kind of GUIFactory it is given or even what kind of Button that factory creates
    [AbstractFactory new];
    
    //Create Builder [constructs complex objects by separating construction and representation]
    //The intent of the Builder design pattern is to separate the construction of a complex object from its representation. By doing so, the same construction process can create different representations.
    //We have a Car class. The problem is that a car has many options. The combination of each option would lead to a huge list of constructors for this class. So we will create a builder class, CarBuilder. We will send to the CarBuilder each car option step by step and then construct the final car with the right options.
    [Builder new];
    
    //Factory method [creates objects without specifying the exact class to create]
    //The essence of this pattern is to "Define an interface for creating an object, but let the classes that implement the interface decide which class to instantiate. The Factory method lets a class defer instantiation to subclasses."
    //We have several types of drinks, but we don't want to handle each concrete product, for universality we want to operate only with Product Interface, so we'll create a creator for concrete products which will handle them. So we'll just have to tell wich creator should create our drink.
    [Factory_Method new];
    
    //Prototype [creates objects by cloning an existing object]
    //Specifies the types of objects using an instance of the prototype and creates new objects by copying this prototype. Simply put, this pattern creates objects via cloning instead of creating another object using constructor.
    //In this example we have two warrior concrete prototypes which will be cloned to create two different warriors, which have different types aswell.
    [Prototype new];
    
    //Singleton [restricts object creation for a class to only one instance]
    //In software engineering, the singleton pattern is a design pattern that restricts the Instantiation of a class to one object. This is useful when exactly one object is needed to coordinate actions across the system. The concept is sometimes generalized to systems that operate more efficiently when only one object exists, or that restrict the instantiation to a certain number of objects. The term comes from the mathematical concept of a singleton.
    //We have a singleton class God, we'll try to instantiate it several times let's see what happens.
    [Singleton new];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
