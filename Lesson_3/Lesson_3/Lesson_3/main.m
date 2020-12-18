//
//  main.m
//  Lesson_3
//
//  Created by Андрей Щекатунов on 15.12.2020.
//  Copyright © 2020 Andrey Shchekatunov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    Addition = 1,
    Subtraction = 2,
    Multiplication = 3,
    Division = 4
} Calculation;

int calculateAddition(int a, int b) {
    return a + b;
}

int calculateSubtraction(int a, int b){
    return a - b;
}

int calculateMultiplication( int a, int b){
    return a * b;
}

int calculateDivision(int a, int b) {
    return a / b;
}

void humanPrint(int age, int gender, NSString *name) {
    if (gender == 0) {
        NSLog(@"\n Имя: %@ \n Возраст: %d \n Пол: мужчина", name, age);
    } else {
        NSLog(@"\n Имя: %@ \n Возраст: %d \n Пол: женщина", name, age);
    }
}

int main(int argc, const char * argv[]) {
    
    // 1. Создать массив строк и вывести его в консоль используя цикл.
    
    NSArray *stringArray = @[@"Строка 1", @"Строка 2", @"Строка 3", @"Строка 4", @"Строка 5"];
    for(int i = 0; i < stringArray.count; ++i) {
        NSLog(@"%@",stringArray[i]);
    }
    
    //2. Улучшить калькулятор с помощью перечислений, чтобы все возможные методы (сложение, вычитание, деление, умножение) передавались в виде состояния;
    
    int first = 0;
    int second = 0;
    int arithmetic = 0;
    
    printf("First number: ");
    scanf("%d", &first);
    printf("Second number: ");
    scanf("%d", &second);
    printf("Введите идентификатор арифметической операции: \n Сложение - 1 \n Вычитание - 2 \n Умножение - 3 \n Деление - 4 \n Идентификатор - ");
    scanf("%d", &arithmetic);
    
    if (arithmetic == Addition) {
        printf("%d \n", calculateAddition(first, second));
    } else if (arithmetic == Subtraction) {
        printf("%d \n", calculateSubtraction(first, second));
    } else if (arithmetic == Multiplication) {
        printf("%d \n", calculateMultiplication(first, second));
    } else if (arithmetic == Division) {
        printf("%d \n", calculateDivision(first, second));
    } else {
        printf("Вы ввели неверный идентификатор!");
    }
    
    // 3 Создать структуру Human. Со свойствами “Name” (NSString), “Age”(NSInterger), “Gander”(NS_Enum). Создать несколько экземпляров структуры и вывести их в консоль.
    
    typedef struct  {
        __unsafe_unretained NSString *Name;
        NSInteger Age;
        NS_ENUM(NSInteger, Gender) {
            man = 0,
            woman = 1,
        };
    }Human;

    Human stefan;
    stefan.Age = 19;
    stefan.Gender = 0;
    stefan.Name = @"Stefan";
    
    Human yulia;
    yulia.Age = 20;
    yulia.Gender = 1;
    yulia.Name = @"Yulia";
    
    Human george;
    george.Age = 44;
    george.Gender = 0;
    george.Name = @"George";
    
    humanPrint(stefan.Age, stefan.Gender, stefan.Name);
    humanPrint(yulia.Age, yulia.Gender, yulia.Name);
    humanPrint(george.Age, george.Gender, george.Name);
    
    return 0;
}




