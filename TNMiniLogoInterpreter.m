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
	
	NSString* output;
	
	[drawingBoard replaceCharacterAtRow:[NSNumber numberWithInt:0] andColumn:[NSNumber numberWithInt:0] withCharacter:'C'];
	
	int i = [drawingBoard.field count];
	
	for(int j = 0; j < i; j++){
		NSString* newLine = [NSString stringWithFormat:@"%@%@", [drawingBoard.field objectAtIndex:j], @"\n"];
		output = [output stringByAppendingString:newLine];
	}
	
	return output;
}

@end
