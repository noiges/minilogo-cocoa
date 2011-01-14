//
//  MiniLogoInterpreter.h
//  CocoaMiniLogo
//
//  Created by Nokinen on 13.12.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TNDrawingBoard.h"
#import "TNConstants.h"

#define ERROR_CMD_LINE      -1
#define ERROR_INPUT_FILE    -2
#define ERROR_UNKNOWN_CMD   -3
#define ERROR_UNKNOWN_DIR   -4
#define ERROR_WRONG_FORMAT  -5
#define ERROR_WRONG_STATE   -6
#define MAX_CMD_LENGTH      16
#define SIDE_SIZE           80

@interface TNMiniLogoInterpreter : NSObject {
	
@private
	TNDrawingBoard* drawingBoard;
	NSDictionary* directionsDictionary;
	NSDictionary* commandDictionary;
	
}

-(id)init;
-(NSString*)interpretMiniLogoString:(NSString*) input;
-(void)dealloc;

@end
