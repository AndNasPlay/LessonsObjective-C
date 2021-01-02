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
@property (nonatomic, weak) UILabel *playerTop;
@property (nonatomic, weak) UILabel *playerBottom;

@property (nonatomic, strong) UITouch *touchTop;
@property (nonatomic, strong) UITouch *touchBottom;
@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, assign) float dx;
@property (nonatomic, assign) float dy;
@property (nonatomic, assign) float speed;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self config];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self newGame];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    for (UITouch *touch in touches) {
        CGPoint point = [touch locationInView:self.view];
        if (self.touchBottom == nil && point.y > HALF_SCREEN_HEIGHT) {
            self.touchBottom = touch;
            self.paddleBottom.center = point;
        } else if(self.touchTop == nil && point.y < HALF_SCREEN_HEIGHT) {
            self.touchTop = touch;
            self.paddleTop.center = point;
        }
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint point = [touch locationInView:self.view];
        if (self.touchTop == touch) {
            if (point.y > HALF_SCREEN_HEIGHT) {
                point.y = HALF_SCREEN_HEIGHT;
            }
            self.paddleTop.center = point;
        } else if (self.touchBottom == touch) {
            if (point.y < HALF_SCREEN_HEIGHT) {
                point.y = HALF_SCREEN_HEIGHT;
            }
            self.paddleBottom.center = point;
        }
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        if (self.touchTop == touch) {
            self.touchTop = nil;
        } else if (self.touchBottom == touch) {
            self.touchBottom = nil;
        }
    }
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self touchesEnded:touches withEvent:event];
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
    bottom.frame = CGRectMake(SCREEN_WIDTH - 100, SCREEN_HEIGHT - 90, 90, 60);
    bottom.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:bottom];
    self.paddleBottom = bottom;
    
    UIView *ball = [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 20, 20)];
    ball.backgroundColor = [UIColor whiteColor];
    ball.layer.cornerRadius = 10.0;
    ball.hidden = YES;
    [self.view addSubview:ball];
    self.ballView = ball;
    
    UILabel *topScore = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 70.0, HALF_SCREEN_HEIGHT - 70.0, 50.0, 50.0)];
    [self lableEasy:topScore];
    self.scoreTop = topScore;
    
    UILabel *bottomScore = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 70.0, HALF_SCREEN_HEIGHT + 20.0, 50.0, 50.0)];
    [self lableEasy:bottomScore];
    self.scoreBottom = bottomScore;
    
    UILabel *lableTop = [[UILabel alloc] initWithFrame:CGRectMake(0.0, HALF_SCREEN_HEIGHT - 50.0, 100.0, 20.0)];
    [self lableEasy:lableTop];
    lableTop.text = @"Player #1";
    lableTop.font = [UIFont systemFontOfSize:15.0 weight:UIFontWeightLight];
    self.playerTop = lableTop;
    
    UILabel *lableBottom = [[UILabel alloc] initWithFrame:CGRectMake(0.0, HALF_SCREEN_HEIGHT + 20.0, 100.0, 20.0)];
    [self lableEasy:lableBottom];
    lableBottom.text = @"Player #2";
    lableBottom.font = [UIFont systemFontOfSize:15.0 weight:UIFontWeightLight];
    self.playerBottom = lableBottom;
}

- (void)massage:(NSString *)massage {
    [self stop];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Ping Pong" message:massage preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        if([self gameOver] != 0) {
            [self newGame];
        } else {
            [self restart];
            [self start];
        }
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)start {
    self.ballView.center = self.view.center;
    if (self.timer == nil) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:(1.0 / 60.0) target:self selector:@selector(animate) userInfo:nil repeats:YES];
    }
    self.ballView.hidden = NO;
    
}

- (void)animate {
    self.ballView.center = CGPointMake(self.ballView.center.x + self.dx * self.speed, self.ballView.center.y + self.dy * self.speed);
    [self checkBool:CGRectMake(-20.0, 0.0, 20.0, SCREEN_HEIGHT) x:fabs(self.dx) y:0];
    [self checkBool:CGRectMake(SCREEN_WIDTH, 0.0, 20.0, SCREEN_HEIGHT) x:-fabs(self.dx) y:0];
    if ([self checkBool: self.paddleTop.frame x:(self.ballView.center.x - self.paddleTop.center.x) / 32.0 y:1.0]){
        [self increaseSpeed];
    }
    if ([self checkBool: self.paddleBottom.frame x:(self.ballView.center.x - self.paddleBottom.center.x) / 32.0 y:-1.0]){
        [self increaseSpeed];
    }
    [self goal];
    
}

- (void)restart {
    self.dx = ((arc4random() % 2) == 0) ? -1 : 1;
    if(self.dy != 0) {
        self.dy = -self.dy;
    } else {
        self.dy = ((arc4random() % 2) == 0) ? -1 : 1;
    }
    self.ballView.center = self.view.center;
    self.paddleTop.frame = CGRectMake(30, 40, 90, 60);
    self.paddleBottom.frame = CGRectMake(SCREEN_WIDTH - 100, SCREEN_HEIGHT - 90, 90, 60);
    self.speed = 2;
}

- (void)stop {
    [self.timer invalidate];
    self.timer = nil;
    self.ballView.hidden = YES;
}

- (void)newGame {
    [self restart];
    self.scoreTop.text = @"0";
    self.scoreBottom.text = @"0";
    [self massage:@"Вы готовы ?"];
}

- (int)gameOver {
    if ([self.scoreTop.text intValue] >= MAX_SCORE) {
        return 1;
    }
    if([self.scoreBottom.text intValue] >= MAX_SCORE) {
        return 2;
    }
    return 0;
}

- (void)increaseSpeed {
    self.speed += 1;
    if(self.speed > 10.0) {
        self.speed = 10.0;
    }
}

- (BOOL)checkBool:(CGRect)rect x:(float)x y:(float)y {
    if (CGRectIntersectsRect(self.ballView.frame, rect)) {
        if (x != 0.0) {
            self.dx = x;
        }
        if (y != 0.0) {
            self.dy = y;
        }
        return YES;
    }
    return NO;
}

- (BOOL)goal {
    if (self.ballView.center.y < 0.0 || self.ballView.center.y > SCREEN_HEIGHT) {
        int s1 = [self.scoreTop.text intValue];
        int s2 = [self.scoreBottom.text intValue];
        self.ballView.center.y < 0.0 ? s2++ : s1++;
        self.scoreTop.text = [NSString stringWithFormat:@"%u", s1];
        self.scoreBottom.text = [NSString stringWithFormat:@"%u", s2];
        int gameOver = [self gameOver];
        if (gameOver != 0) {
            [self massage:[NSString stringWithFormat:@"Player number %i wins", gameOver]];
        } else {
            [self restart];
        }
        return YES;
    }
    return NO;
}

@end
