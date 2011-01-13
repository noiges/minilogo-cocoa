//
//  TNDrawingBoard.m
//  CocoaMiniLogo
//
//  Created by Nokinen on 13.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TNDrawingBoard.h"


@implementation TNDrawingBoard

-(id)init{
	
	if (self = [super init]) {
		
		x = [[NSNumber alloc]initWithInt:0];
		y = [[NSNumber alloc]initWithInt:0];
		dir = [[NSNumber alloc]initWithInt:-1];
		write = NO;
		
		// Initialize field
		field = [[NSMutableArray alloc]init];
		
		// Initialize line with SIDE_SIZE whitespace characters
		NSMutableString* line = [@"" mutableCopy];
		for(int i = 0; i < SIDE_SIZE; i++){
			[line appendString:@"0"];
		}
		
		// Add SIDE_SIZE of the above lines to my field array
		for(int j = 0; j < SIDE_SIZE; j++){
			[field addObject:[line mutableCopy]];
		}
	}
	return self;
}

-(void)replaceCharacterAtRow:(NSNumber*)row andColumn:(NSNumber*)column withCharacter:(unichar)character{

	NSMutableString* line = [field objectAtIndex:[row intValue]];
	[line replaceCharactersInRange:NSMakeRange([column intValue], 1) withString:[NSString stringWithCharacters:&character length:1]];
	
}

@synthesize field;
@synthesize x;
@synthesize y;
@synthesize dir;
@synthesize write;

@end
