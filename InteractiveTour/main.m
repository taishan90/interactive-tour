//
//  main.m
//  InteractiveTour
//
//  Created by Roman Laitarenko on 12/16/12.
//  Copyright (c) 2012 Roman Laitarenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReadUserInput.h"
#import "ITContainer.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        ReadUserInput *userInput = [[ReadUserInput alloc] init];
        [userInput getUserInput];
        
        // do something else

        for (NSInteger i = [userInput countOfBuffer]; i > 0; i--) {
            ITContainer *container = [userInput popBuffer];
            NSLog(@"%@ : %@", container.value, container.date);
        }
    }

    return 0;
}

