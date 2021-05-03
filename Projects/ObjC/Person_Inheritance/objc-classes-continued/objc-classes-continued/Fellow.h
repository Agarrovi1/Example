//
//  Fellor.h
//  objc-classes-continued
//
//  Created by Angela Garrovillas on 3/20/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//
#import "Person.h"
#import "Employable.h"

#ifndef Fellor_h
#define Fellor_h


#endif /* Fellor_h */

@interface Fellow : Person <Employable> {
    NSString*_stack;
}

@property NSString*borough;

-(void)whatStack;
-(instancetype)initWithBorough: (NSString*)_borough name: (NSString*)name age: (int)age stack: (NSString*)stack;

@end
