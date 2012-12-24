//
//  ITContainer.h
//  InteractiveTour
//
//  Created by Roman Laitarenko on 12/20/12.
//  Copyright (c) 2012 Roman Laitarenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ITEvent : NSObject {
    NSDate *_date;
}

@property (nonatomic, readonly) NSString *value;
@property (nonatomic, readonly, retain) NSDate *date;

- (id)initWithDate:(NSDate *)date value:(NSString *)value;

@end
