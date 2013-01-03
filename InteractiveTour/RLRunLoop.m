//
//  RLRunLoop.m
//  InteractiveTour
//
//  Created by Roman Laitarenko on 1/3/13.
//  Copyright (c) 2013 Roman Laitarenko. All rights reserved.
//

#import "RLRunLoop.h"
#import "RLConsoleReader.h"

@implementation RLRunLoop

- (void)getKeyboardInputAndPerformSelector:(SEL)aSelector withObject:(RLConsoleReader*)anArgument {
    int inputChar;
    
    while (((inputChar = getc(stdin)) != EOF) && anArgument.isReading) {
        // probably we should do smthn like this
        [anArgument performSelector:aSelector];
    }
}


@end
