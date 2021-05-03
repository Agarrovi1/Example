//
//  Person.m
//  objc-classes-continued
//
//  Created by David Rifkin on 3/17/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@implementation Person

//once i import the header, i don't need to make note of what IVars I need

// We want a custom initializer!
// What principle of OOP are we applying here? Polymorphism!
// Classes can behave differently than the classes they inherit from - override and overload

// init creates new object instances, but does nothing else that's useful for us.

//properties age and name

//what do we put for a method in the interface?
// the signature for our function
// we want this to print name and age
// In swift, how would i get the values of those properties? string interpolate self.name and self.yearsOld

// custom init -> hide my age and name unless someone asks for my pop pitch.
// so initializer is going to have to take in some arguments!
// old:
//-(instancetype)init {
//    self = [super init];
//    return self;
//}
// new: 

// example of overloading init
-(instancetype)initWithName: (NSString *)name andAge: (int)age {
    //the superclass's init is always available
    self = [super init];
    // do we want to set properties?
    // because there's no "self" for IVars, I can't distinguish which one I'm talking about here.
    _name = name;
    _age = age;
    return self;
}

// simple example of overriding
-(instancetype)init {
    self = [super init];
    _name = @"The 2 Man";
    _age = 3;
    return self;
}

//Error: Control reaches end of non-void function
// ^^ have to return something!

//although Obj-C makes us use the [message format] for calling methods, with our accessors we can use the dot format for getting/setting them.
-(void)popPitch {
    NSLog(@"Hi I'm a person doing my pop pitch... My name is %@ and my age is %d", _name, _age);
}


// can't just call self to use an IVar
// why?!!?
// IVar is a variable defined in the scope of an instance, but it's not actually attached to the instance. it isn't self.name, it's just some variable that happens to exist in this scope called "name"

// properties attach the values to self, IVars don't.

/*
 Remember scope!
func a() {
  var b =0
can use b out here
}
// can't use b out here
*/

@end
