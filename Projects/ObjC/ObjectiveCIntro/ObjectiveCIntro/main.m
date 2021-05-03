//
//  main.m
//  ObjectiveCIntro
//
//  Created by Angela Garrovillas on 2/25/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

#import <Foundation/Foundation.h>

//Main also start by printing Hello World
//signature -> starts with the return type (this returns int)
//-> name of the function
//-> in parens are arguments (int, character that is constant the star *
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //Objc has "basic types". these locased keywords, int, char, float. The rest of the types need to have a reference in memory (they are classes!) -> this reference comes from a pointer * before argv[]
        //argv is an array
        
        // we don't have a print fonction in Objc.
        // Logging is a process of sending some feedback about your program to another source. Locally, we'll log anything at any moment (maybe an error, maybe a way for us to debug some functions).
        //Firebase Analytics that send information to an API about the performance of the app, the usage (time using app, number of uses of app, etc).
        //NSLog does not do all the work of printing for us
        //Only can take a string, and you have to tell it where AND when to insert other types to be logged out
        //@ denotes a literal (talk more on thursday
        //There's NO type intefrence in Objc. I can't say var = 1
        //to end a line we must put a semicolon. MUST. compiler wrror otherwise :'(
        int a = 1;
        //In order to print stuff, we have to use string formatters in-text, with the values afterwards
        // %f for decimals -> standard decimal in most languages is float, double has double the space
        //%d is for int
        //%@ is for id -> which relates to objects
        NSLog(@"Hello, World! I declared an int. Let's print it using formatter d %d", a);
        //for- loop is going to work in a way that we're not familiar with just yet/david didn't teach because it doesn't exist in Swift anymore
        //C-style loop - 3 arguments
        //1. initialize the variable to be used in the loop
        //2. set a condition that remains true for the loop (if this condition is ever false, stop the loop)
        //3. increment our initialized variable
        //can't say for i in 1...5
        // ++ just means increase by 1
        
        for (int a = 1; a <= 5; a++) {
            //conditions to be evaluated must be in parens
            if (a % 2 == 0) {
                NSLog(@"here's the loop at this point %d", a);
            }
            
        }
    }
    return 0;
}
/*
 Brief tangent:
 What is a REPL
    - reads, evaluates, prints( loop that does this)
 Most coding interviews will be in a repl, not in Xcode
 some examples: coderpad.io, repl.it
 
 Compilers for multiple languages (built by Apple way back when) called CLANG.
 Both of these communicate with a system called LLVM to actually run your code
 
 can create an executable file using clang
 */

//MARK: 2/27/2020
/*
 Objc refresher
 Syntax is different:
 - when declaring a var, we start with the type that that instance will be
 -var a = 10? keyword var doesn't exist
 and there's no type inference
 
 We'll have to manage the memory (sometimes)
 Ex: autoreleasepool sets a scp[e for you to declare variables, do stuff with them, and then at the end of the block, whatever is in memory will be told to release
 
 Object-Oriented Language! (OOP)
 - not protocol oriented -> so true
 - 4 pillars: encapsulation, inheritance, abstraction, polymorphism
 
 First! We're gonna talk about the funtionality that ObjC gets from a different language
 
 Swift compiles into Swift, which compiles into some Swift-y kind of thing (SIL) and then gets set up to be actual instructions to the computer
 
 ObjC does not compile to itself. C and its funtionality sit below ObjC, and so when we compile our code, at one poit all the stuff we write will be in C. After that, it'll get set up to be actial instructions to the computer.
 
 Digression: most languages compile to an intermediary language called Assempbly, which is the layer of code that gets translated to hardware of our computers.
 Digression over.
 

 */
