//
//  main.m
//  objc-classes-continued
//
//  Created by David Rifkin on 3/17/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

/*Warmup: Create the interface and implementation for a Person class, which has:
    - a "name" property that is an NSString,
    - an "age" property that is an int
    - a "popPitch" instance method that logs out the person's age and name as part of a string
 how would we do that in swift - could be a computed property.
 let person = Person()
 // how do we denote an instance method
 starting line with - defines/sets up an instance method
 starting line with + defines/sets up a class method.
*/

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSString *myString = @"16";
        NSNumber *myNumber = [NSNumber numberWithInt:4];
        //ARC disallows this!
//        id *myID = myString;
//        myID = myNumber;
        
        //id is one of the basic types, like int! Use as its own type, can't send messages, etc.
        // Avoid if possible!
//        id myID = myString;
//        myID = myNumber;
        
        
        // Person is the combo of alloc + init
//        Person *person = [Person new];
        //literal - it's a shorthand for creating instances of specific objects
//        NSString *personsName = @"Superman";
//        [person setName: @"Superman"]; -> doesn't work without a property
        // setters synthesized in the pattern we expected
//        [person setAge:34]; -> doesn't work without a property
        // this getter synthesized from the attributes that we told the property to use (namely, getter = yeardOld)
//        [person yearsOld]; -> doesn't work without a property
        // to get an instance, we need to alloc space before initing
        Person *eric = [[Person alloc] initWithName:@"Eric Mei" andAge:25];
        
        [eric popPitch];
    }
    return 0;
}
