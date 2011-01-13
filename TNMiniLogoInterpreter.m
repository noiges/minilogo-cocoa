//
//  MiniLogoInterpreter.m
//  CocoaMiniLogo
//
//  Created by Nokinen on 13.12.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TNMiniLogoInterpreter.h"

@implementation TNMiniLogoInterpreter

-(id)init{

	if (self = [super init]) {
		drawingBoard = [[TNDrawingBoard alloc]init];
	}
	
	return self;
}

-(NSString*)interpretMiniLogoString:(NSString*) input{
	return @"This is a rendered MiniLOGO output!";
}

@end
