//
//  RLAbstractConsoleReader.m
//  InteractiveTour
//
//  Created by Roman Laitarenko on 1/17/13.
//  Copyright (c) 2013 Roman Laitarenko. All rights reserved.
//

#import "RLExampleCRParent.h"
#import "ITEvent.h"

@implementation RLExampleCRParent

#pragma mark -
#pragma mark Public

- (void)obtainInput:(ITEvent *)event {
    NSLog(@"RLConsoleReaderParent: %@", event.value);
}

- (void)activate{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ActivateParentForConsoleReader" object:self];
}

@end
