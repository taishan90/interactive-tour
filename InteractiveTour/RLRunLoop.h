//
//  RLRunLoopNew.h
//  InteractiveTour
//
//  Created by Roman Laitarenko on 1/8/13.
//  Copyright (c) 2013 Roman Laitarenko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CustomBlock)(void);

@interface RLRunLoop : NSObject

@property (atomic, readonly, assign) BOOL isRunning;

- (void)scheduleEventUsingSelector:(SEL)aSelector withObject:(id)anObject;
- (void)scheduleEventUsingSelector:(SEL)aSelector object:(id)anObject block:(CustomBlock)aBlock;

- (NSArray *)inputSourcesWithSelector:(SEL)aSelector;
- (NSArray *)inputSourcesWithObject:(id)anObject;

- (void)start;
- (void)stop;

@end
