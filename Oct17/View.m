//
//  View.m
//  Oct17
//
//  Created by James Neely on 10/17/13.
//  Copyright (c) 2013 James Neely. All rights reserved.
//

#import "View.h"

@implementation View

- (id) initWithFrame: (CGRect) frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];
        
        //Keep the size of the view the same,
		//but let the center of the view be the origin.
		CGFloat w = self.bounds.size.width;
		CGFloat h = self.bounds.size.height;
		self.bounds = CGRectMake(-w / 2, -h / 2, w, h);
	}
	return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void) drawRect: (CGRect) rect
{
	// Drawing code
	CGRect bounds = self.bounds;
	CGFloat radius = .3 * bounds.size.width;	//in pixels
    
	/*
	 Create the invisible square that will surround the circle.
	 Place the upper left corner of the square at the upper left corner of
	 the View.  bounds.origin.x and bounds.origin.y are the coordinates of
	 the upper left corner of the View.
     */
	CGFloat w = self.bounds.size.width;
	CGFloat h = self.bounds.size.height;
	CGRect r = CGRectMake(
                          -radius,
                          -radius,
                          2 * radius,
                          2 * radius
                          );
    
	CGContextRef c = UIGraphicsGetCurrentContext();
	CGContextBeginPath(c);	//unnecessary here: the path is already empty.
	CGContextAddEllipseInRect(c, r);
	CGContextSetRGBFillColor(c, 1.0, 0.546875, 0.0, 1.0);	//orange
	//Light source at upper left, shadow at lower right.
	CGSize shadow = CGSizeMake(10, -20);
    
	//5 is the amount of blur.  A smaller number makes a sharper shadow.
	CGContextSetShadow(c, shadow, 1);
    CGContextFillPath(c);
    
    //Octagon.
    
    CGContextTranslateCTM(c, -bounds.size.width / 2, -bounds.size.height / 2);
	//CGContextRotateCTM(c, 90 * M_PI / 180);
    
	CGPoint center = CGPointMake(w / 2, h / 2);
	CGFloat radius2 = h / 15;
	CGContextBeginPath(c);
    
    for (int i = 0; i <= 16; i = i + 2) {
		CGFloat theta = 2 * M_PI * i / 16;
		CGFloat x = center.x + radius2 * cosf(theta);
		CGFloat y = center.y - radius2 * sinf(theta);
        
		if (i == 0) {
			CGContextMoveToPoint(c, x, y);
		} else {
			CGContextAddLineToPoint(c, x, y);
		}
	}
    
	CGContextClosePath(c);
	CGContextSetRGBFillColor(c, 1.0, 0.0, 0.0, 0.75);
    CGContextSetShadow(c, CGSizeMake(0, 0), 0);
	CGContextFillPath(c);
    
    [self performSelector: @selector(setNeedsDisplay) withObject: nil afterDelay: 2.0];
    
}
@end
