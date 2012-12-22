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

- (void)pushBuffer:(ITDateAndInputHolder *)object;
- (NSMutableArray *)buffer;

@end

@implementation RLConsoleReader

@synthesize buffer = _buffer;

- (NSMutableArray *)buffer {
    if (!_buffer) {
        _buffer = [[NSMutableArray alloc] init];
    }
    return _buffer;
}

- (void)pushBuffer:(ITDateAndInputHolder *)object {
    if (object) [self.buffer insertObject:object atIndex:0];
}

- (id)popBuffer {
    id object = [self.buffer lastObject];
    if (object) [self.buffer removeLastObject];
    return object;
}

- (NSInteger)countOfBuffer {
    return [self.buffer count];
}

- (void)getUserInput {
    int inputChar;
    NSMutableString *result = [NSMutableString string];
    
    while ((inputChar = getc(stdin)) != EOF) {
        if (inputChar == '\n') {
            ITDateAndInputHolder *container = [[ITDateAndInputHolder alloc] init];
            container.value = [[result copy] autorelease];
            container.date = [NSDate date];
            result = [NSMutableString string];
            [container autorelease];
            [self pushBuffer:container];
        } else {
            [result appendString:[NSString stringWithFormat:@"%c", inputChar]];
        }
    }
}

@end
