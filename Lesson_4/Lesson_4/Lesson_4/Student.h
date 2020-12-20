//
//  Student.h
//  Lesson_4
//
//  Created by Андрей Щекатунов on 18.12.2020.
//  Copyright © 2020 Andrey Shchekatunov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject {
    
}

@property(nonatomic, strong)NSString *name;
@property(nonatomic, strong)NSString *surname;
@property(nonatomic, readwrite)NSString* fullName;
@property(readonly)int age;

- (void)printInfo:(Student*)StudentInfo;
- (instancetype)initWithUpAge:(int*)newAge;

@end

NS_ASSUME_NONNULL_END
