//
//  main.m
//  InteractiveTour
//
//  Created by Roman Laitarenko on 12/16/12.
//  Copyright (c) 2012 Roman Laitarenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RLConsoleReader.h"
#import "ITDateAndInputHolder.h"

int main(int argc, const char * argv[])
{
    RLConsoleReader *userInput = [[RLConsoleReader alloc] init];
    [userInput getUserInput];

    // do something else
    
    for (NSInteger i = [userInput countOfMutableBuffer]; i > 0; i--) {
        ITDateAndInputHolder *container = [userInput popBuffer];
        NSLog(@"%@ : %@", [container value], [container date]);
    }
    [userInput autorelease];
    return 0;
}

