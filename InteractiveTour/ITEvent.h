//
//  ITContainer.h
//  InteractiveTour
//
//  Created by Roman Laitarenko on 12/20/12.
//  Copyright (c) 2012 Roman Laitarenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ITEvent : NSObject

@property (nonatomic, readonly, copy)       NSString    *value;
@property (nonatomic, readonly, retain)     NSDate      *date;

// designated initializer
- (id)initWithDate:(NSDate *)aDate value:(NSString *)aValue;

@end
