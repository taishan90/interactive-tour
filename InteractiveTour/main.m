//
//  main.m
//  InteractiveTour
//
//  Created by Roman Laitarenko on 12/16/12.
//  Copyright (c) 2012 Roman Laitarenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RLConsoleReader.h"
#import "ITEvent.h"

int main(int argc, const char * argv[])
{
    RLConsoleReader *userInput = [[RLConsoleReader alloc] init];
    [userInput start];
    
    usleep(5000000);

    [userInput stop];

    for (ITEvent *container in [userInput events]) {
        NSLog(@"%@ : %@", [container value], [container date]);
    }
    [userInput release];
    
    return 0;
}

