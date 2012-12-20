//
//  ITContainer.h
//  InteractiveTour
//
//  Created by Roman Laitarenko on 12/20/12.
//  Copyright (c) 2012 Roman Laitarenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ITContainer : NSObject {
    NSString *value;
    NSDate *date;
}

@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong) NSDate *date;

@end
