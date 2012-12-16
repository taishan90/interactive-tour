//
//  ReadUserInput.m
//  InteractiveTour
//
//  Created by Roman Laitarenko on 12/16/12.
//  Copyright (c) 2012 Roman Laitarenko. All rights reserved.
//

#import "ReadUserInput.h"

@interface ReadUserInput()

- (NSMutableArray *)buffer;

@end

@implementation ReadUserInput

- (NSMutableArray *)buffer
{
    if (!_buffer) {
        _buffer = [[NSMutableArray alloc] init];
    }
    
    return _buffer;
}

- (void)pushBuffer:(id)object
{
    if (object) {
        NSDictionary *dict = [NSDictionary dictionaryWithObject:object forKey:[NSDate date]];
        [self.buffer insertObject:dict atIndex:0];
    }
}

- (id)popBuffer
{
    id object = [self.buffer lastObject];
    if (object) [self.buffer removeLastObject];
    return object;
}


- (NSInteger)countOfBuffer
{
    return [self.buffer count];
}

- (NSMutableString *)getUserInput
{
    NSFileHandle *fileHandle = [NSFileHandle fileHandleWithStandardInput];
    NSData *inputData;
    NSString *inputString;
    
    NSLog(@"Enter text please: ");
    inputData = [fileHandle availableData];
    inputString = [[[NSString alloc] initWithData: inputData encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return [inputString mutableCopy];
}


@end
