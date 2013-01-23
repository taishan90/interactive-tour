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

@property (nonatomic, readwrite, retain) NSMutableArray *mutableEvents;

- (void)getUserInput;
- (void)addInputEvent:(ITEvent *)object;

@end

@implementation RLConsoleReader

@synthesize mutableEvents       = _mutableEvents;

@dynamic events;

#pragma mark -
#pragma mark Class Methods

+ (RLConsoleReader *)sharedReader {
    static RLConsoleReader *sharedReader = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedReader = [[super allocWithZone:NULL] init];
    });
    return sharedReader;
}

+ (id)allocWithZone:(NSZone *)zone {
    return [[self sharedReader] retain];
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)events {
    NSArray *result = [[self.mutableEvents copy] autorelease];
    [self.mutableEvents removeAllObjects];
    return result;
}

#pragma mark -
#pragma mark Initializations And Deallocations

- (id)init {
    if (self = [super init]) {
        self.mutableEvents = [NSMutableArray array];
    }
    return self;
}

#pragma mark -
#pragma mark Public

- (ITEvent *)getInputEvent {
    ITEvent *event = [[self.mutableEvents lastObject] retain];
    if (event) {
        [self.mutableEvents removeLastObject];
    }
    return [event autorelease];
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (id)retain {
    return self;
}

- (NSUInteger)retainCount {
    return NSUIntegerMax;
}

- (oneway void)release { }

- (id)autorelease {
    return self;
}

#pragma mark -
#pragma mark Private

- (void)addInputEvent:(ITEvent *)event {
    if (event) {
        [self.mutableEvents insertObject:event atIndex:0];
    }
}

- (void)getUserInput {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSMutableString *resultOfInput = [NSMutableString string];
    int inputChar;
    
    while ((inputChar = getc(stdin)) != '\n') {
        [resultOfInput appendString:[NSString stringWithFormat:@"%c", inputChar]];
    }
    
    ITEvent *container = [[ITEvent alloc] initWithDate:[NSDate date] value:resultOfInput];
    [self addInputEvent:[container autorelease]];

    [pool release];
}

@end
