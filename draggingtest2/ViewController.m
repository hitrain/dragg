//
//  ViewController.m
//  draggingtest2
//
//  Created by  Igor Zhukov on 31.05.16.
//  Copyright © 2016 dd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)detectPan:(UIPanGestureRecognizer *)uiPanGestureRecognizer {
  CGPoint location =
      [uiPanGestureRecognizer locationInView:self.view.superview];

  CGRect bounds = self.view.bounds;
  self.infoHeight.constant = bounds.size.height - location.y;

  if (uiPanGestureRecognizer.state == UIGestureRecognizerStateEnded &&
      self.infoHeight.constant > bounds.size.height / 2) {
    [UIView animateWithDuration:0.5
                     animations:^{
                       self.infoHeight.constant = bounds.size.height;
                       [self.view layoutIfNeeded];
                     }];
  } else if (uiPanGestureRecognizer.state == UIGestureRecognizerStateEnded &&
             self.infoHeight.constant < bounds.size.height / 2) {
    [UIView animateWithDuration:0.5
                     animations:^{
                       self.infoHeight.constant = 100;
                       [self.view layoutIfNeeded];
                     }];
  }
  NSLog(@"y %f", location.y);
  NSLog(@"state: %ld", (long)uiPanGestureRecognizer.state);
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
