//
//  DMDViewController.h
//  RiyazTest
//
//  Created by Avinash Mishra on 22/10/13.
//  Copyright (c) 2013 Avinash Mishra. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DMDView;

@interface DMDViewController : UIViewController

@property (nonatomic, retain) IBOutlet DMDView*         rotationView;
@property (nonatomic, retain) IBOutlet UILabel*         label;

@end
