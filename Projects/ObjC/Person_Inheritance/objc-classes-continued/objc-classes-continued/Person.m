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

//properties age and name

//what do we put for a method in the interface?
// the signature for our function


-(void)popPitch {
    NSLog(@"My name is %@,I am %d years old",_name,_age);
}
//overloading
-(instancetype)initWithName: (NSString *)name andAge: (int)age {
    //super class' init is always available
    self = [super init];
    _name = name;
    _age = age;
    
    return self;
}

- (void)areYouComfortable {
    NSLog(@"%s",isComfortable ? "true":"false");
}

@synthesize isComfortable;

@end

