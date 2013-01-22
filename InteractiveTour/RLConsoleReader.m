//
//  ReadUserInput.m
//  InteractiveTour
//
//  Created by Roman Laitarenko on 12/16/12.
//  Copyright (c) 2012 Roman Laitarenko. All rights reserved.
//

#import "RLConsoleReader.h"
#import "NSObject+InitAutoreleasedObject.h"

@interface RLConsoleReader ()

@property (nonatomic, readwrite, retain) NSMutableArray     *mutableEvents;
@property (nonatomic, readwrite, retain) NSMutableString    *resultOfUserInput;

- (void)getUserInput;
- (void)addInputEvent:(ITEvent *)object;

@end

@implementation RLConsoleReader

static RLConsoleReader *sharedReader;

@synthesize mutableEvents       = _mutableEvents;
@synthesize resultOfUserInput   = _resultOfUserInput;

@dynamic events;

#pragma mark -
#pragma mark Class Methods

+ (RLConsoleReader *)sharedReader {
    @synchronized(self)
    {
        if (!sharedReader) {
            sharedReader = [[super allocWithZone:NULL] init];
        }
    }
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

- (void)dealloc {
    self.mutableEvents = nil;
    self.resultOfUserInput = nil;
    
    [super dealloc];
}

- (id)init {
    if (self = [super init]) {
        self.mutableEvents = [NSMutableArray array];
        self.resultOfUserInput = [NSMutableString string];
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
    int inputChar = getc(stdin);
    
    if (inputChar == '\n' || inputChar == EOF) {
        ITEvent *container = [[ITEvent alloc] initWithDate:[NSDate date] value:self.resultOfUserInput];
        self.resultOfUserInput = [NSMutableString string];
        [self addInputEvent:[container autorelease]];
    } else {
        [self.resultOfUserInput appendString:[NSString stringWithFormat:@"%c", inputChar]];
    }
    [pool release];
}

@end
