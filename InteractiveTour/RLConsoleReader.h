//
//  ReadUserInput.h
//  InteractiveTour
//
//  Created by Roman Laitarenko on 12/16/12.
//  Copyright (c) 2012 Roman Laitarenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITEvent.h"

@interface RLConsoleReader : NSObject

@property (nonatomic, readonly) NSArray *buffer;
@property (nonatomic, readonly) BOOL inProcessOfGettingInput;

- (ITEvent *)getInputEvent;
- (void)start;
- (void)stop;
@end
