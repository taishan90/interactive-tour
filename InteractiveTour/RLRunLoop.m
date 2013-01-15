//
//  RLRunLoopNew.m
//  InteractiveTour
//
//  Created by Roman Laitarenko on 1/8/13.
//  Copyright (c) 2013 Roman Laitarenko. All rights reserved.
//

#import "RLRunLoop.h"
#import "ITInputSource.h"

@interface RLRunLoop ()

@property (atomic, readwrite, retain) NSMutableArray    *eventsToRun;
@property (atomic, readwrite, assign) BOOL              exitRunLoop;
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

- (NSArray *)inputSourcesWithSelector:(SEL)aSelector {
    NSMutableArray *result = [NSMutableArray array];
    
    for (ITInputSource *source in self.eventsToRun) {
        if (aSelector == source.selector) {
            [result addObject:source];
        }
    }
    return [[result copy] autorelease];
}

- (NSArray *)inputSourcesWithObject:(id)anObject {
    NSMutableArray *result = [NSMutableArray array];
    
    for (ITInputSource *source in self.eventsToRun) {
        if ([anObject isEqual:source.object]) {
            [result addObject:source];
        }
    }
    return [[result copy] autorelease];
}

- (void)scheduleEventUsingSelector:(SEL)aSelector withObject:(id)anObject {
    [self scheduleEventUsingSelector:aSelector object:anObject block:^{
        [anObject performSelector:aSelector];
    }];
}

- (void)scheduleEventUsingSelector:(SEL)aSelector object:(id)anObject block:(CustomBlock)aBlock {
    if([anObject respondsToSelector:aSelector]) {
        [self.eventsToRun addObject:[[[ITInputSource alloc] initWithObject:anObject selector:aSelector block:aBlock] autorelease]];
    }
}

- (void)start {
    self.exitRunLoop = NO;
    
    while (!self.exitRunLoop) {
        NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
        
        for (ITInputSource *source in self.eventsToRun) {
            source.block();
        }
        
        [pool drain];
    }
}

- (void)stop {
    self.exitRunLoop = YES;
}

@end
