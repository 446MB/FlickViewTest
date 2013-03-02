//
//  ViewController.m
//  FlickViewTest
//
//  Created by Kenichi Yoshimura on 2013/03/02.
//  Copyright (c) 2013年 Yoshimura Kenichi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property float _next_x;
@property float _prev_x;
@property float _y;
@property float _width;
@property float _height;

@end

@implementation ViewController

@synthesize screen;
@synthesize rect;
@synthesize secondView;
@synthesize thirdView;
@synthesize _next_x;
@synthesize _prev_x;
@synthesize _y;
@synthesize _width;
@synthesize _height;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    screen = [UIScreen mainScreen];
    rect = screen.applicationFrame;
    
    NSLog(@"rect.size.width : %f\nrect.size.height : %f",
          rect.size.width,
          rect.size.height);
    
    
    secondView = [[UIView alloc] initWithFrame: [self initViewPoint: 1]];
    secondView.backgroundColor = [UIColor blueColor];
    [self.view addSubview: secondView];
    
    [self.view addSubview: [self generateButton]];
}

/*
 Set coordinates of Views.
 */
- (CGRect) initViewPoint : (int) intNumberOfView {
    self._next_x = rect.size.width * intNumberOfView;
    self._y = 0;
    self._width = rect.size.width;
    self._height = rect.size.height;
    rect = CGRectMake(self._next_x, self._y, self._width, self._height);
    NSLog(@"rect.origin.x : %f\nrect.origin.y : %f",
          rect.origin.x,
          rect.origin.y);
    return rect;
}

- (CGRect) rectSetButtonToButtom {
    float margin = 20;
    float this_height = 40;
    float this_x = 20;
    float this_y = rect.size.height - margin - this_height;
    float this_width = rect.size.width - (margin * 2);
    rect = CGRectMake(this_x, this_y, this_width, this_height);
    return rect;
}

- (UIButton*) generateButton {
    NSString *title = @"NEXT";
    UIButton *button = [[UIButton alloc] initWithFrame: [self rectSetButtonToButtom]];
    [button setTitle: title forState: UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

/* TEST - View movement */
- (void) next {
    screen = [UIScreen mainScreen];
    rect = screen.bounds;
    self.view.frame = CGRectMake(- self._next_x, 0, self._width, self._height);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
