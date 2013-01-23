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

+ (RLAbstractOutputManager *)activeOutputManager;

- (void)activate;
- (void)didReceiveInputEvent:(ITEvent *)aEvent;

@end
