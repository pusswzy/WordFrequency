//
//  ViewController.m
//  WordFrequency
//
//  Created by puss on 2017/6/9.
//  Copyright © 2017年 puss. All rights reserved.
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
    
    [self showWord];
}

- (void)showWord
{
    WordFactory *factory = [WordFactory factory];
    NSString *wordText = [factory getWordData];
    self.textView.text = wordText;
}

@end
