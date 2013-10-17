//
//  main.m
//  Oct17
//
//  Created by James Neely on 10/17/13.
//  Copyright (c) 2013 James Neely. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Oct17AppDelegate.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {
        
        NSDictionary *d = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"deer, a female deer",		@"doe",
                           @"drop of golden sun",		@"ray",
                           @"name I call myself",		@"me",
                           @"long, long way to run",	@"far",
                           @"needle pulling thread",	@"sew",
                           @"note to follow sol",		@"la",
                           @"drink with jam and bread",	@"ti",
                           nil
                           ];
        
		//The key is what you look up.
		NSString *key = @"me";
        
		NSLog(@"%@ is %@\n\n", key, [d objectForKey: key]);
        
		//Loop through all the keys,
		//not necessarily ion the order in which you inserted them.
		NSEnumerator *e = [d keyEnumerator];
        
		while ((key = [e nextObject]) != nil) {
			NSLog(@"%@, a %@", key, [d objectForKey: key]);
		}
        

        return UIApplicationMain(argc, argv, nil, NSStringFromClass([Oct17AppDelegate class]));
    }
}
