//
//  ReadUserInput.m
//  InteractiveTour
//
//  Created by Roman Laitarenko on 12/16/12.
//  Copyright (c) 2012 Roman Laitarenko. All rights reserved.
//

#import "RLConsoleReader.h"
#import "ITEvent.h"
#import "NSObject+InitAutoreleasedObject.h"
#import "RLRunLoop.h"

@interface RLConsoleReader ()

@property (nonatomic, readwrite, retain) NSMutableArray  *mutableEvents;
@property (nonatomic, readwrite, assign) BOOL            isReading;
@property (nonatomic, readwrite, retain) NSMutableString *resultOfUserInput;

// this is definitely something stupid
@property (nonatomic, readwrite, retain) RLRunLoop *loop;

- (void)getUserInput;
- (void)addInputEvent:(ITEvent *)object;

@end

@implementation RLConsoleReader

@synthesize mutableEvents       = _mutableEvents;
@synthesize isReading           = _isReading;
@synthesize resultOfUserInput   = _resultOfUserInput;
@synthesize loop                = _loop;

@dynamic events;

#pragma mark -
#pragma mark Accessors

- (NSArray *)events {
    NSArray *result = [[self.mutableEvents copy] autorelease];
    [self.mutableEvents removeAllObjects];
    return result;
}

#pragma mark -
#pragma mark Initializations And Deallocations

- (void)dealloc {
    self.mutableEvents = nil;
    self.resultOfUserInput = nil;
    
    [super dealloc];
}

- (id)init {
    if (self = [super init]) {
        self.mutableEvents = [NSMutableArray array];
        self.resultOfUserInput = [NSMutableString string];
        self.loop = [RLRunLoop autoreleasedObject];
    }
    return self;
}

#pragma mark -
#pragma mark Public

- (ITEvent *)getInputEvent {
    ITEvent *event = [self.mutableEvents lastObject];
    if (event) {
        [self.mutableEvents removeLastObject];
    }
    return event;
}

- (void)start {
    self.isReading = YES;
    [self.loop scheduleEventUsingSelector:@selector(getUserInput) withObject:self];
    [self.loop performSelectorInBackground:@selector(start) withObject:nil];
}

- (void)stop {
    [self.loop stop];
}

#pragma mark -
#pragma mark Private

- (void)addInputEvent:(ITEvent *)event {
    if (event) {
        [self.mutableEvents insertObject:event atIndex:0];
    }
}

- (void)getUserInput {
    int inputChar;
    NSMutableString *result = [NSMutableString string];
    
    while (((inputChar = getc(stdin)) != EOF) && self.isReading) {
        if (inputChar == '\n') {
            ITEvent *container = [[ITEvent alloc] initWithDate:[NSDate date] value:result];
            result = [NSMutableString string];
            [self addInputEvent:[container autorelease]];
        } else {
            [result appendString:[NSString stringWithFormat:@"%c", inputChar]];
        }
    }
    [pool release];
}

@end
