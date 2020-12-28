//
//  ViewController.m
//  Lesson_7
//
//  Created by Андрей Щекатунов on 28.12.2020.
//  Copyright © 2020 Andrey Shchekatunov. All rights reserved.
//

#import "ViewController.h"

#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height
#define HALF_SCREEN_WIDTH   SCREEN_WIDTH/2
#define HALF_SCREEN_HEIGHT  SCREEN_HEIGHT/2
#define MAX_SCORE           6

@interface ViewController ()

@property (nonatomic, weak) UIImageView *paddleTop;
@property (nonatomic, weak) UIImageView *paddleBottom;
@property (nonatomic, weak) UIView *gridView;
@property (nonatomic, weak) UIView *ballView;
@property (nonatomic, weak) UILabel *scoreTop;
@property (nonatomic, weak) UILabel *scoreBottom;

@property (nonatomic, strong) UITouch *touchTop;
@property (nonatomic, strong) UITouch *touchBottom;
@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, assign) float *dx;
@property (nonatomic, assign) float *dy;
@property (nonatomic, assign) float *speed;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self config];
}

- (void)lableEasy:(UILabel*)testLable {
    testLable.textColor = [UIColor whiteColor];
    testLable.text = @"0";
    testLable.font = [UIFont systemFontOfSize:40.0 weight:UIFontWeightLight];
    testLable.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:testLable];
};

- (void)config {
    self.view.backgroundColor =[UIColor colorWithRed:100.0/255.0 green:135.0/255.0 blue:191.0/255.0 alpha:1.0];
    
    UIView *grid = [[UIView alloc]initWithFrame:CGRectMake(0.0, HALF_SCREEN_HEIGHT - 2.0, SCREEN_WIDTH, 4)];
    grid.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:grid];
    
    UIImageView *top = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"paddleTop"]];
    top.frame = CGRectMake(30, 40, 90, 60);
    top.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:top];
    self.paddleTop = top;
    
    UIImageView *bottom = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"paddleBottom"]];
    bottom.frame = CGRectMake(30, SCREEN_HEIGHT - 90, 90, 60);
    bottom.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:bottom];
    self.paddleBottom = bottom;
    
    UIView *ball = [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 20, 20)];
    ball.backgroundColor = [UIColor whiteColor];
    ball.layer.cornerRadius = 10.0;
    ball.hidden = NO;
    [self.view addSubview:ball];
    self.ballView = ball;
    
    UILabel *topScore = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 70.0, HALF_SCREEN_HEIGHT - 70.0, 50.0, 50.0)];
    [self lableEasy:topScore];
    self.scoreTop = topScore;
    
    UILabel *bottomScore = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 70.0, HALF_SCREEN_HEIGHT + 20.0, 50.0, 50.0)];
    [self lableEasy:bottomScore];
    self.scoreBottom = bottomScore;
}

@end
