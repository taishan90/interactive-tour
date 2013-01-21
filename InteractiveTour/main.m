//
//  main.m
//  InteractiveTour
//
//  Created by Roman Laitarenko on 12/16/12.
//  Copyright (c) 2012 Roman Laitarenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RLConsoleReader.h"
#import "RLAbstractConsoleOutputManager.h"

int main(int argc, const char * argv[])
{
    RLConsoleReader *userInput = [[RLConsoleReader alloc] init];
    RLAbstractConsoleOutputManager *printer = [[RLAbstractConsoleOutputManager alloc] init];
    
    [printer activateForReader:userInput];
    
    [userInput start];
    
    usleep(5000000);

    [userInput stop];

    [printer obtainInput];

    [userInput release];
    [printer release];

    return 0;
}
