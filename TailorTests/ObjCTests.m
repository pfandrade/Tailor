//
//  ObjCTests.m
//  TailorTests
//  
//  Created on 17/08/2019.
//  Copyright © 2019 Paulo Andrade. All rights reserved.
//

@import XCTest;
@import Tailor;
#import "TailorTests-Swift.h"

@interface ObjCTests : XCTestCase

@end

@implementation ObjCTests


- (void)testApplyingStyle
{
    TestSubject *subject = [[TestSubject alloc] init];
    [subject applyTestStyle];
    
    XCTAssertEqualObjects(subject.title, @"Test title");
}

- (void)testSwitchingThemes
{
    TestSubject *subject = [[TestSubject alloc] init];
    
    id observer = [ThemeObserver observe:^{
        [subject applyTestStyle];
    }];
    
    XCTAssertEqualObjects(subject.title, @"Test title");
    
    [ThemeObserver switchToThemeWithTitled:@"Another title"];
    
    XCTAssertEqualObjects(subject.title, @"Another title");
    
    observer = nil;
    
    [ThemeObserver switchToThemeWithTitled:@"Third title"];
    
    XCTAssertEqualObjects(subject.title, @"Another title");
}

@end
