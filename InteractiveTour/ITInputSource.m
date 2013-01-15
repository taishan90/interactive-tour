//
//  ITInputSource.m
//  InteractiveTour
//
//  Created by Roman Laitarenko on 1/15/13.
//  Copyright (c) 2013 Roman Laitarenko. All rights reserved.
//

#import "ITInputSource.h"

@interface ITInputSource ()

@property (atomic, readwrite, retain) id        object;
@property (atomic, readwrite, assign) SEL       selector;
@property (atomic, readwrite, copy) MyBlock   block;

@end

@implementation ITInputSource

@synthesize object =    _object;
@synthesize selector =  _selector;
@synthesize block =     _block;

#pragma mark -
#pragma mark Initializations And Allocations

- (void)dealloc {
    self.object = nil;
    self.selector = nil;
    self.block = nil;
    
    [super dealloc];
}

- (id)initWithObject:(id)anObject selector:(SEL)aSelector block:(MyBlock)aBlock {
    if (self = [super init]) {
        self.object = anObject;
        self.selector = aSelector;
        self.block = aBlock;
    }
    return self;
}

@end
