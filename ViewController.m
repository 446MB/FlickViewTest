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
@synthesize scrollView;
@synthesize firstView;
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
    
    self.view.backgroundColor = [UIColor redColor];
    
    NSLog(@"rect.size.width : %f\nrect.size.height : %f",
          rect.size.width,
          rect.size.height);
    
    
    // set Scroll View
    scrollView = [[UIScrollView alloc] initWithFrame: CGRectMake(0, 0, self.rect.size.width, self.rect.size.height)];
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.contentSize = CGSizeMake(320*3, 480);
    [scrollView setShowsVerticalScrollIndicator: NO];
    [scrollView setShowsHorizontalScrollIndicator: NO];
    scrollView.pagingEnabled = YES;
    
    [self.view addSubview: scrollView];
    
    // set firstView.
    firstView = [[UIView alloc] initWithFrame: [self initViewPoint: 0]];
    firstView.backgroundColor = [UIColor lightTextColor];
    [self.scrollView addSubview: firstView];

    // set secondView.
    secondView = [[UIView alloc] initWithFrame: [self initViewPoint: 1]];
    secondView.backgroundColor = [UIColor darkTextColor];
    [self.scrollView addSubview: secondView];

    // set thirdView.
    thirdView = [[UIView alloc] initWithFrame: [self initViewPoint: 2]];
    thirdView.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    [self.scrollView addSubview: thirdView];

}

/*
 Set coordinates of Views.
 */
- (CGRect) initViewPoint : (int) intNumberOfView {
    self._next_x = rect.size.width * intNumberOfView;
//    self._y = rect.origin.y;
    self._y = 0;
    self._width = rect.size.width;
    self._height = rect.size.height;
    rect = CGRectMake(self._next_x, self._y, self._width, self._height);
    
    NSLog(@"self._y : %f", self._y);
    
    NSLog(@"rect.origin.x : %f\nrect.origin.y : %f",
          rect.origin.x,
          rect.origin.y);
    
    return rect;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
