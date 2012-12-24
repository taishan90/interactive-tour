//
//  ReadUserInput.m
//  InteractiveTour
//
//  Created by Roman Laitarenko on 12/16/12.
//  Copyright (c) 2012 Roman Laitarenko. All rights reserved.
//

#import "RLConsoleReader.h"
#import "ITEvent.h"

@interface RLConsoleReader ()

@property (nonatomic, retain) NSMutableArray *mutableBuffer;
@property (nonatomic, readwrite) BOOL inProcessOfGettingInput;

- (void)getUserInput;
- (void)addInputEvent:(ITEvent *)object;

@end

@implementation RLConsoleReader

@dynamic buffer;

@synthesize mutableBuffer =           _mutableBuffer;
@synthesize inProcessOfGettingInput = _inProcessOfGettingInput;

- (id)init {
    if (self = [super init]) {
        self.mutableBuffer = [[[NSMutableArray alloc] init] autorelease];
    }
    return self;
}
- (NSArray *)buffer {
    return [[[self mutableBuffer] copy] autorelease];
}

- (void)addInputEvent:(ITEvent *)event {
    if (event) [self.mutableBuffer insertObject:event atIndex:0];
}

- (ITEvent *)getInputEvent {
    ITEvent *event = [self.mutableBuffer lastObject];
    if (event) [self.mutableBuffer removeLastObject];
    return event;
}

- (void)start {
    self.inProcessOfGettingInput = YES;
    [self getUserInput]; //freaking [self performSelectorInBackground:@selector(getUserInput) withObject:nil] doesn't want to work

}

- (void)stop {
    self.inProcessOfGettingInput = NO;
}

- (void)getUserInput {
    int inputChar;
    NSMutableString *result = [NSMutableString string];
    
    while (((inputChar = getc(stdin)) != EOF) && self.inProcessOfGettingInput) {
        if (inputChar == '\n') {
            ITEvent *container = [[ITEvent alloc] initWithDate:[NSDate date] value:[[result copy] autorelease]];
            result = [NSMutableString string];
            [self addInputEvent:[container autorelease]];
        } else {
            [result appendString:[NSString stringWithFormat:@"%c", inputChar]];
        }
    }
}

- (void)dealloc {
    self.mutableBuffer = nil;

    [super dealloc];
}

@end
