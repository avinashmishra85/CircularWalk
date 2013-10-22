//
//  DMDViewController.m
//  RiyazTest
//
//  Created by Avinash Mishra on 22/10/13.
//  Copyright (c) 2013 Avinash Mishra. All rights reserved.
//

#import "DMDView.h"
#import "DMDViewController.h"

#define DLog(s, ...)            NSLog(@"<%s:{%d}> = %@", __FUNCTION__, __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
#define LogRect(msg, rect)      DLog(@"%@ x::%f, y::%f, width::%f, height::%f", msg, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
#define LogSize(msg, size)      DLog(@"%@ width::%f, height::%f", msg, size.width, size.height);

@interface DMDViewController ()
{
    int             step;
    CGFloat         angle;
    CGPoint         center;
    CGFloat         radius;
}

@end

@implementation DMDViewController

@synthesize label;
@synthesize rotationView;

- (void)viewDidLoad
{
    [self angularRotation];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) angularRotation
{
    step = 0;
    angle = step * (M_PI / 18.0);
    center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2);
    radius = self.view.bounds.size.width / 4;

    self.rotationView.rotationImage = [UIImage imageNamed:[NSString stringWithFormat:@"%d", ((step % 5) + 1)]];
    self.rotationView.rotationAngle = (M_PI / 2 + angle);
    self.rotationView.center = CGPointMake(center.x + radius * cos(angle), center.y - radius * sin(angle));
    [self.rotationView setNeedsDisplay];

    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(rotateView) userInfo:nil repeats:YES];
    self.label.text = [NSString stringWithFormat:@"%f", (M_PI / 2 + angle) * (180 / M_PI)];
}

- (void) rotateView
{
    angle = ++step * (M_PI / 18.0);
    
    self.rotationView.rotationImage = [UIImage imageNamed:[NSString stringWithFormat:@"%d", ((step % 5) + 1)]];
    self.rotationView.rotationAngle = (M_PI / 2 + angle);
    self.rotationView.center = CGPointMake(center.x + radius * cos(angle), center.y - radius * sin(angle));
    [self.rotationView setNeedsDisplay];
    self.label.text = [NSString stringWithFormat:@"%f", (M_PI / 2 + angle) * (180 / M_PI)];
}


@end
