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
	NSNumber* deltaX;
	NSNumber* deltaY;
	NSNumber* dir;
	BOOL write;
}

-(id)init;
-(void)replaceStringAt:(NSNumber*)row andAt:(NSNumber*)column with:(NSString*)string;
-(NSString*)stringAt:(NSNumber*)row andAt:(NSNumber*)column;
-(void)resetBoard;
-(void)dealloc;

@property (retain, readonly) NSArray* field;
@property (retain, readwrite) NSNumber* x;
@property (retain, readwrite) NSNumber* y;
@property (retain, readwrite) NSNumber* deltaX;
@property (retain, readwrite) NSNumber* deltaY;
@property (retain, readwrite) NSNumber* dir;
@property (readwrite) BOOL write;

@end
