//
//  GHUnitIPhoneExceptionViewController.h
//  GHUnitIPhone
//
//  Created by Gabriel Handford on 2/20/09.
//  Copyright 2009. All rights reserved.
//
#import "GHTestViewModel.h"

@interface GHUnitIPhoneExceptionViewController : UIViewController {
	UITextView *textView_;
	GHTestNode *node_;
}

- (id)initWithGHTestNode:(GHTestNode*)node;

@end
