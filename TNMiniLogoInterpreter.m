//
//  MiniLogoInterpreter.m
//  CocoaMiniLogo
//
//  Created by Nokinen on 13.12.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TNMiniLogoInterpreter.h"

@interface TNMiniLogoInterpreter(private)

-(NSArray*)parseInput:(NSString*)input;
-(NSString*)renderOutput;
-(void)processCommands:(NSArray*)commands;

@end

@implementation TNMiniLogoInterpreter

-(id)init{

	if (self = [super init]) {
		drawingBoard = [[TNDrawingBoard alloc]init];
	}
	
	return self;
}

-(NSString*)interpretMiniLogoString:(NSString*) input{
	
	NSArray* commands = [self parseInput:input];
	[self processCommands:commands];
	NSString* output = [self renderOutput];
	
	return output;
}

-(NSArray*)parseInput:(NSString*)input{
	
//	NSUInteger i, count = [chunks count];
//	for (i = 0; i < count; i++) {
//		NSString * command = [chunks objectAtIndex:i];
//		if ([command isEqualToString:@"hello"]) {
//			NSLog(@"hello");
//		}
//	}
	
	return [input componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	
}

-(NSString*)renderOutput{
	
	NSMutableString* out = [[NSMutableString alloc]init];
	
	//[drawingBoard replaceCharacterAtRow:[NSNumber numberWithInt:0] andColumn:[NSNumber numberWithInt:0] withCharacter:'C'];
	
	int i = [drawingBoard.field count];
	
	for(int j = 0; j < i; j++){
		NSMutableString* newLine = [NSMutableString stringWithFormat:@"%@%@", [drawingBoard.field objectAtIndex:j], @"\n"];
		[out appendString:newLine];
	}
	
	return out;
	
}

-(void)processCommands:(NSArray *)commands{

	NSEnumerator* enumerator = [commands objectEnumerator];
	NSString* command;
	
	while (command = [enumerator nextObject]) {
		NSLog(@"Command to interpret: %@", command);
	}
	
}

@end
