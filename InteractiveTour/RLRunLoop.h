//
//  RLRunLoop.h
//  InteractiveTour
//
//  Created by Roman Laitarenko on 1/3/13.
//  Copyright (c) 2013 Roman Laitarenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RLConsoleReader.h"

@interface RLRunLoop : NSRunLoop

- (void)getKeyboardInputAndPerformSelector:(SEL)aSelector withObject:(RLConsoleReader *)anArgument;

@end
