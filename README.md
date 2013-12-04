R_DesignPatterns(GOF)
=================

R_DesignPatterns(GOF) is an example project on using and implementation of “Gang Of Four” Design Patterns.

Creational
---------
Creational patterns are ones that create objects for you, rather than having you instantiate objects directly. This gives your program more flexibility in deciding which objects need to be created for a given case.

- Abstract Factory - groups object factories that have a common theme.
- Builder - constructs complex objects by separating construction and representation.
- Factory Method - creates objects without specifying the exact class to create.
- Prototype - creates objects by cloning an existing object.
- Singleton - restricts object creation for a class to only one instance.

Theese aren’t all of them, so don’t go with yelling right away, i’ll add the rest of em as fast as possible, just have some patience, thank you.

UML Diagrams
----------
You can find UML diagrams of implemented patterns inside, hope that you’ll find them useful for getting to know what is going on in the code easier.

Usage
=====

ViewController.h
-------------
```Objective-C
#import "AbstractFactory.h"
#import "Builder.h"
#import "Factory Method.h"
#import "Prototype.h"
#import "Singleton.h"
```

ViewController.m
-------------
```Objective-C
    //======================================================================================//
    //Creational                                                                            //
    //Creational patterns are ones that create objects for you, rather than having you      //
    //instantiate objects directly. This gives your program more flexibility in deciding    //
    //which objects need to be created.                                                     //
    //======================================================================================//
    
    //Create Abstract Factory [groups object factories that have a common theme]
    //The essence of the Abstract Factory Pattern is to "Provide an interface for creating families of related or dependent objects without specifying their concrete classes."
    //It should render a button and a window in either a Linux style or iOS style depending on which kind of factory was used. Note that the Application has no idea what kind of GUIFactory it                    is given or even what kind of Button that factory creates
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
```

License
--------

This code is under the BSD license.
