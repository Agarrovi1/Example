//
//  Person.h
//  objc-classes-continued
//
//  Created by David Rifkin on 3/17/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//
#import "Comfortable.h"
//reminder: NSObject gives us the blueprint to initialize and allocate space to a new object that we're creating
// If i just have this interface, i don't need to know how the implementation actually works!

//instance variable
@interface Person : NSObject <Comfortable> {
    NSString *_name;
    int _age;
    //"makes private variables", but func inside can use it
    //encapsulation
}

//properties age and name

//what do we put for a method in the interface?
// the signature for our function
-(void)popPitch;

-(instancetype)initWithName: (NSString *)name andAge: (int)age;

//(strong, nonatomic)?
//(readonly, copy)
//(getter=yearsOld) makes like a computed property for age

//@property NSString*name;
//@property int age;


@end
