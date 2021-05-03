//
//  main.m
//  ObjC2
//
//  Created by Angela Garrovillas on 3/3/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

#import <Foundation/Foundation.h>
//MARK: - How to create an Object
//what are the two types of files our objc program will use
//.h (header file), .m (objective-c file)
//.h had interface, .m usually has the implementation
//that's convention though (header encapsulates)

//Use caps to show we're creating a new type
//interface DEMANDS that it inherit from a superclass
//Must at least subclass from NSObject so we can allocate / intialize - rood/highest/base/just inherit from it
//@ indicates a directive when it's outside
@interface Cat : NSObject
//instance method that doesn't take any arguments and doesn't return anything
//(funtion)
//- means it is an instance function
- (void)sound; //if you have a func that takes in nothing dont have to specify
//class methoud uses + in front of the signature [Cat howMany]

@end

//Don't need to indicate any inheritance (don't need to know about superclasses here).
@implementation Cat

// If we create the interface, then we'll know exactly how to implement it. We get a warning from the program to let us know if the interface hasn't been implemented in its entirety
- (void) sound {
    NSLog(@"Meow");
}

@end



//Tiny tangent: We want our own numbers
@interface CoolNumbers : NSNumber

@end

//MARK: -  Funtions

//main is the name of a function that returns an int has an argument argc (argument count) and argv (argument values/variables
//func format is:
//returnType nameOfFunction(typeOf argument1, typeOf argument2...)

//Swift functions provide us with values, but Objc functions' arguments can give us references

//argv is a const because it's a pointer to where the arry of chars is saved, but we don't want anyone to be able to change the value of it. We'll often do this if we don't want references/ objects to be changed by the ecapsulationg code in the function

//Lets make a simple func. Function that takes in an int, and then counts up from 1 to that int, and adds each value to an array, then returns the count of that array
//We can set up the signature for the function without implementing it. I can declare it here, then set up the implementation elsewhere. Important because it need to be delcared before use

//Is this an instance method? NO
//Is this a class method (what we usually call "static" in Swift)?
//Whats the scope of this function? Global. Not specific to how we use OOP.
int takeInAnIntAndReturnAnInt(int count) {

    //Control reaches end of  non-void function (not returning the right type
    return count;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //when using a cat it looks to interface, impementations is behind the scenes
        //We have a cat! The interface must be available before use, but the implementation does not need to be
        Cat *myCat = [[Cat alloc] init];
        Cat *newCat = [Cat new]; //is the same as allocating and init
        [myCat sound];

        // insert code here...
        //int myarray[] = {1,,2,3,4,5};
        
        //Create an array containing all numbers between 1 and argc. Print the count of the number of elements in that array.
        //First - create an array for our numbers. Must be mutable so we can keep appending to it. NSArray is static type, NSMutableArray is dynamic type.
        //Reminder: Asterisk indicates that we have a pointer to an object
        //In Swift, first declare: var array: [Int]
        //Then initialize: array = Array<Int>()
        NSLog(@"argc:%d",argc);
        NSMutableArray *array = [[NSMutableArray alloc] init];
        //Then, loop through, until we've reached the int value of argc. In each iteration of the loop, append i to the mutable array
        for (int i = 1; i <= argc; i++) {
            NSLog(@"%d",i);
            //when we append to our array, we send a message
            //this looks at array and adds i as NSString using literal notation
            //[array addObject:(@"i")];
            [array addObject:@(i)];
        }
        //Reminder, Objc does not have interpolation. We use these flags or tokens
        //In Swift, we could get the number of items using array.count
        NSLog(@"count: %lu", [array count]);
        //If there is one item in the array, how many arguments are there in the main function
        NSLog(@"inside array: %@", array);
        //We can add command line argumentw with CLANG -> compiler, Most programs work like this
        
        //What does this line do? It returns an int
        takeInAnIntAndReturnAnInt(argc);
    }
    return 0;
}

//Next time: define our inits so we can add more properties, see how we use blocks (aka closures), talk though importing header files (code organization), inheritance with more and more objects
