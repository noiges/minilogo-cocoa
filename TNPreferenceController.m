//
//  TNPreferenceController.m
//  CocoaMiniLogo
//
//  Created by Nokinen on 05.04.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TNPreferenceController.h"
#import "TNMiniLogoController.h"

@implementation TNPreferenceController

- (id)initWithParent:(TNMiniLogoController*)controller
{
    if(![super initWithWindowNibName:@"Preferences"])
        return nil;
    
    parent = controller;
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
}

-(IBAction)changeMonospacedPreference:(id)sender{
    
    NSLog(@"Changed Monospaced Font Setting to: %ld", [monoCheckBox state]);

    [parent monospacedPreferenceChanged:[monoCheckBox state]];
    
}

@end
