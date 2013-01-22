//
//  RLAbstractConsoleReader.m
//  InteractiveTour
//
//  Created by Roman Laitarenko on 1/17/13.
//  Copyright (c) 2013 Roman Laitarenko. All rights reserved.
//

#import "RLAbstractConsoleOutputManager.h"
#import "RLConsoleReader.h"

@interface RLAbstractConsoleOutputManager ()

@property (nonatomic, readwrite, retain) RLConsoleReader *reader;
@property (nonatomic, readwrite) BOOL isActive;

- (void)deactivate:(NSNotification *)notification;

@end

@implementation RLAbstractConsoleOutputManager

#define RLDeactivateConsolePrinters @"DeactivateConsolePrinters"

@synthesize reader = _reader;

#pragma mark -
#pragma mark Initializations and Allocations

- (void)dealloc {
    self.reader = nil;
    
    [super dealloc];
}

- (id)init {
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deactivate:) name:RLDeactivateConsolePrinters object:nil];
        
    }
    return self;
}

#pragma mark -
#pragma mark Public

- (void)obtainInput{
    if (self.isActive) {
        ITEvent *event = [self.reader getInputEvent];
        if (event) {
            NSLog(@"Output: %@", event.value);
        }
    }
}

- (void)activate {
    self.reader = [RLConsoleReader sharedReader];
    self.isActive = YES;
    [[NSNotificationCenter defaultCenter] postNotificationName:RLDeactivateConsolePrinters object:self];
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
