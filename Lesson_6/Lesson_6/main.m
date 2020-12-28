//
//  main.m
//  Lesson_6
//
//  Created by Андрей Щекатунов on 27.12.2020.
//  Copyright © 2020 Andrey Shchekatunov. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        __block int first = 5;
        __block int second = 30;
        __block int number = 3;
        __block int zP = 100;
        NSArray *testArray = @[@"ноль", @"Два", @"дыня", @"смех", @"дуб"];
        NSArray *noArr = @[@"Нет такого значения"];
        __block int result;
        
        int (^multipl)(int, int) = ^(int first, int second) {
            return first * second;
        };
        
        int (^sub)(int, int) = ^(int first, int second) {
            return first - second;
        };
        
        int (^sum)(int, int) = ^(int first, int second) {
            return first + second;
        };
        
        int (^div)(int, int) = ^(int first, int second) {
            if (second != 0) {
                return first / second;
            } else {
                return 0;
            }
        };
        
        int (^NDFL)(int) = ^(int number) {
            if ((number > 0) && (number != 0)) {
                return (number / 100) * 13;
            } else {
                return 0;
            }
        };
        
        NSString* (^numberInArr)(NSArray*, int) = ^(NSArray* testArr, int number) {
            if ((number >= 0) && (number <= testArray.count)) {
                return testArr[number];
            } else {
                return noArr[0];
            }
        };
        
        // dispatch_queue_t mainQueue = dispatch_get_main_queue();
        dispatch_queue_t parallelQ = dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0);
        
        dispatch_barrier_async(parallelQ, ^{
            result = NDFL(zP);
            NSLog(@"Процент отчислений = %i", result);
        });
        
        dispatch_async(parallelQ, ^{
            result = multipl(first,second);
            NSLog(@"Результат умножения = %i", result);
            
            result = sub(first, second);
            NSLog(@"Результат разности = %i", result);
            
            result = div(first,second);
            NSLog(@"Результат деления = %i", result);
            
            result = sum(first,second);
            NSLog(@"Результат сложения = %i", result);
            
        });
        
        NSString *testString = numberInArr(testArray, number);
        NSLog(@"%@", testString);
        
        sleep(2);
    }
    return 0;
}
