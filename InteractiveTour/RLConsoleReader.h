//
//  ReadUserInput.h
//  InteractiveTour
//
//  Created by Roman Laitarenko on 12/16/12.
//  Copyright (c) 2012 Roman Laitarenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ITEvent;

@interface RLConsoleReader : NSObject

@property (nonatomic, readonly, retain) NSArray *events;

+ (RLConsoleReader *)sharedReader;

- (ITEvent *)getInputEvent;
- (void)getUserInput;

@end
