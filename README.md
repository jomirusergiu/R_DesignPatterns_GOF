R_DesignPatterns(GOF)
=================

R_DesignPatterns(GOF) is an example project on using and implementation of “Gang Of Four” Design Patterns.

Design Patterns
---------
Creational patterns are ones that create objects for you, rather than having you instantiate objects directly. This gives your program more flexibility in deciding which objects need to be created for a given case.

- Abstract Factory - groups object factories that have a common theme.
- Builder - constructs complex objects by separating construction and representation.
- Factory Method - creates objects without specifying the exact class to create.
- Prototype - creates objects by cloning an existing object.
- Singleton - restricts object creation for a class to only one instance.

Structural Patterns concern class and object composition. They use inheritance to compose interfaces and define ways to compose objects to obtain new functionality.    

- Adapter - allows classes with incompatible interfaces to work together by wrapping its own interface around that of an already existing class.

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
#import “Adapter.h”
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


    //======================================================================================//
    //Structural                                                                            //
    //Structural Patterns concern class and object composition. They use inheritance to     //
    //compose interfaces and define ways to compose objects to obtain new functionality.    //
    //======================================================================================//
    
    //Adapter [allows classes with incompatible interfaces to work together by wrapping its own interface around that of an already existing class]
    //An adapter helps two incompatible interfaces to work together. This is the real world definition for an adapter. Adapter design pattern is used when you want two different classes with incompatible interfaces to work together. Interfaces may be incompatible but the inner functionality should suit the need. The Adapter pattern allows otherwise incompatible classes to work together by converting the interface of one class into an interface expected by the clients.
    //Let's suppose we have a Laptop and we have to charge it in Europe first, with european standard, and then we'll have to travel to US, and we'll need to charge it there, what do we do? of course we'll use an adapter, so let's try to do the same programatically, and see how it goes.
    [Adapter new];
```

License
--------

This code is under the BSD license.
