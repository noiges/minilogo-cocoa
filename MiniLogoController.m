//
//  MiniLogoController.m
//  CocoaMiniLogo
//
//  Created by Nokinen on 13.12.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MiniLogoController.h"
#import "MiniLogoInterpreter.h"


@implementation MiniLogoController

-(IBAction)clearInputTextView:(id)sender{
	[[inputTextView documentView]setString:@""];
	[[outputTextView documentView]setString:@""];
}

-(IBAction)drawOutputTextView:(id)sender{
	
	MiniLogoInterpreter* interpreter = [[MiniLogoInterpreter alloc]init];
	[[outputTextView documentView]setString:[interpreter interpretMiniLogoString:[[inputTextView documentView]string]]];
	[interpreter release];
}

@end
