//
//  RLAbstractConsoleReader.h
//  InteractiveTour
//
//  Created by Roman Laitarenko on 1/17/13.
//  Copyright (c) 2013 Roman Laitarenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RLConsoleReader.h"
#import "ITEvent.h"

@interface RLAbstractConsoleOutputManager : NSObject

- (void)obtainInput;
- (void)activateForReader:(RLConsoleReader *)reader;
- (void)deactivate:(NSNotification *)notification;

@end
