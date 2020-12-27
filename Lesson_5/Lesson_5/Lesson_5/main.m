//
//  main.m
//  Lesson_5
//
//  Created by Андрей Щекатунов on 21.12.2020.
//  Copyright © 2020 Andrey Shchekatunov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "СalculatorObj.h"
#import "Swan.h"
#import "Eagle.h"
#import "Flock.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //        int first;
        //        int second;
        //        int arithmetic;
        //
        //        printf("First number: ");
        //        scanf("%d", &first);
        //        printf("Second number: ");
        //        scanf("%d", &second);
        //        printf("Введите идентификатор арифметической операции: \n Сложение - 1 \n Вычитание - 2 \n Умножение - 3 \n Деление - 4 \n");
        //        scanf("%d", &arithmetic);
        
        CalculatorObj *calculateObj = [[CalculatorObj alloc] init];
        calculateObj.a = 2;
        calculateObj.b = 2;
        calculateObj.sign = 3;
        [calculateObj calculateInt:calculateObj.sign];
        NSLog(@"%d", calculateObj.result);
        [calculateObj release];
        calculateObj = nil;
        NSLog(@"init: retain count is %lu", (unsigned long)calculateObj.retainCount);
        
    }
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    Flock *flock = [[Flock alloc]init];
    [flock autorelease];
    
    Eagle *eagle = [[Eagle alloc]initWithColor: @"green"];
    [eagle autorelease];
    
    Swan *swan1 = [[Swan alloc]initWithCount:@1];
    Swan *swan2 = [[Swan alloc]initWithCount:@2];
    Swan *swan3 = [[Swan alloc]initWithCount:@3];
    NSArray *swans = [[NSArray alloc]initWithObjects:swan1, swan2, swan3, nil];
    [swan1 release];
    [swan2 release];
    [swan3 release];
    
    [swans autorelease];
    
    [flock flockCreateWithSwan:eagle andSwan:swans ];
    NSLog(@"Flock fly south");
    
    [pool release];
    
    return 0;
}
