//
//  ReadUserInput.h
//  InteractiveTour
//
//  Created by Roman Laitarenko on 12/16/12.
//  Copyright (c) 2012 Roman Laitarenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITEvent.h"

@protocol RlConsoleReaderParent <NSObject>

- (void)obtainInput:(ITEvent *)event;

@end

@interface RLConsoleReader : NSObject

@property (nonatomic, readonly, retain) NSArray *events;
@property (nonatomic, readonly, assign) BOOL    isReading;

- (ITEvent *)getInputEvent;
- (void)start;
- (void)stop;

@end
