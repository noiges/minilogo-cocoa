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
		
		field = [[NSArray alloc]init];
		x = [[NSNumber alloc]initWithInt:0];
		y = [[NSNumber alloc]initWithInt:0];
		dir = [[NSEnumerator alloc]init];
		write = NO;
		
	}
	
	return self;
	
}

@synthesize field;
@synthesize x;
@synthesize y;
@synthesize dir;
@synthesize write;

@end
