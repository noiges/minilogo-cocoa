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
-(void)processDirCommand:(NSString*)direction;
-(void)processFwdCommand:(NSString*)steps;
-(void)processPenUpCommand;
-(void)processPenDownCommand;
-(void)processHomeCommand;
-(void)draw:(NSNumber*)steps;
-(NSString*)stringForDirection:(NSNumber*)direction;
-(NSString*)combineString:(NSString*)original withString:(NSString*)new;

@end

@implementation TNMiniLogoInterpreter

-(id)init{

	if ((self = [super init])) {
		
		drawingBoard = [[TNDrawingBoard alloc]init];
		
		directionsDictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
								[NSNumber numberWithInteger:VAL_DIR_N],DIR_N, 
								[NSNumber numberWithInteger:VAL_DIR_NE],DIR_NE,
								[NSNumber numberWithInteger:VAL_DIR_E],DIR_E,
								[NSNumber numberWithInteger:VAL_DIR_SE],DIR_SE,
								[NSNumber numberWithInteger:VAL_DIR_S],DIR_S,
								[NSNumber numberWithInteger:VAL_DIR_SW],DIR_SW,
								[NSNumber numberWithInteger:VAL_DIR_W],DIR_W,
								[NSNumber numberWithInteger:VAL_DIR_NW],DIR_NW,
								nil];
		
		commandDictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
							 NSStringFromSelector(@selector(processDirCommand:)), CMD_DIR, 
							 NSStringFromSelector(@selector(processFwdCommand:)), CMD_FWD, 
							 NSStringFromSelector(@selector(processPenUpCommand)), CMD_PEN_UP, 
							 NSStringFromSelector(@selector(processPenDownCommand)), CMD_PEN_DOWN,
							 NSStringFromSelector(@selector(processHomeCommand)), CMD_HOME, 
							 nil];
	}
	
	return self;
}

-(NSString*)interpretMiniLogoString:(NSString*) input{
	
	[drawingBoard resetBoard];
	
	NSArray* commands = [self parseInput:input];
	[self processCommands:commands];
	
	return [self renderOutput];
}

