//
// Copyright (C) 2015 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
#import <XCTest/XCTest.h>

// Module import for framework target
//
@import SwiftComponents;

@interface BridgingToObjCTests : XCTestCase @end

@implementation BridgingToObjCTests

- (void)testClassFromString {
    Class class1 = NSClassFromString(@"DetailTableViewController");
    NSLog(@"%@", class1);
    XCTAssertNil(class1);
    
    // Use fully qualified class name (ModuleName.ClassName) when introspecting bridged Swift classes.
    Class class2 = NSClassFromString(@"SwiftComponents.DetailTableViewController");
    NSLog(@"%@", class2);
    XCTAssertNotNil(class2);
}

- (void)testIsKindOfClass {
    id controller = [[DetailTableViewController alloc] init];
    
    Class class = [DetailTableViewController class];
    NSLog(@"%@", class);
    XCTAssertTrue([controller isKindOfClass:class]);
}

@end
