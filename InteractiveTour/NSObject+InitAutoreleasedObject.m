//
//  NSObject+InitAutoreleasedObject.m
//  InteractiveTour
//
//  Created by Roman Laitarenko on 12/26/12.
//  Copyright (c) 2012 Roman Laitarenko. All rights reserved.
//

#import "NSObject+InitAutoreleasedObject.h"

@implementation NSObject (InitAutoreleasedObject)

+ (id)autoreleasedObject {
    return [[[self alloc] init] autorelease];
}

@end
