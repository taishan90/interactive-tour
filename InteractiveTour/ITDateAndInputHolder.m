//
//  ITContainer.m
//  InteractiveTour
//
//  Created by Roman Laitarenko on 12/20/12.
//  Copyright (c) 2012 Roman Laitarenko. All rights reserved.
//

#import "ITDateAndInputHolder.h"

@interface ITDateAndInputHolder ()

@property (nonatomic, readwrite) NSString *value;
@property (nonatomic, readwrite) NSDate *date;

@end

@implementation ITDateAndInputHolder

@synthesize value = _value;
@synthesize date =  _date;

- (id)initWithDate:(NSDate *)date value:(NSString *)value {
    if (self = [super init]) {
        [self setDate:date];
        [self setValue:value];
    }
    return self;
}

@end
