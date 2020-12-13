//
//  main.m
//  Сalculator
//
//  Created by Андрей Щекатунов on 08.12.2020.
//  Copyright © 2020 Andrey Shchekatunov. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
        
    int first = 0;
    int second = 0;
    int third = 0;
    int arithmetic = 0;
    
    printf("First number: ");
    scanf("%d", &first);
    printf("Second number: ");
    scanf("%d", &second);
    printf("Введите идентификатор арифметической операции: \n Сложение - 1 \n Вычитание - 2 \n Умножение - 3 \n Деление - 4 \n Cреднее число из 3 переменных  - 5 \n Идентификатор - ");
    scanf("%d", &arithmetic);
    
    switch (arithmetic)
    {
        case 1:
            printf("First value = %i, Second value = %i, Арифметическая операция - Сложение, Result = %i \n", first, second, first + second);
            break;
        case 2:
            printf("First value = %i, Second value = %i, Арифметическая операция - Вычитание, Result = %i \n", first, second, first - second);
            break;
        case 3:
            printf("First value = %i, Second value = %i, Арифметическая операция - Умножение, Result = %i \n", first, second, first * second);
            break;
        case 4:
            printf("First value = %i, Second value = %i, Арифметическая операция - Деление, Result = %i \n", first, second, first / second);
            break;
        case 5:
            printf("Third number: ");
            scanf("%d", &third);
            if ((first > second && first < third) || (first < second && first > third))
                printf("First value = %i, Second value = %i, Third value = %i, Среднее значение = %i, Среднее число = %i \n", first, second, third, (first + second + third) / 3, first);
            else
                if ((second > first && second < third) || (second < first && second > third))
                    printf("First value = %i, Second value = %i, Third value = %i, Среднее значение = %i, Среднее число = %i \n", first, second, third, (first + second + third) / 3, second);
                else
                    printf("First value = %i, Second value = %i, Third value = %i, Среднее значение = %i, Среднее число = %i \n", first, second, third, (first + second + third) / 3, third);
            break;
        default:
            printf("Вы ввели не верный идентификатор арифметической операции!");
    }
    
    return 0;
}
