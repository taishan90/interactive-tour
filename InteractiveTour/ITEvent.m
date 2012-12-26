//
//  ITContainer.m
//  InteractiveTour
//
//  Created by Roman Laitarenko on 12/20/12.
//  Copyright (c) 2012 Roman Laitarenko. All rights reserved.
//

#import "ITEvent.h"

@interface ITEvent ()

@property (nonatomic, readwrite, copy)      NSString    *value;
@property (nonatomic, readwrite, retain)    NSDate      *date;

@end

@implementation ITEvent

@synthesize value   = _value;
@synthesize date    = _date;

#pragma mark Initializations And Deallocations

- (void)dealloc {
    self.date = nil;
    self.value = nil;
    
    [super dealloc];
}

- (id)initWithDate:(NSDate *)aDate value:(NSString *)aValue {
    if (self = [super init]) {
        self.date = aDate;
        self.value = aValue;
    }
    return self;
}

@end
