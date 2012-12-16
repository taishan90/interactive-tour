//
//  main.m
//  InteractiveTour
//
//  Created by Roman Laitarenko on 12/16/12.
//  Copyright (c) 2012 Roman Laitarenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReadUserInput.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        ReadUserInput *userInput = [[ReadUserInput alloc] init];
        [userInput pushBuffer:[userInput getUserInput]];
        
        // do something else
        
        [userInput pushBuffer:[userInput getUserInput]];
        
        for (NSInteger i = [userInput countOfBuffer]; i > 0; i--) {
            NSLog(@"%@", [userInput popBuffer]);
        }
    }
    NSLog(@"Bye");
    return 0;
}

