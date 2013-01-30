//
//  ITInputSource.h
//  InteractiveTour
//
//  Created by Roman Laitarenko on 1/15/13.
//  Copyright (c) 2013 Roman Laitarenko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^MyBlock)(void);

@interface ITInputSource : NSObject

@property (atomic, readonly, retain)    id         object;
@property (atomic, readonly, assign)    SEL        selector;
@property (atomic, readonly, copy)      MyBlock    block;

// designated initializer
- (id)initWithObject:(id)anObject
            selector:(SEL)aSelector
               block:(MyBlock)aBlock;

@end