-(NSArray*)parseInput:(NSString*)input{
	return [input componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

-(NSString*)renderOutput{
	
	NSMutableString* out = [NSMutableString string];
	
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
	
	while ((command = [enumerator nextObject])) {
		
		NSString* selectorName = [commandDictionary objectForKey:command];
		if (selectorName != nil){
			
			SEL selector = NSSelectorFromString(selectorName);
			
			NSString* dirSelector = NSStringFromSelector(@selector(processDirCommand:));
			NSString* fwdSelector = NSStringFromSelector(@selector(processFwdCommand:));
			
			if ([selectorName isEqualTo:dirSelector]) {
				NSString* direction = (NSString*)[enumerator nextObject];
				while ([direction isEqualTo:@""]) {
					direction = (NSString*)[enumerator nextObject];
				}
				[self performSelector:selector withObject:direction];
			}else if ([selectorName isEqualTo:fwdSelector]) {
				NSString* steps = (NSString*)[enumerator nextObject];
				while ([steps isEqualTo:@""]) {
					steps = (NSString*)[enumerator nextObject];
				}
				[self performSelector:selector withObject:steps];
			}else {
				[self performSelector:selector];
			}
			
		}
	}
	
}

-(void)processDirCommand:(NSString*)direction{
	
	NSLog(@"DIR %@", direction);
	drawingBoard.dir = [directionsDictionary objectForKey:direction];
	
	if ([direction isEqualTo:DIR_N]) {
		drawingBoard.deltaX = [NSNumber numberWithInt:0];
		drawingBoard.deltaY = [NSNumber numberWithInt:-1];
	}else if ([direction isEqualTo:DIR_S]) {
		drawingBoard.deltaX = [NSNumber numberWithInt:0];
		drawingBoard.deltaY = [NSNumber numberWithInt:1];
	}else if ([direction isEqualTo:DIR_E]) {
		drawingBoard.deltaX = [NSNumber numberWithInt:1];
		drawingBoard.deltaY = [NSNumber numberWithInt:0];
	}else if ([direction isEqualTo:DIR_W]) {
		drawingBoard.deltaX = [NSNumber numberWithInt:-1];
		drawingBoard.deltaY = [NSNumber numberWithInt:0];
	}else if ([direction isEqualTo:DIR_NE]) {
		drawingBoard.deltaX = [NSNumber numberWithInt:1];
		drawingBoard.deltaY = [NSNumber numberWithInt:-1];
	}else if ([direction isEqualTo:DIR_NW]) {
		drawingBoard.deltaX = [NSNumber numberWithInt:-1];
		drawingBoard.deltaY = [NSNumber numberWithInt:-1];
	}else if ([direction isEqualTo:DIR_SE]) {
		drawingBoard.deltaX = [NSNumber numberWithInt:1];
		drawingBoard.deltaY = [NSNumber numberWithInt:1];
	}else if ([direction isEqualTo:DIR_SW]) {
		drawingBoard.deltaX = [NSNumber numberWithInt:1];
		drawingBoard.deltaY = [NSNumber numberWithInt:1];
	}
}

-(void)processFwdCommand:(NSString*)steps{
	
	NSLog(@"FWD %@", steps);
	
	if ([drawingBoard.dir isEqualTo:[NSNumber numberWithInt:-1]]){
		NSLog(@"DIR must be set before FWD command");
	}else {
		NSNumber* stepsToForward = [NSNumber numberWithInt:[steps intValue]];
		[self draw:stepsToForward];
	}

}

-(void)processHomeCommand{
	NSLog(@"HOME");
	drawingBoard.x = 0;
	drawingBoard.y = 0;
	drawingBoard.deltaX = 0;
	drawingBoard.deltaY = 0;
	drawingBoard.dir = [[NSNumber alloc]initWithInteger:-1];
	drawingBoard.write = NO;
}

-(void)processPenUpCommand{
	NSLog(@"PEN_UP");
	drawingBoard.write = NO;
}

-(void)processPenDownCommand{
	NSLog(@"PEN_DOWN");
	drawingBoard.write = YES;
}

-(void)draw:(NSNumber *)steps{
	
	NSLog(@"Drawing %d steps", [steps intValue]);
	NSLog(@"%@",[self stringForDirection:drawingBoard.dir]);
	NSLog(@"Combined string: %@",[self combineString:@"|" withString:@"-"]);
	
	
		
	if (drawingBoard.write) {
		
		for (int i = 0; i < [steps intValue]; i++) {
			drawingBoard.x = [NSNumber numberWithInt:([drawingBoard.x intValue] + [drawingBoard.deltaX intValue] + SIDE_SIZE) % SIDE_SIZE];
			drawingBoard.y = [NSNumber numberWithInt:([drawingBoard.y intValue] + [drawingBoard.deltaY intValue] + SIDE_SIZE) % SIDE_SIZE];
			
			NSString* original = [drawingBoard stringAt:drawingBoard.y andAt:drawingBoard.x];
			NSString* new = [self stringForDirection:drawingBoard.dir];
			NSString* final = [self combineString:original withString:new];
			[drawingBoard replaceStringAt:drawingBoard.y andAt:drawingBoard.x with:final];
		}
		
	}else {
		
		drawingBoard.x = [NSNumber numberWithInt:(([drawingBoard.x intValue] + [drawingBoard.deltaX intValue] * [steps intValue]) + SIDE_SIZE) % SIDE_SIZE];
		drawingBoard.y = [NSNumber numberWithInt:(([drawingBoard.y intValue] + [drawingBoard.deltaY intValue] * [steps intValue]) + SIDE_SIZE) % SIDE_SIZE];
		
	}
	
}

-(NSString*)stringForDirection:(NSNumber*)direction{
	
	switch ([direction intValue]) {
        case 0:
		case 4:
            return @"|";
			
        case 2:
        case 6:
            return @"-";
			
        case 1:
        case 5:
            return @"/";
			
        case 7:
        case 3:
            return @"\\";
			
        default:
            return @"!";
			
    }
}

-(NSString*)combineString:(NSString*)original withString:(NSString*)new{
	
	if ([original isEqualTo:@"!"] || [new isEqualTo:@"!"])
		return @"!";
	
	if ([original isEqualTo:@" "])
		return new;
	
	if ([original isEqualTo:@"|"]) {
		if ([new isEqualTo:@"|"])
			return @"|";
		if ([new isEqualTo:@"-"])
			return @"+";
		if ([new isEqualTo:@"\\"])
			return @"*";
		if ([new isEqualTo:@"/"])
			return @"*";
	}else if ([original isEqualTo:@"-"]) {
		if ([new isEqualTo:@"|"])
			return @"+";
		if ([new isEqualTo:@"-"])
			return @"-";
		if ([new isEqualTo:@"\\"])
			return @"*";
		if ([new isEqualTo:@"/"])
			return @"*";
	}else if ([original isEqualTo:@"/"]) {
		if ([new isEqualTo:@"|"])
			return @"*";
		if ([new isEqualTo:@"-"])
			return @"*";
		if ([new isEqualTo:@"\\"])
			return @"X";
		if ([new isEqualTo:@"/"])
			return @"/";
	}else if ([original isEqualTo:@"\\"]) {
		if ([new isEqualTo:@"|"])
			return @"*";
		if ([new isEqualTo:@"-"])
			return @"*";
		if ([new isEqualTo:@"\\"])
			return @"\\";
		if ([new isEqualTo:@"/"])
			return @"X";
	}else if ([original isEqualTo:@"+"]) {
		if ([new isEqualTo:@"|"])
			return @"+";
		if ([new isEqualTo:@"-"])
			return @"+";
		if ([new isEqualTo:@"\\"])
			return @"*";
		if ([new isEqualTo:@"/"])
			return @"*";
	}else if ([original isEqualTo:@"X"]) {
		if ([new isEqualTo:@"|"])
			return @"*";
		if ([new isEqualTo:@"-"])
			return @"*";
		if ([new isEqualTo:@"\\"])
			return @"X";
		if ([new isEqualTo:@"/"])
			return @"X";
	}
	
	return @"!";
	
}

- (void) dealloc
{
	[drawingBoard release];
	[directionsDictionary release];
	[commandDictionary release];
    [super dealloc];
}

@end
