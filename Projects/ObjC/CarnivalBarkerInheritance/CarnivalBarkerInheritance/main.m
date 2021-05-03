//
//  main.m
//  CarnivalBarkerInheritance
//
//  Created by Angela Garrovillas on 3/5/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CarnivalBarker.h"

//Warmup: In a MacOS COMMAND LINE app, create the interface and implementation in two different files for a class CarnivalBarker, that has an instance method bark that barks and a class method remainingEmployed that gives the total number of Carnival Barkers that are left employed :(

//my files are .h (header and .m (objective-c) files in the header, we'll have the interface (how a person using our code should use it)

//What principle of OOP does this help us enforce?
/*
 -encapsulation: data is contained within objects and is not accessible in ways other than what has been defined within that object.
    -"this only does what i want it to"
 
 - abstraction can also apply: we use objects to receive messages, turn basic funtionality into something more human-readable and do the job that a real life object might.
    -"explaning a real life object to code"
 */

//TODO: Create an init function that creates a new carnival Barker using all the inherited properties and methods of its superclass. Init should increase the number of carnival barkers hired. Inits are not factory methods... so Init is an instance method. Why? We'll see!
//OOP: something to do with how subclasses/ superclasses work. children can behave differently than their parents... polymorphism. overloading and overriding!

//Here we ovveride NSObject's init, and when we use this interface, we'll be calling the "init" defined for CarnivalBarker
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        //why is it an instance method
        CarnivalBarker *dog = [CarnivalBarker alloc]; //make a pointer and instance
        [dog init]; //gives values to an instance
        CarnivalBarker *dog2 = [CarnivalBarker new];
        CarnivalBarker *barkerDog = [[CarnivalBarker alloc] initWith: @"bob barker"];
        
        
        //cant use dot-notation for my methods... because i'm really sending a message
        //bad: barker.bark
        [dog barks];
        NSLog(@"remaining: %d",[CarnivalBarker remainingEmployed]);
        NSLog(@"%@",[barkerDog name]);
        //in the past we've seen when we created and init a new object, we could send the message [NSObject new] instead of alloc + init messages at once. This still works, even with our init override. Why?
        //It's looking for a method called init... new is just looking for alloc + init, and since our CarnivalBarker's override for init is still named the same thing, the "new" method will use it. Starts with the class, and then looks back in its superclasses if it doesn't find what it's looking for. The basic concept of which prinicple? polymorphism.
        //looks first for methods/ properties in current class A -> A's supperclass B-> B's superclass C
    }
    return 0;
}
