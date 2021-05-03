//
//  Fellow.m
//  objc-classes-continued
//
//  Created by Angela Garrovillas on 3/20/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fellow.h"

@implementation Fellow

-(void)whatStack {
    NSLog(@"My name is %@, Im %d years old, Im in %@ stack",_name,_age,_stack);
}
-(instancetype)initWithBorough:(NSString *)_borough name:(NSString *)name age:(int)age stack:(NSString *)stack {
    _name = name;
    _age = age;
    _stack = stack;
    [self setBorough:_borough];
    return self;
}

@synthesize isJobReady;
//@synthesize isJobReady = _isJobReady;

@end
