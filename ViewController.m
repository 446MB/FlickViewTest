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

@property UITouch *touchEvent;
@property CGPoint point;
@property float _x_beganTouch;
@property float _y_beganTouch;

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

@synthesize touchEvent;
@synthesize point;
@synthesize _x_beganTouch;
@synthesize _y_beganTouch;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    screen = [UIScreen mainScreen];
    rect = screen.applicationFrame;
    
    self.view.backgroundColor = [UIColor grayColor];
    
    NSLog(@"rect.size.width : %f\nrect.size.height : %f",
          rect.size.width,
          rect.size.height);

    // set secondView.
    secondView = [[UIView alloc] initWithFrame: [self initViewPoint: 1]];
    secondView.backgroundColor = [UIColor blueColor];
    [self.view addSubview: secondView];
    
    // set Button on First View.
    [self.view addSubview: [self generateButton]];
    
    
}

/*
 Set coordinates of Views.
 */
- (CGRect) initViewPoint : (int) intNumberOfView {
    self._next_x = rect.size.width * intNumberOfView;
    self._y = rect.origin.y;
    self._width = rect.size.width;
    self._height = rect.size.height;
    rect = CGRectMake(self._next_x, self._y, self._width, self._height);
    
    NSLog(@"rect.origin.x : %f\nrect.origin.y : %f",
          rect.origin.x,
          rect.origin.y);
    
    return rect;
}

/*
 Button Size
 */
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
    NSLog(@"next did call.");
    self.view.frame = CGRectMake(- self._next_x, 0, self._width, self._height);
    
}


/* 
 touch EVENTS
 */

// Touch Begin.
- (void) touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
    self.touchEvent = [touches anyObject];
    self.point = [self.touchEvent locationInView:self.view];
    // set Start Touch Point;
    self._x_beganTouch = self.point.x;
    self._y_beganTouch = self.point.y;
    NSLog(@"point.x BEGAN : %f", self.point.x);
}

// Touch point Move.
-(void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
    self.point = [self.touchEvent locationInView: self.view];
    NSLog(@"point.x MOVE : %f", self.point.x);
    // get Movement.
    float _movement_x = self.point.x - self._x_beganTouch;
    float _movement_y = self.point.y - self._y_beganTouch;
    NSLog(@"\n\n_movement_x : %f\n\n_movement_y : %f", _movement_x, _movement_y);
    
    // move View
    // Can I use CGRectMake on touchesMoved??
    self.view.frame = CGRectMake(_movement_x, _movement_y, self.view.frame.size.width, self.view.frame.size.height);
}

// Touch End.
-(void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
    self.point = [self.touchEvent locationInView: self.view];
    NSLog(@"point.x END : %f", self.point.x);
}

// To Do : Search.
// touchUp out of View?
-(void)touchesCancelled:(NSSet*)touches withEvent:(UIEvent*)event {
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
