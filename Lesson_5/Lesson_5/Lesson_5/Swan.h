//
//  Swan.h
//  Lesson_5
//
//  Created by Андрей Щекатунов on 27.12.2020.
//  Copyright © 2020 Andrey Shchekatunov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Swan : NSObject

@property (nonatomic, strong) NSNumber *countOfSwan;

-(instancetype)initWithCount:(NSNumber *)countOfSwan;

@end

NS_ASSUME_NONNULL_END
