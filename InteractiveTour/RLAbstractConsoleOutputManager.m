//
//  RLAbstractConsoleReader.m
//  InteractiveTour
//
//  Created by Roman Laitarenko on 1/17/13.
//  Copyright (c) 2013 Roman Laitarenko. All rights reserved.
//

#import "RLAbstractConsoleOutputManager.h"

@interface RLAbstractConsoleOutputManager ()

@property (nonatomic, readwrite, retain) RLConsoleReader *reader;
@property (nonatomic, readwrite) BOOL isActive;
@end

@implementation RLAbstractConsoleOutputManager

@synthesize reader = _reader;

#pragma mark -
#pragma mark Initializations and Allocations

- (void)dealloc {
    self.reader = nil;
    
    [super dealloc];
}

- (id)init {
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deactivate:) name:@"DeactivateConsolePrinters" object:nil];

    }
    return self;
}

#pragma mark -
#pragma mark Public

- (void)obtainInput{
    if (self.isActive) {
        ITEvent *event = [self.reader getInputEvent];
        NSLog(@"Output: %@", event.value);
    }
}

- (void)activateForReader:(RLConsoleReader *)aReader{
    self.reader = aReader;
    self.isActive = YES;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"DeactivateConsolePrinters" object:self];
}

#pragma mark -
#pragma mark Private

- (void)deactivate:(NSNotification *)notification {
    if (notification.object != self) {
        self.reader = nil;
        self.isActive = NO;
    }
}

@end
