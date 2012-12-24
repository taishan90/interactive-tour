//
//  ITContainer.m
//  InteractiveTour
//
//  Created by Roman Laitarenko on 12/20/12.
//  Copyright (c) 2012 Roman Laitarenko. All rights reserved.
//

#import "ITEvent.h"

@interface ITEvent ()

@property (nonatomic, readwrite) NSString *value;
@property (nonatomic, readwrite, retain) NSDate *date;

@end

@implementation ITEvent

@synthesize value = _value;
@synthesize date =  _date;


- (id)initWithDate:(NSDate *)date value:(NSString *)value {
    if (self = [super init]) {
        [self setDate:date];
        [self setValue:[[value copy] autorelease]];
    }
    return self;
}

- (void)dealloc {
    self.date = nil;
    self.value = nil;
    
    [super dealloc];
}

@end
