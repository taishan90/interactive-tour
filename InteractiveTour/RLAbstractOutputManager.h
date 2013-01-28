//
//  RLAbstractConsoleReader.h
//  InteractiveTour
//
//  Created by Roman Laitarenko on 1/17/13.
//  Copyright (c) 2013 Roman Laitarenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ITEvent;

@interface RLAbstractOutputManager : NSObject

@property (nonatomic, readonly, getter = isActive) BOOL active;

+ (RLAbstractOutputManager *)activeManager;
+ (void)deactivateAllManagers;

- (void)activate;
- (void)didReceiveInputEvent:(ITEvent *)aEvent;

@end
