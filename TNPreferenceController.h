//
//  TNPreferenceController.h
//  CocoaMiniLogo
//
//  Created by Nokinen on 05.04.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class TNMiniLogoController;

@interface TNPreferenceController : NSWindowController {
    
    @private
    IBOutlet NSButton* monoCheckBox;
    TNMiniLogoController* parent;
    
}

-(id)initWithParent:(TNMiniLogoController*)parent;
-(IBAction)changeMonospacedPreference:(id)sender;

@end
