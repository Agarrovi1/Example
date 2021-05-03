//
//  CBarker.m
//  CarnivalBarkerInheritance
//
//  Created by Angela Garrovillas on 3/5/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

#import <Foundation/Foundation.h> //<> for built in library like foundation
#import "CarnivalBarker.h" //needs open quotes -> for file names

//if you create a cocoa touch class, it creates both .m/.h
//what's cocoa? what's cocoa touch? we'll get into when we start iOD development w/Objc

//We import foundation, which is where NSObject is defined
//we also need to know what this interfaces with, or else... there's no link between implementation and interface for our new class

//later, when we have init functions. we can add "
int numberOfRemainingBarkers = 0;

@implementation CarnivalBarker
//instance method bark
- (void)barks {
    NSLog(@"bark");
}

//class method remainingEmployed
//this would need to count every instance of a carnival barker. How did we get stuct/class-level info in Swift? Static var. Those don't exist here in Objc

//One approach - create a different object to hold that info. singleton to store "Global" or "readily-needed" information. Come back to this down the line
//another approach - Globals. When I was too lazy to figure out where to put a variable, or wanted to use it across the application, I would create a global
+ (int)remainingEmployed {
    return numberOfRemainingBarkers;
}

- (instancetype)init {
    //self = [super init];
    _name = @"";
    numberOfRemainingBarkers++;
    return self;
}
- (instancetype)initWith:(NSString *)name {
    _name = name;
    numberOfRemainingBarkers++;
    return self;
}

/*
 -(id)init {
 self = [super init];
 numberOfRemainingBarkers++;
 return self
 }
 */

//static int numberOfRemainingBarkers = 0
//TODO: our carnival barker, to feel like a human being in what can be a trying job, would at least like to have a name by which they can be reffered to. Add this to their interface/implementation as a PROPERTY

@end

void example() {
    CarnivalBarker *dog = [[CarnivalBarker alloc] init];
    
    [dog barks];
    [CarnivalBarker remainingEmployed];
}

