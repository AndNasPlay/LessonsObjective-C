//
//  Swan.m
//  Lesson_5
//
//  Created by Андрей Щекатунов on 27.12.2020.
//  Copyright © 2020 Andrey Shchekatunov. All rights reserved.
//

#import "Swan.h"

@implementation Swan

-(instancetype)initWithCount:(NSNumber *)countOfSwan {
    if (self =[super init]) {
        _countOfSwan = [countOfSwan retain];
        NSLog(@"В стае добавлен лебедь №%@", _countOfSwan);
    }
    return self;
}

-(void)dealloc {
    NSLog(@"Dealloc swan %@", _countOfSwan);
    //self.countOfSwan = nil;
    [_countOfSwan release];
    [super dealloc];
}

@end
