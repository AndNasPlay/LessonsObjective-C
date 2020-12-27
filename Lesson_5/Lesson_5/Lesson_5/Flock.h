//
//  Flock.h
//  Lesson_5
//
//  Created by Андрей Щекатунов on 27.12.2020.
//  Copyright © 2020 Andrey Shchekatunov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Swan, Eagle;

@interface Flock : NSObject

@property (nonatomic, strong) Eagle *eagle;
@property (nonatomic, strong) NSArray<Swan *> *swans;

-(void)flockCreateWithSwan:(Eagle *)eagle andSwan:(NSArray<Swan *> *) swans;

@end

NS_ASSUME_NONNULL_END
