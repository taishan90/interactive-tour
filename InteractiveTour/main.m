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

int main(int argc, const char * argv[])
{
    RLConsoleReader *userInput = [RLConsoleReader sharedReader];
    RLRunLoop *loop = [[RLRunLoop alloc] init];
    RLAbstractOutputManager *printer = [[RLAbstractOutputManager alloc] init];
    
    [printer activate];
    [loop scheduleEventUsingSelector:@selector(getUserInput) object:userInput block:^{
        [userInput getUserInput];
        [[RLAbstractOutputManager activeOutputManager] didReceiveInputEvent:[userInput getInputEvent]];
        
    }];
    [loop start];

    [loop release];
    [printer release];

    return 0;
}
