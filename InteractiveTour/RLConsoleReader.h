//
//  ReadUserInput.h
//  InteractiveTour
//
//  Created by Roman Laitarenko on 12/16/12.
//  Copyright (c) 2012 Roman Laitarenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RLConsoleReader : NSObject

@property (nonatomic, strong) NSMutableArray *buffer;

- (id)popBuffer;
- (NSInteger)countOfBuffer;
- (void)getUserInput;

@end
