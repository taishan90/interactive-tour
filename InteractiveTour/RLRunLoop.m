//
//  RLRunLoopNew.m
//  InteractiveTour
//
//  Created by Roman Laitarenko on 1/8/13.
//  Copyright (c) 2013 Roman Laitarenko. All rights reserved.
//

#import "RLRunLoop.h"

typedef void(^MyBlock)(void);

@interface RLRunLoop ()

@property (retain)  NSMutableArray  *eventsToRun;
@end

@implementation RLRunLoop

@synthesize exitRunLoop = _exitRunLoop;
@synthesize eventsToRun = _eventsToRun;

#pragma mark -
#pragma mark Initializations And Deallocations

- (void)dealloc {
    self.eventsToRun = nil;
    
    [super dealloc];
}

- (id)init {
    if (self = [super init]) {
        self.eventsToRun = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)performSelector:(SEL)aSelector withTarget:(id)aTarget {
    if ([aTarget respondsToSelector:aSelector]) {
        [self.eventsToRun addObject:^{
            [aTarget performSelector:aSelector];
        }];
    }
}

- (void)run {
    while (!self.exitRunLoop) {
        for (MyBlock block in self.eventsToRun) {
            block();
        }
    }
}

@end
