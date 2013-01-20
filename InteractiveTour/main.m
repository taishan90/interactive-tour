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
#import "RLExampleCRParent.h"

int main(int argc, const char * argv[])
{
    RLConsoleReader *userInput = [[RLConsoleReader alloc] init];
    RLExampleCRParent *parent = [[RLExampleCRParent alloc] init];
    [parent activate];
    [userInput start];
    
    usleep(5000000);

    [userInput stop];

    [userInput release];
    [parent release];
    
    return 0;
}

