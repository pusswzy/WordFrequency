//
//  WordFrequencyTests.m
//  WordFrequencyTests
//
//  Created by 李昊泽 on 2017/6/9.
//  Copyright © 2017年 李昊泽. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "WordFactory.h"
@interface WordFrequencyTests : XCTestCase

@end

@implementation WordFrequencyTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    WordFactory *factory = [[WordFactory alloc] init];
    NSMutableDictionary *dict = [factory getWordFrequencyDict];
    XCTAssertNotNil(dict, @"dict == nil");
}

- (void)testFor {
    int a = 5;
    for (int i = 0; i < a; i++) {
        i=0;
        a -= 1;
        NSLog(@"haha+ %zd------%zd", a, i);
    }
    
    for (int i = 0; i < 10; i++) {
        NSLog(@"%zd",i);
    }
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
