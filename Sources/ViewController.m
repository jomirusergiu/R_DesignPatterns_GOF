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
    
    
    //======================================================================================//
    //Structural                                                                            //
    //Structural Patterns concern class and object composition. They use inheritance to     //
    //compose interfaces and define ways to compose objects to obtain new functionality.    //
    //======================================================================================//
    
    //Adapter [allows classes with incompatible interfaces to work together by wrapping its own interface around that of an already existing class]
    //An adapter helps two incompatible interfaces to work together. This is the real world definition for an adapter. Adapter design pattern is used when you want two different classes with incompatible interfaces to work together. Interfaces may be incompatible but the inner functionality should suit the need. The Adapter pattern allows otherwise incompatible classes to work together by converting the interface of one class into an interface expected by the clients.
    //Let's suppose we have a Laptop and we have to charge it in Europe first, with european standard, and then we'll have to travel to US, and we'll need to charge it there, what do we do? of course we'll use an adapter, so let's try to do the same programatically, and see how it goes.
    [Adapter new];
    
    //Bridge [decouples an abstraction from its implementation so that the two can vary independently]
    //When a class varies often, the features of object-oriented programming become very useful because changes to a program's code can be made easily with minimal prior knowledge about the program. The bridge pattern is useful when both the class as well as what it does vary often. The class itself can be thought of as the implementation and what the class can do as the abstraction. The bridge pattern can also be thought of as two layers of abstraction.
    //We'll create two concrete implementators and two refined abstractions, then we'll try to dynamicaly change the implementators, and see how those will behave.
    [Bridge new];
    
    //Composite composes zero-or-more similar objects so that they can be manipulated as one object.
    //In software engineering, the composite pattern is a partitioning design pattern. The composite pattern describes that a group of objects are to be treated in the same way as a single instance of an object. The intent of a composite is to "compose" objects into tree structures to represent part-whole hierarchies. Implementing the composite pattern lets clients treat individual objects and compositions uniformly.
    //We'll create a house level design as a Composite o two Leaves (Materials and Dimentions), then we'll make the house design.
    [Composite new];
    
    //Decorator dynamically adds/overrides behaviour in an existing method of an object.
    //In object-oriented programming, the decorator pattern (also known as Wrapper, an alternative naming shared with the Adapter pattern) is a design pattern that allows behavior to be added to an individual object, either statically or dynamically, without affecting the behavior of other objects from the same class. The decorator pattern can be used to extend (decorate) the functionality of a certain object statically, or in some cases at run-time, independently of other instances of the same class, provided some groundwork is done at design time. This is achieved by designing a new decorator class that wraps the original class.
    //We'll create a concrete component (a ChristmasTree) and two concrete decorators (ChristmasTreeDecorator) which override a behaviour of that component.
    [Decorator new];
    
    //Facade provides a simplified interface to a large body of code.
    //The facade pattern (or façade pattern) is a software design pattern commonly used with object-oriented programming. The name is by analogy to an architectural facade.A facade is an object that provides a simplified interface to a larger body of code, such as a class library
    //Let's try to implement this pattern with an example of a company where Secretary(Facade) handles everything The Boss[Client] asks.
    [Facade new];
    
    //Flyweight reduces the cost of creating and manipulating a large number of similar objects.
    //In computer programming, flyweight is a software design pattern. A flyweight is an object that minimizes memory use by sharing as much data as possible with other similar objects; it is a way to use objects in large numbers when a simple repeated representation would use an unacceptable amount of memory. Often some parts of the object state can be shared, and it is common practice to hold them in external data structures and pass them to the flyweight objects temporarily when they are used.
    //Let's take for example a strategy game where we have a lot of dragons and goblins, an wehave to create 50 thousands of dragons and 50 thousands of goblins. If every one of them will try to load their resources from our disk, then we'll run out of RAM or our game will be very slow. That's where we'll try to use Flyweight pattern.
    [Flyweight new];
    
    //Proxy provides a placeholder for another object to control access, reduce cost, and reduce complexity.
    //In computer programming, the proxy pattern is a software design pattern. A proxy, in its most general form, is a class functioning as an interface to something else. The proxy could interface to anything: a network connection, a large object in memory, a file, or some other resource that is expensive or impossible to duplicate.
    //We'll try to create a proxy which will let normal users to download files with normal speed, and pro users, with very fast speed. Then we'll create two users, pro and normal, and we'll try to download files with maximum speed.
    [Proxy new];
    
    //======================================================================================//
    //Behavioral                                                                            //
    //Most of these type of design patterns are specifically concerned with communication   //
    //between objects.                                                                      //
    //======================================================================================//
    
    //Chain of responsibility delegates commands to a chain of processing objects.
    //In object-oriented design, the chain-of-responsibility pattern is a design pattern consisting of a source of command objects and a series of processing objects.[1] Each processing object contains logic that defines the types of command objects that it can handle; the rest are passed to the next processing object in the chain. A mechanism also exists for adding new processing objects to the end of this chain.
    //This time we'll create several types of objects and several handlers for them, then we'll set a chain of responsibility for those handlers and try to handle intems.
    [ChainOfResponsibility new];
    
    //Command creates objects which encapsulate actions and parameters.
    //In object-oriented programming, the command pattern is a behavioral design pattern in which an object is used to represent and encapsulate all the information needed to call a method at a later time. This information includes the method name, the object that owns the method and values for the method parameters.
    //Four terms always associated with the command pattern are command, receiver, invoker and client. A command object has a receiver object and invokes a method of the receiver in a way that is specific to that receiver's class. The receiver then does the work. A command object is separately passed to an invoker object, which invokes the command, and optionally does bookkeeping about the command execution. Any command object can be passed to the same invoker object. Both an invoker object and several command objects are held by a client object. The client contains the decision making about which commands to execute at which points. To execute a command, it passes the command object to the invoker object.
    //In this example we'll create a base command, and two concrete commmands that can be executed and undo, and a command executor [manager] to execute/undo commands. First command can change a string, and undo that action, cause it saves the original string. The second one does the same with an integer. As we can see our Command executor can execute/undo specific commands or, even all of them.
    [Command new];
    
    //Interpreter implements a specialized language.
    //In computer programming, the interpreter pattern is a design pattern that specifies how to evaluate sentences in a language. The basic idea is to have a class for each symbol (terminal or nonterminal) in a specialized computer language. The syntax tree of a sentence in the language is an instance of the composite pattern and is used to evaluate (interpret) the sentence.
    //In First example, the structural code demonstrates the Interpreter patterns, which using a defined grammer, provides the interpreter that processes parsed statements.
    //In Second example, the real-world code demonstrates the Interpreter pattern which is used to convert a Roman numeral to a decimal.
    [Interpreter new];
    
    //Iterator accesses the elements of an object sequentially without exposing its underlying representation.
    //The essence of the Iterator Factory method Pattern is to "Provide a way to access the elements of an aggregate object sequentially without exposing its underlying representation.".
    //In object-oriented programming, the iterator pattern is a design pattern in which an iterator is used to traverse a container and access the container's elements. The iterator pattern decouples algorithms from containers; in some cases, algorithms are necessarily container-specific and thus cannot be decoupled.
    //The simpliest implementation of itrator in Objective c would be enumerator. For our example let's create a warehouse with good and bad items, and two iterators which would show us items of both types.
    [Iterator new];
    
    //Mediator allows loose coupling between classes by being the only class that has detailed knowledge of their methods.
    //The mediator pattern defines an object that encapsulates how a set of objects interact. This pattern is considered to be a behavioral pattern due to the way it can alter the program's running behavior
    //In this example we created a prototype of a smart house with some modules, and a centrall processor to take care of everything.
    [Mediator new];
    
    //Memento provides the ability to restore an object to its previous state (undo).
    //The memento pattern is a software design pattern that provides the ability to restore an object to its previous state (undo via rollback).
    //The memento pattern is implemented with three objects: the originator, a caretaker and a memento. The originator is some object that has an internal state. The caretaker is going to do something to the originator, but wants to be able to undo the change. The caretaker first asks the originator for a memento object. Then it does whatever operation (or sequence of operations) it was going to do. To roll back to the state before the operations, it returns the memento object to the originator. The memento object itself is an opaque object (one which the caretaker cannot, or should not, change). When using this pattern, care should be taken if the originator may change other objects or resources - the memento pattern operates on a single object.
    //We will create a classic example with an originator, then change state couple of times, and load state back.
    [Memento new];
    
    //Observer is a publish/subscribe pattern which allows a number of observer objects to see an event.
    //The observer pattern is a software design pattern in which an object, called the subject, maintains a list of its dependents, called observers, and notifies them automatically of any state changes, usually by calling one of their methods. It is mainly used to implement distributed event handling systems. The Observer pattern is also a key part in the familiar Model View Controller (MVC) architectural pattern. In fact the observer pattern was first implemented in Smalltalk's MVC based user interface framework. The observer pattern is implemented in numerous programming libraries and systems, including almost all GUI toolkits.
    //In our first exapmle we'll create a standard Oberver through protocols to show it's basic usage, and then in second one we'll try to do this through Key Value Observing. [Key-value coding is a mechanism for accessing an object’s properties indirectly, using strings to identify properties, rather than through invocation of an accessor method or accessing them directly through instance variables.] Also Observer may be done through NSNotificationCenter analogically.
    [Observer new];
    
    //State allows an object to alter its behavior when its internal state changes.
    //The state pattern, which closely resembles Strategy Pattern, is a behavioral software design pattern, also known as the objects for states pattern. This pattern is used in computer programming to encapsulate varying behavior for the same routine based on an object's state object. This can be a cleaner way for an object to change its behavior at runtime without resorting to large monolithic conditional statements
    //This time let's create a state interface and two implementations. The state's method has a reference to the context object and is able to change its state. We'll change state after StateA is invoked once or StateB is invoked twice, so we'll have one lowercase, then two uppercases, then one lowercase again and so on.
    [State new];
    
    //Strategy allows one of a family of algorithms to be selected on-the-fly at runtime.
    //In computer programming, the strategy pattern (also known as the policy pattern) is a software design pattern, whereby an algorithm's behaviour can be selected at runtime. Formally speaking, the strategy pattern defines a family of algorithms, encapsulates each one, and makes them interchangeable. Strategy lets the algorithm vary independently from clients that use it. Strategy is one of the patterns included in the influential book "Design Patterns" by Gamma et al. that popularized the concept of using patterns in software design.
    //For instance, a class that performs validation on incoming data may use a strategy pattern to select a validation algorithm based on the type of data, the source of the data, user choice, or other discriminating factors. These factors are not known for each case until run-time, and may require radically different validation to be performed. The validation strategies, encapsulated separately from the validating object, may be used by other validating objects in different areas of the system (or even different systems) without code duplication.
    //Let's take as example an RPG game such as Dungeon Siege where we have several heroes, and we should come up with different strategies for combinations between them. For this we'll apply strategy design pattern, let's see how it goes.
    [Strategy new];
    
    //Template method defines the skeleton of an algorithm as an abstract class, allowing its subclasses to provide concrete behavior.
    //In software engineering, the template method pattern is a behavioral design pattern that defines the program skeleton of an algorithm in a method, called template method, which defers some steps to subclasses. It lets one redefine certain steps of an algorithm without changing the algorithm's structure.
    //The template method is used in frameworks, where each implements the invariant parts of a domain's architecture, leaving "placeholders" for customisation options. This is an example for inversion of control, also called the Hollywood principle.
    //The control structure (inversion of control) that is the result of the application of a template pattern is often referred to as the Hollywood Principle: "Don't call us, we'll call you." Using this principle, the template method in a parent class controls the overall process by calling subclass methods as required. This is shown in the following example
    [Template new];
    
    //Visitor separates an algorithm from an object structure by moving the hierarchy of methods into one object.
    //In object-oriented programming and software engineering, the visitor design pattern is a way of separating an algorithm from an object structure on which it operates. A practical result of this separation is the ability to add new operations to existing object structures without modifying those structures. It is one way to follow the open/closed principle.
    //In essence, the visitor allows one to add new virtual functions to a family of classes without modifying the classes themselves; instead, one creates a visitor class that implements all of the appropriate specializations of the virtual function. The visitor takes the instance reference as input, and implements the goal through double dispatch.
    [Visitor new];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
