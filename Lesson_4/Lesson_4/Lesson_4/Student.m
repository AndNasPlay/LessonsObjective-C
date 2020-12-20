//
//  Student.m
//  Lesson_4
//
//  Created by Андрей Щекатунов on 18.12.2020.
//  Copyright © 2020 Andrey Shchekatunov. All rights reserved.
//

#import "Student.h"

@implementation Student

- (NSString *)fullName {
    _fullName = [NSString stringWithFormat:@"%@ %@", _name, _surname];
    return _fullName;
}

- (instancetype)initWithUpAge:(int*)newAge {
    self = [super init];
    if (self != nil) {
        _age = 18 + *newAge;
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        _age = 18;
    }
    return self;
}

- (void)printInfo:(Student*)StudentInfo {
    NSLog(@"\nСтудент - %@, возраст - %d лет", self.fullName, self.age);
}

@end
