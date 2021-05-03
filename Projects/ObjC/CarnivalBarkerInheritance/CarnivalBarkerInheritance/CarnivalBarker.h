//
//  CarnivalBarker.h
//  CarnivalBarkerInheritance
//
//  Created by Angela Garrovillas on 3/5/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

//header file: what's in here/ the interface

#ifndef CarnivalBarker_h
#define CarnivalBarker_h


#endif /* CarnivalBarker_h */

//we need to subclass NSObject so that I can inherit functionalities. The most improtant are alloc and init
//- alloc points to a spot in memory (allocates it) and init creates an instance in that space in memory.
//Important: because we are using inheritance, if there are no implemented methods/properties, we'd only be able to use the ones inherited from NSObject
@interface CarnivalBarker : NSObject

@property (strong, nonatomic) NSString *name;

- (void)barks;

+ (int)remainingEmployed;

- (instancetype)init;
//-(id)init;
//id is part of initializer. the same object that's being initialized? instead of saying self.type or something?
//id and instancetype are not the same when we fight with inheritance and polymorphism

- (instancetype)initWith: (NSString *)name;
@end
