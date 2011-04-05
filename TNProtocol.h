//
//  TNProtocol.h
//  CocoaMiniLogo
//
//  Created by Nokinen on 05.04.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol TNProtocol <NSObject>

@required
-(void)foo:(id)foo;

@optional
-(void)foo2:(id)foo2;
@end
