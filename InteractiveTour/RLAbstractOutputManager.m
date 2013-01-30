//
//  RLAbstractConsoleReader.m
//  InteractiveTour
//
//  Created by Roman Laitarenko on 1/17/13.
//  Copyright (c) 2013 Roman Laitarenko. All rights reserved.
//

#import "RLAbstractOutputManager.h"
#import "ITEvent.h"

@implementation RLAbstractOutputManager

@dynamic active;

static RLAbstractOutputManager *__activeManager__ = nil;

#pragma mark -
#pragma mark Accessors

- (BOOL)isActive {
    if (self == [RLAbstractOutputManager activeManager]) {
        return YES;
    }
    return NO;
}

#pragma mark -
#pragma mark Class Methods

+ (RLAbstractOutputManager *)activeManager {
    return __activeManager__;
}

+ (void)setActiveManager:(RLAbstractOutputManager *)aManager {
    [aManager retain];
    [__activeManager__ release];
    __activeManager__ = aManager;
}

#pragma mark -
#pragma mark Public

- (void)activate {
    [RLAbstractOutputManager setActiveManager:self];
}

- (void)didReceiveInputEvent:(ITEvent *)aEvent {
}

- (void)deactivate {
    [RLAbstractOutputManager setActiveManager:nil];
}

@end
