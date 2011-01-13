//
//  TNDrawingBoard.h
//  CocoaMiniLogo
//
//  Created by Nokinen on 13.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface TNDrawingBoard : NSObject {
	NSArray* field;
	NSNumber* x;
	NSNumber* y;
	NSEnumerator* dir;
	BOOL write;
}

-(id)init;

@property (retain, readonly) NSArray* field;
@property (retain, readonly) NSNumber* x;
@property (retain, readonly) NSNumber* y;
@property (retain, readonly) NSEnumerator* dir;
@property (readwrite) BOOL write;

@end
