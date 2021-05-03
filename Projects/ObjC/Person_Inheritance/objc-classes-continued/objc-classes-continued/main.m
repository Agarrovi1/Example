//
//  main.m
//  objc-classes-continued
//
//  Created by David Rifkin on 3/17/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Fellow.h"

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
        //Person *angela = [[Person alloc] init];
        //[angela setName:@"Sefia"];
        //[angela setAge: 18];
        //[angela popPitch];
        
        Person *superman = [[Person alloc] initWithName:@"superman" andAge:34];
        [superman popPitch];
        
        Fellow *jocelyn = [[Fellow alloc] initWithBorough:@"Queens" name:@"Jocelyn" age:20 stack:@"iOS"];
        [jocelyn whatStack];
        
        [jocelyn setIsComfortable:true];
        [jocelyn areYouComfortable];
        
        [jocelyn setIsJobReady:true];
        NSLog(@"are you job ready? %s",[jocelyn isJobReady] ? "true":"false");
        
    }
    return 0;
}
