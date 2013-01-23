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

RLAbstractOutputManager *activeManager = nil;

+ (RLAbstractOutputManager *)activeOutputManager {
    return activeManager;
}

+ (void)setActiveOutputManager:(RLAbstractOutputManager *)aManager {
    activeManager = aManager;
}

- (void)activate {
    [RLAbstractOutputManager setActiveOutputManager:self];
}

- (void)didReceiveInputEvent:(ITEvent *)aEvent {
}

@end
