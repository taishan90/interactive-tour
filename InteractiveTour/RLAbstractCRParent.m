//
//  RLAbstractCRParent.m
//  InteractiveTour
//
//  Created by Roman Laitarenko on 1/20/13.
//  Copyright (c) 2013 Roman Laitarenko. All rights reserved.
//

#import "RLAbstractCRParent.h"

@implementation RLAbstractCRParent

#pragma mark -
#pragma mark Public

- (void)obtainInput:(ITEvent *)event {
    [self doesNotRecognizeSelector:_cmd];
}

- (void)activate{
    [self doesNotRecognizeSelector:_cmd];
}


@end
