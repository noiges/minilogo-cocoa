//
//  MiniLogoController.h
//  CocoaMiniLogo
//
//  Created by Nokinen on 13.12.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TNMiniLogoInterpreter.h"


@interface TNMiniLogoController : NSObject {

	@private
	IBOutlet NSScrollView* inputScrollView;
	IBOutlet NSScrollView* outputScrollView;
    IBOutlet NSSplitView* splitView;
    IBOutlet NSProgressIndicator* progressIndicator;
    IBOutlet NSTextField* progressLabel;
	
	TNMiniLogoInterpreter* interpreter;
}

-(id)init;
-(void)awakeFromNib;
-(void)bgThread:(NSConnection *)connection;
-(void)bgThreadIsDone:(id)obj;
-(IBAction)clearInputTextView:(id)sender;
-(IBAction)drawOutputTextView:(id)sender;
-(void)dealloc;

@end
