//
//  Flock.m
//  Lesson_5
//
//  Created by Андрей Щекатунов on 27.12.2020.
//  Copyright © 2020 Andrey Shchekatunov. All rights reserved.
//

#import "Flock.h"
#import "Swan.h"
#import "Eagle.h"

@implementation Flock

-(instancetype)init {
    if (self =[super init]) {
        NSLog(@"Стая собралась");
    }
    return self;
}

-(void)dealloc {
    NSLog(@"Dealloc стая");
    [_eagle release];
    [_swans release];
    [super dealloc];
}

-(void)flockCreateWithSwan:(Eagle *)eagle andSwan:(NSArray<Swan *> *) swans {
    [eagle retain];
    [_eagle release];
    _eagle = eagle;
    NSLog(@"Орел добавлен к стае");
    
    NSArray *copy = [swans copy];
    [_swans release];
    _swans = copy;
    for (Swan *swan in _swans) {
        NSLog(@"Add лебедь %@", swan.countOfSwan);
    }
}

@end
