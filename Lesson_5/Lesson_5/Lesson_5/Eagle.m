//
//  Eagle.m
//  Lesson_5
//
//  Created by Андрей Щекатунов on 27.12.2020.
//  Copyright © 2020 Andrey Shchekatunov. All rights reserved.
//

#import "Eagle.h"

@implementation Eagle

-(instancetype)initWithColor:(NSString *)colorEagle; {
    if (self =[super init]) {
        _colorEagle= [colorEagle copy];
        NSLog(@"Лидер стаи орел %@ цвета", _colorEagle);
    }
    return self;
}

-(void)dealloc {
    NSLog(@"Dealloc eagle %@", _colorEagle);
    [_colorEagle release];
    [super dealloc];
}

@end
