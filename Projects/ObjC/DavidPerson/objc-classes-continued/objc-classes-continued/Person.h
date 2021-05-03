//
//  Person.h
//  objc-classes-continued
//
//  Created by David Rifkin on 3/17/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

//reminder: NSObject gives us the blueprint to initialize and allocate space to a new object that we're creating
// If i just have this interface, i don't need to know how the implementation actually works!
@interface Person : NSObject {
    int _age;
    NSString *_name;
}

//properties age and name
//getter should be yearsOld

// what does the @property thing literally do?
// sets up accessors (read/write) - synthesizes a way to get the value of that property, and synthesizes a way to set the value of the property
// getter -> nameOfVariable
// setter -> setNameOfVariable
// getting rid of you to make it private
//@property NSString *name;
//getter -> age
//setter -> setAge (I want to change this)

//nonatomic vs atomic -> thread-safety
// getting rid of you to make it private
//@property (getter=yearsOld) int age;

// init might return one of two "types"
// "id" type and the instancetype "type"
// id is kind of like Any in swift
// instancetype is a keyword telling me to expect an object of the type I'm defining/in the definition of.
// format is yucky, but when we send a message to an object, we aren't quite calling a function BY NAME.
-(instancetype)initWithName: (NSString *)name andAge: (int)age;


//what do we put for a method in the interface?
// the signature for our function
-(void)popPitch;

@end
