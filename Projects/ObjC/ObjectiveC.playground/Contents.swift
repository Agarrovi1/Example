import UIKit
/*
 Objc - let's us stay objective
    - is it the foundation for swift?
    - we use it functions for when we make buttons it interacts well with UIkit
 
 Why learn it?
    - looks good on a resume
    - built-in functions of swift might not be as powerful as some from Objc
    - swift is pretty new (came out in 2013) and iPhone came out a bunch of years before that, so apps were originally written in Objc
 
 Built on top of C-Language
    - specifically, for the main reason, in its most useful form, to allow us to use objects (have some properties , and have some behaviors/ do some stuff)
    - in swift, we've created objects using classes, structs, and enums
 

-Swift's paradigm (the way we're meant to use it) is Protocol Oriented Programming. This means we can have objects but the way we tie everything  together in our programs is to create protocols that share properties and behavior.
-Objc is meant for Object-Oriented Programming

****** 4 Pollars of OOP -> Object-Oriented Programming
 
Encapsulation: Keeps data and functions safe from outside interference and  misuse
 
Inheritance: getting all the properties of your ancestors
  -ancestor is the class that is the parent of your class (whether it's a superclass or a root class)
  - ex: ViewController: UIViewController (self.view, self.view.background, viewDidLoad, other lifecycle methods)
  - how is inheritance different than using a protocol
      - don't have to use everything that's inherited? Kinda
      - protocols are blueprints (no implementation unless extend them, set up some implementation in a class/ struct), whereas with inheritance we actually HAVE properties and functions available to us


 Abstraction: take something complex and make it simple.
    - keep some things private so thay can't be manipulated elsewhere.
    - giving our code a specific purpose for other people.
    - header file contains the interface - that's what a user can use this for
    - .m file contains implementation for that interface's code (both what will be available to import via the interface, and any private functionality)
    - header files communicate between parts of the program, .m files are the "actual code" to execute
 
 Polymorphism: derived from two greek words (many forms) a subclass can define its own behavior and share that behavior TY Jason
    - Don't have to use a child in the same way you use the parent.
        Inheritance!! overriding (viewDidLoad) and overloading (init??? same function with diff parameters) - use classes mainly.
        - Why not structs? Can mutate func but can't inherit functions/ properties.
 
 What does these 4 pillars, and the fact that they almost always make use of classes, mean for us when we use memory in Objc
    - Classes have memory leaks
    - Classes are reference types, so almost everything we use is going to be a reference type.
    - We have to be careful with multiple references, and also we have to MANUALLY count our references.
 
 EX:
  var a = SomeClassThings()
 var b = a
 //if I change a, it also changes b
 
 Important Vocab Terms:
 - Pointers: (hates by some) a var whose value is the address of another variable
    * denotes a pointer
 
 - Message-sending: objects in Objc don't actually have "methods" that we call.
    Instead, we say that they "send messages" to other objects.
    To make us feel better: the implementation is different than using a method in Swift, but... hay, everyone just calls them methods in Objc
 */
