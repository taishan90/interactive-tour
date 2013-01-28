//
//  main.m
//  InteractiveTour
//
//  Created by Roman Laitarenko on 12/16/12.
//  Copyright (c) 2012 Roman Laitarenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RLConsoleReader.h"
#import "RLAbstractOutputManager.h"
#import "RLRunLoop.h"
#import "NSObject+InitAutoreleasedObject.h"

int main(int argc, const char * argv[]) {
    RLRunLoop *loop = [RLRunLoop autoreleasedObject];
    RLAbstractOutputManager *outputManager = [RLAbstractOutputManager autoreleasedObject];

    [outputManager activate];
    [loop scheduleEventUsingSelector:@selector(getUserInput) object:[RLConsoleReader sharedReader] block:^{
        [[RLConsoleReader sharedReader] getUserInput];
        [[RLAbstractOutputManager activeManager] didReceiveInputEvent:[[RLConsoleReader sharedReader] getInputEvent]];
        
    }];
    [loop start];

    return 0;
}
