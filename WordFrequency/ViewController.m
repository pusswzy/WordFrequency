//
//  ViewController.m
//  WordFrequency
//
//  Created by 李昊泽 on 2017/6/9.
//  Copyright © 2017年 李昊泽. All rights reserved.
//

#import "ViewController.h"
#import "WordFactory.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tabBarItem.title = @"文字内容";
    
    WordFactory *factory = [[WordFactory alloc] init];
    NSString *wordText = [factory getWordData];
    self.textView.text = wordText;
//    [self getWordFrequencyFrom:noBlankArray];

}


//- (void)getWordFrequencyFrom:(NSArray *)wordArray
//{
//    NSMutableArray *originalArray = [wordArray mutableCopy];//对原数组进行深拷贝 然后遍历
//    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//    for (int i = 0; i < originalArray.count; i++) {
//        
//        NSString *selWord = originalArray[i];
//        NSInteger count = 1;
//        NSLog(@"%zd--上", count);
//        for (NSString *word in originalArray) {
//            if ([word isEqualToString:selWord]) {
//                count += 1;
//            }
//        }
//        NSLog(@"%zd--下--%@", count, selWord);
//        dict[selWord] = [NSString stringWithFormat:@"%zd", count];
//        
//    }
//    NSLog(@"%@", dict);
//
//}


//- (void)test
//{
//    NSString *originalStr = @"12iiiiaaa32`happp1friend";
//    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"1234567890"];
//    NSArray *array = [originalStr componentsSeparatedByCharactersInSet:characterSet];
//    NSLog(@"%@", array);
//    NSArray *newArray = [array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"self <> ''"]];
//    NSLog(@"%@----%@", array, newArray);
//}

//- (void)testPredicate
//{
//    NSString *str = @"laai";
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self <> 'li'"];
//    if ([predicate evaluateWithObject:str]) {
//        NSLog(@"通过");
//    } else {
//        NSLog(@"不通过");
//    }
//}


@end
