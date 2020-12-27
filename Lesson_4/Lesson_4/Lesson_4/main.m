//
//  main.m
//  Lesson_4
//
//  Created by Андрей Щекатунов on 18.12.2020.
//  Copyright © 2020 Andrey Shchekatunov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {
        
    int newAge = 10;
    
    Student *studentOne = [[Student alloc] initWithUpAge:&newAge];
    studentOne.name = @"Dima";
    studentOne.surname = @"Stone";
    [studentOne printInfo: studentOne];
    
    Student *studentTwo = [[Student alloc] init];
    studentTwo.name = @"Jora";
    studentTwo.surname = @"Last";
    [studentTwo printInfo: studentTwo];
    
    return 0;
}
