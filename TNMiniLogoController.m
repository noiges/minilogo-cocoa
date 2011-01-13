//
//  MiniLogoController.m
//  CocoaMiniLogo
//
//  Created by Nokinen on 13.12.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TNMiniLogoController.h"
#import "TNMiniLogoInterpreter.h"


@implementation TNMiniLogoController

-(IBAction)clearInputTextView:(id)sender{
	[[inputTextView documentView]setString:@""];
	[[outputTextView documentView]setString:@""];
}

-(IBAction)drawOutputTextView:(id)sender{
	
	TNMiniLogoInterpreter* interpreter = [[TNMiniLogoInterpreter alloc]init];
	[[outputTextView documentView]setString:[interpreter interpretMiniLogoString:[[inputTextView documentView]string]]];
	[interpreter release];
}

@end
