//
//  DMDView.m
//  RiyazTest
//
//  Created by Avinash Mishra on 22/10/13.
//  Copyright (c) 2013 Avinash Mishra. All rights reserved.
//

#import "DMDView.h"

@implementation DMDView

@synthesize rotationAngle;
@synthesize rotationImage;
@synthesize rotationPoint;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGContextTranslateCTM(context, rect.size.width/2.0f, rect.size.height/2.0f);
	
	// Then we rotate the context, converting our angle from degrees to radians
	CGContextRotateCTM(context, -self.rotationAngle);
	
	// Finally we have to restore the center position
	CGContextTranslateCTM(context, -rect.size.width/2.0f, -rect.size.height/2.0f);

	CGRect imageRect;
	
	// Setup the image size so that the image fills it's natural boudaries in the base coordinate system.
	imageRect.size.width = CGImageGetWidth(self.rotationImage.CGImage);
	imageRect.size.height = CGImageGetHeight(self.rotationImage.CGImage);
	
	// Position the image such that it is centered in the parent view.
	// TODO: fix up for pixel boundaries
	imageRect.origin.x = (rect.size.width - imageRect.size.width) / 2.0f;
	imageRect.origin.y = (rect.size.height - imageRect.size.height) / 2.0f;
    
	// And draw the image.
	CGContextDrawImage(context, imageRect, self.rotationImage.CGImage);

    CGContextRestoreGState(context);
    NSLog(@"");
}

@end
