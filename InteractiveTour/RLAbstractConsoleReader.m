//
//  RLAbstractConsoleReader.m
//  InteractiveTour
//
//  Created by Roman Laitarenko on 1/17/13.
//  Copyright (c) 2013 Roman Laitarenko. All rights reserved.
//

#import "RLAbstractConsoleReader.h"

@implementation RLAbstractConsoleReader

- (void)printDataToConsole:(NSString *)aData {
    [NSException raise:@"Abstract Class Exception" format:@"Error, attempting to instantiate Abstract Class directly." arguments:nil];
}

- (void)acquireInput {
        [NSException raise:@"Abstract Class Exception" format:@"Error, attempting to instantiate Abstract Class directly." arguments:nil];
}

@end
