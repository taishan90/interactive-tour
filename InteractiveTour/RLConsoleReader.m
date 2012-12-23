//
//  ReadUserInput.m
//  InteractiveTour
//
//  Created by Roman Laitarenko on 12/16/12.
//  Copyright (c) 2012 Roman Laitarenko. All rights reserved.
//

#import "RLConsoleReader.h"
#import "ITDateAndInputHolder.h"

@interface RLConsoleReader ()

@property (nonatomic, assign) NSMutableArray *mutableBuffer;

- (void)pushBuffer:(ITDateAndInputHolder *)object;

@end

@implementation RLConsoleReader

@dynamic buffer;

@synthesize mutableBuffer = _mutableBuffer;

- (NSArray *)buffer {
    return [[[self mutableBuffer] copy] autorelease];
}

- (void)pushBuffer:(ITDateAndInputHolder *)object {
    if (!_mutableBuffer) _mutableBuffer = [[NSMutableArray alloc] init];
    if (object) [self.mutableBuffer insertObject:object atIndex:0];
}

- (id)popBuffer {
    id object = [self.mutableBuffer lastObject];
    if (object) [self.mutableBuffer removeLastObject];
    return object;
}

- (NSInteger)countOfMutableBuffer {
    return [self.mutableBuffer count];
}

- (void)getUserInput {
    int inputChar;
    NSMutableString *result = [NSMutableString string];
    
    while ((inputChar = getc(stdin)) != EOF) {
        if (inputChar == '\n') {
            ITDateAndInputHolder *container = [[ITDateAndInputHolder alloc] initWithDate:[NSDate date] value:[[result copy] autorelease]];
            result = [NSMutableString string];
            [self pushBuffer:[container autorelease]];
        } else {
            [result appendString:[NSString stringWithFormat:@"%c", inputChar]];
        }
    }
}

- (void)dealloc {
    [_mutableBuffer release];
    
    [super dealloc];
}

@end
