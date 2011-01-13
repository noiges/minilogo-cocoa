//
//  TNDrawingBoard.h
//  CocoaMiniLogo
//
//  Created by Nokinen on 13.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#define SIDE_SIZE	80

@interface TNDrawingBoard : NSObject {
	
	NSMutableArray* field;
	
	NSNumber* x;
	NSNumber* y;
	
	NSNumber* dir;
	
	BOOL write;
	
}

-(id)init;
-(void)replaceCharacterAtRow:(NSNumber*)row andColumn:(NSNumber*)column withCharacter:(unichar)character;

@property (retain, readonly) NSArray* field;
@property (retain, readonly) NSNumber* x;
@property (retain, readonly) NSNumber* y;
@property (retain, readonly) NSNumber* dir;
@property (readwrite) BOOL write;

@end
