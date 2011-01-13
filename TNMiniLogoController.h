//
//  MiniLogoController.h
//  CocoaMiniLogo
//
//  Created by Nokinen on 13.12.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface TNMiniLogoController : NSObject {
	IBOutlet NSScrollView* inputTextView;
	IBOutlet NSScrollView* outputTextView;
}

-(IBAction)clearInputTextView:(id)sender;
-(IBAction)drawOutputTextView:(id)sender;

@end
