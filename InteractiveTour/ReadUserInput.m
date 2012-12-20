//
//  ReadUserInput.m
//  InteractiveTour
//
//  Created by Roman Laitarenko on 12/16/12.
//  Copyright (c) 2012 Roman Laitarenko. All rights reserved.
//

#import "ReadUserInput.h"
#import "ITContainer.h"

@interface ReadUserInput()

- (void) pushBuffer:(ITContainer *)object;
- (NSMutableArray *) buffer;

@end

@implementation ReadUserInput

@synthesize buffer = _buffer;

- (NSMutableArray *) buffer
{
    if (!_buffer) {
        _buffer = [[NSMutableArray alloc] init];
    }
    
    return _buffer;
}

- (void) pushBuffer:(ITContainer *)object
{
    if (object) [self.buffer insertObject:object atIndex:0];
}

- (id) popBuffer
{
    id object = [self.buffer lastObject];
    if (object) [self.buffer removeLastObject];
    return object;
}


- (NSInteger) countOfBuffer
{
    return [self.buffer count];
}

- (void) getUserInput
{
    char buffer[1024];
    int i = 0;
    int ch;
    
    while ((ch = getc(stdin)) != EOF) {
        if (ch == '\n') {
            buffer[i] = '\0';
            i = 0;
            ITContainer *container = [[ITContainer alloc] init];
            container.value = [NSString stringWithCString:buffer encoding:NSUTF8StringEncoding];
            container.date = [NSDate date];
            [self pushBuffer:container];
        } else {
            buffer[i] = ch;
            i++;
        }
    }
}

@end
