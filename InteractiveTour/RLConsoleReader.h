//
//  ReadUserInput.h
//  InteractiveTour
//
//  Created by Roman Laitarenko on 12/16/12.
//  Copyright (c) 2012 Roman Laitarenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RLConsoleReader : NSObject

@property (readonly) NSArray *buffer;

- (id)popBuffer;
- (NSInteger)countOfMutableBuffer;
- (void)getUserInput;

@end
