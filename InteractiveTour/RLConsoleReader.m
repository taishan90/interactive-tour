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

@interface RLConsoleReader ()

@property (nonatomic, retain)   NSMutableArray  *mutableBuffer;
@property (readwrite)           BOOL            isReading;

- (void)getUserInput;
- (void)addInputEvent:(ITEvent *)object;

@end

@implementation RLConsoleReader

@synthesize mutableBuffer   = _mutableBuffer;
@synthesize isReading       = _inProcessOfGettingInput;

@dynamic buffer;

#pragma mark Accessors

- (NSArray *)buffer {
    return [[[self mutableBuffer] copy] autorelease];
}

#pragma mark Initializations And Deallocations

- (void)dealloc {
    self.mutableBuffer = nil;
    
    [super dealloc];
}

- (id)init {
    if (self = [super init]) {
        self.mutableBuffer = [NSMutableArray autoreleasedObject];
    }
    return self;
}

#pragma mark Public

- (ITEvent *)getInputEvent {
    ITEvent *event = [self.mutableBuffer lastObject];
    if (event) {
        [self.mutableBuffer removeLastObject];
    }
    return event;
}

- (void)start {
    self.isReading = YES;
    [self getUserInput];
}

- (void)stop {
    self.isReading = NO;
}

#pragma mark Private

- (void)addInputEvent:(ITEvent *)event {
    if (event) {
        [self.mutableBuffer insertObject:event atIndex:0];
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
}

@end
