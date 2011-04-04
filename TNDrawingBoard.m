//
//  TNDrawingBoard.m
//  CocoaMiniLogo
//
//  Created by Nokinen on 13.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TNDrawingBoard.h"
#import "TNConstants.h"


@implementation TNDrawingBoard

-(id)init{
	
	if ((self = [super init])) {
		
		x = [[NSNumber alloc]initWithInt:0];
		y = [[NSNumber alloc]initWithInt:0];
		dir = [[NSNumber alloc]initWithInt:-1];
		write = NO;
		
		// Initialize field
		field = [[NSMutableArray alloc]init];
		
		// Initialize line with SIDE_SIZE whitespace characters
		NSMutableString* line = [NSMutableString string];
		for(int i = 0; i < SIDE_SIZE; i++){
			[line appendString:@" "];
		}
		
		// Add SIDE_SIZE of the above lines to my field array
		for(int j = 0; j < SIDE_SIZE; j++){
			[field addObject:[line mutableCopy]];
		}
		
	}
	return self;
}

-(void)replaceStringAt:(NSNumber*)row andAt:(NSNumber*)column with:(NSString*)string{

	NSMutableString* line = [field objectAtIndex:[row intValue]];
	[line replaceCharactersInRange:NSMakeRange([column intValue], 1) withString:string];
	
}

-(NSString*)stringAt:(NSNumber*)row andAt:(NSNumber*)column{
	NSString* line = [field objectAtIndex:[row intValue]];
	return [line substringWithRange:NSMakeRange([column intValue], 1)];
}

-(void)resetBoard{
	
	[x autorelease];
	[y autorelease];
	[dir autorelease];
	
	x = [[NSNumber alloc]initWithInt:0];
	y = [[NSNumber alloc]initWithInt:0];
	dir = [[NSNumber alloc]initWithInt:-1];
	write = NO;
	
	// Initialize line with SIDE_SIZE whitespace characters
	NSMutableString* line = [NSMutableString string];
	for(int i = 0; i < SIDE_SIZE; i++){
		[line appendString:@" "];
	}
	
	// Add SIDE_SIZE of the above lines to my field array
	for(int j = 0; j < SIDE_SIZE; j++){
		[[field objectAtIndex:j] autorelease];
		[field replaceObjectAtIndex:j withObject:[line mutableCopy]];
	}
	
}

-(void)dealloc{
	
	for(int j = 0; j < SIDE_SIZE; j++){
		[[field objectAtIndex:j]release];
	}
	
	[field release];
	[x release];
	[y release];
	[deltaX release];
	[deltaY	release];
	[dir release];
	
	[super dealloc];
}

@synthesize field;
@synthesize x;
@synthesize y;
@synthesize deltaX;
@synthesize deltaY;
@synthesize dir;
@synthesize write;

@end
