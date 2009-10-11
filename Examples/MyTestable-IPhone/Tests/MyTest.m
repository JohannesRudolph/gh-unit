//
//  MyTest.m
//  MyTestable
//
//  Created by Gabriel Handford on 2/15/09.
//  Copyright 2009. All rights reserved.
//

#import "GHUnit.h"
#import "OCMock.h"

@interface MyTest : GHTestCase { }
@end

@implementation MyTest

- (void)setUp {
	// Run before each test method
}

- (void)tearDown {
	// Run after each test method
}

- (void)testFail {	
	GHAssertTrue(NO, nil);
}

- (void)testBar {
	// Another test
}

- (void) testCanCreateMock {
	id mock = [OCMockObject mockForClass:[NSString class]];
	GHAssertNotNil(mock, nil);
}	

@end