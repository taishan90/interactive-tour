//
//  RLAbstractConsoleReader.h
//  InteractiveTour
//
//  Created by Roman Laitarenko on 1/17/13.
//  Copyright (c) 2013 Roman Laitarenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RLAbstractCRParent.h"

@interface RLExampleCRParent : RLAbstractCRParent

- (void)obtainInput:(ITEvent *)event;
- (void)activate;

@end
