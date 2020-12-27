//
//  СalculatorObj.h
//  Lesson_5
//
//  Created by Андрей Щекатунов on 23.12.2020.
//  Copyright © 2020 Andrey Shchekatunov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CalculatorObj : NSObject

@property(nonatomic)int a;
@property(nonatomic)int b;
@property(nonatomic)int sign;
@property(nonatomic, readonly)int result;

//- (void)calculate;
- (int)calculateInt:(int)sign;

@end

NS_ASSUME_NONNULL_END
