//
//  RLRunLoopNew.h
//  InteractiveTour
//
//  Created by Roman Laitarenko on 1/8/13.
//  Copyright (c) 2013 Roman Laitarenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RLRunLoop : NSObject

- (void)performSelector:(SEL)aSelector withTarget:(id)aTarget;
- (void)run;

@end
