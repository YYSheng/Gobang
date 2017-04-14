//
//  ViewController.m
//  GobangWar
//
//  Created by Apple on 2017/4/12.
//  Copyright © 2017年 YYSheng. All rights reserved.
//

#import "ViewController.h"
#import "GobangView.h"

@interface ViewController ()
@property (nonatomic, strong) UIImageView *maskView;
@property (nonatomic, strong) UIButton *startButton;
@property (nonatomic, strong) UIButton *stopButton;
@property (nonatomic, strong) UIButton *resetButton;
@property (nonatomic, strong) GobangView *gobangView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.frame];
    bg.image = [UIImage imageNamed:@"bg"];
    [self.view addSubview:bg];
    
    self.gobangView = [[GobangView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Width)];
    [self.view addSubview:self.gobangView];
    self.gobangView.center = self.view.center;
    self.gobangView.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    self.gobangView.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.gobangView.layer.shadowOpacity = 0.8;//阴影透明度，默认0
    self.gobangView.layer.shadowRadius = 6;//阴影半径，默认3
    
    UIButton *resetButton = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 100) / 2, self.gobangView.frame.size.height + self.gobangView.frame.origin.y + 50, 100, 40)];
    [resetButton setTitle:@"重来" forState:UIControlStateNormal];
    resetButton.backgroundColor = [UIColor whiteColor];
    resetButton.layer.masksToBounds = YES;
    resetButton.layer.cornerRadius = 20;
    [resetButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [resetButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [resetButton addTarget:self action:@selector(resetButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:resetButton];
    
    self.maskView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:self.maskView];
    self.maskView.image = [UIImage imageNamed:@"launch"];
    self.maskView.contentMode = UIViewContentModeScaleAspectFill;
    self.maskView.userInteractionEnabled = YES;
    
    self.startButton = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width/2-40, kScreen_Height-100, 80, 25)];
    [self.maskView addSubview:self.startButton];
    [self.startButton setBackgroundImage:[UIImage imageNamed:@"start"] forState:UIControlStateNormal];
    [self.startButton addTarget:self action:@selector(startButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
//    self.stopButton = [[UIButton alloc] initWithFrame:CGRectMake(166, 475, 86, 25)];
//    [self.stopButton setBackgroundImage:[UIImage imageNamed:@"stop"] forState:UIControlStateNormal];
//    [self.maskView addSubview:self.stopButton];
}
- (void)resetButtonPressed:(UIButton *)button {
    
    [self.gobangView reset];
}

- (void)startButtonPressed:(UIButton *)button {
    
    [self.maskView removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
