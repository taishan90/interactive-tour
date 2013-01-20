//
//  RLAbstractCRParent.h
//  InteractiveTour
//
//  Created by Roman Laitarenko on 1/20/13.
//  Copyright (c) 2013 Roman Laitarenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITEvent.h"
#import "RLConsoleReader.h"

@interface RLAbstractCRParent : NSObject <RlConsoleReaderParent>

- (void)obtainInput:(ITEvent *)event;
- (void)activate;

@end
