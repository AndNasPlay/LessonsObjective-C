//
//  СalculatorObj.m
//  Lesson_5
//
//  Created by Андрей Щекатунов on 23.12.2020.
//  Copyright © 2020 Andrey Shchekatunov. All rights reserved.
//

#import "СalculatorObj.h"

@implementation CalculatorObj

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        NSLog(@"init: retain count is %lu", (unsigned long)self.retainCount);
    }
    return self;
}

- (void)dealloc {
    NSLog(@"dealloc");
    [super dealloc];
}

-(int)calculateInt:(int)sign {
    if (sign == 1) {
        int result = _a + _b;
        printf("First value = %i, Second value = %i, Арифметическая операция - Сложение, Result = %i \n", _a, _b, result);
        return _result = result;
    } else if (sign == 2) {
        int result = _a - _b;
        printf("First value = %i, Second value = %i, Арифметическая операция - Вычитание, Result = %i \n", _a, _b, result);
        return _result = result;
    } else if (sign == 3) {
        int result = _a * _b;
        printf("First value = %i, Second value = %i, Арифметическая операция - Умножение, Result = %i \n", _a, _b, result);
        return _result = result;
    } else if (sign == 4) {
        int result = _a / _b;
        printf("First value = %i, Second value = %i, Арифметическая операция - Деление, Result = %i \n", _a, _b, result);
        return _result = result;
    } else {
        return 0;
    }
}

//- (void)calculate {
//    switch (*_sign)
//    {
//        case 1:
//            printf("First value = %i, Second value = %i, Арифметическая операция - Сложение, Result = %i \n", *(_a), *(_b), *(_a) + *(_b));
//            break;
//        case 2:
//            printf("First value = %i, Second value = %i, Арифметическая операция - Вычитание, Result = %i \n", *(_a), *(_b), *(_a) - *(_b));
//            break;
//        case 3:
//            printf("First value = %i, Second value = %i, Арифметическая операция - Умножение, Result = %i \n", *(_a), *(_b), *(_a) * *(_b));
//            break;
//        case 4:
//            printf("First value = %i, Second value = %i, Арифметическая операция - Деление, Result = %i \n", *(_a), *(_b), *(_a) / *(_b));
//            break;
//        default:
//            printf("Вы ввели не верный идентификатор арифметической операции!");
//    }
//}

@end