//-> Int
//argc is the number of arguments to this main function. By default there are two, the first is the function name and the second is the number of arguments
int main2(int argc, const char * argv[]) {
    @autoreleasepool {
        //char isnt a character, its a pointer.. oh no. So what we're doing isn't looking at an instance of a char, or an array of those things ...but actually its an array of bytes for us to look at
        
        //argv(number of arguments, array of arguments put into this function
        //basic types are not objects that we have intance methos for... so we don't get to use those predefined things we're used to seeing in ta definitions
        //c-style for-loop executes until when?
        //i increases intil it's no longer less than the size of argv (aka the count - 1
        for (int i = 0; i < sizeof(argv) ; i++) {
            NSLog(@"Let's see the argument %d: %s", i, argv[i]);
        }
        NSLog(@"Hello World");
        
        int number = 10; //For basic types, I can use the = assignment that we're used tp
        int *placeANumberIs = 10; //i've set up a way to look at where this number is stored in memory -> that's called a pointer
        //How could i use it? I could keep count of how many refernce there are in memory
        number = 21;
        //the value being stored at a pointer uses a byte stored in hexadecimal. Bytes are a memory unit that have 8 bits in them. A bit is made up of athe values 0 or 1, or YES or NO in some interpretations of gates. Let's talk about philosphers some other day
        //0-9, a-f
        
        placeANumberIs = 30;
        
        //long long? wut. When we use these basic types, since we see that there's only a certain of memory allocated, we have ot tell the program that it should allocate more space
        //Integer overflow? We try to save beyond the capacity of what memory has been allocated to our storage space. No quick and dirty way to handle in Swift
        //long long int aSuperBigNumber = 10000000000000000000000; //gives error too large to store in a spot in memory
        long long int aSuperBigNumber = 100000000000000000;
        //HOWEVER, ALL THE OBJECTS THAT WE GET FROM OBJC ARE GOING TO BE ACCESSED USING POINTERS
        //Objc used to be some language that no one really used. then Apple Bought it, and they build out this framework that we're using that let us be object oriented
        //FOUNDATION -> Import the major NS objects for us
        // NS -> NextStep
        //We create objects from all of these types.
        //Base object is called NSObject (root class)
        //It's the parent or ancestor at the root of class hierarchies for objC objects. Needs this to create/ use custom objects
        //All of my objects are going to have pointers so that our programs creates and uses that object that runtime (not creating instances when we compile, like we did above with that basic type int)
        //var lianasObject: NSObject - declaring a variable without initializing it with a value. allocating space to the object
        //there should be a pointer to some address i can reference named lianasObject
        NSObject *lianasObject = [NSObject alloc];
        
        //var lianasObject: NSObject = NSObject() -> makes an instance
        //var lianasString: NSObject = String() -> ""
        //don't call methods, sending message
        //allocates a space to variable and initialize it
        NSObject *lianaObject = [[NSObject alloc] init];
        
        int arrayInt[] = {1,2,3}; //syntax of basic array
        //Object wrapper for primitive scalar number values. We've created structs that wrap other structs (encapsulates other objects).
        //'Boxing' some values to allow us to have behavior with those values
        NSNumber *myFirstNumber = [[NSNumber alloc] init]; //Null right now
        NSNumber *mySecondNumber = [NSNumber numberWithInt:7];
        NSLog(@"I want to see my second number: %@",mySecondNumber);
        NSNumber *myFirstFloat = [NSNumber numberWithFloat:1.2];
        NSNumber *myThirdNumber = [NSNumber numberWithDouble:2.4];
        
         //How can i print this as an int?
        int secondNumberAsInt = (int)mySecondNumber;
    NSLog(@"I want to see my second number: %d",secondNumberAsInt);
        
        int mySeconNumberAsInt = [mySecondNumber intValue];
        NSLog(@"I want to see my second number: %d",mySeconNumberAsInt);
        
        //if this /'s, how could we get the remainder? % modulo
        NSLog(@"put stuff in here number: %d, place: %p", number, placeANumberIs);
        
        NSArray *myFirstArray = [NSArray arrayWithObjects:mySecondNumber,myFirstFloat,myThirdNumber, nil];
        //knows to stop adding things when it gets to nil
        NSLog(@"my array: %lu", myFirstArray);
    
        NSNumber *myFourthNumber = [NSNumber numberWithInt:8];
        //Mutability
        //Wrap up -> create an array with 5 NSNumber that allows me to remove the last item
        NSMutableArray *taskArray = [NSMutableArray arrayWithObjects:mySecondNumber,myThirdNumber,myFirstFloat,myFourthNumber, nil];
        //sent message to this object saying, remove the last object inside of you
        [taskArray removeLastObject];
        [taskArray count];
        
        //Next time: we make our own objects! We learn about inheriting root class (NSObject).
    }
    return 1;
}
