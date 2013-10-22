//
//  DMDView.h
//  RiyazTest
//
//  Created by Avinash Mishra on 22/10/13.
//  Copyright (c) 2013 Avinash Mishra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMDView : UIView

@property (nonatomic) CGFloat rotationAngle;
@property (nonatomic) CGPoint rotationPoint;
@property (nonatomic, retain) UIImage* rotationImage;

@end
