//
//  WordFrequencyCell.h
//  WordFrequency
//
//  Created by puss on 2017/6/9.
//  Copyright © 2017年 puss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WordFrequencyCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *wordLabel;
@property (weak, nonatomic) IBOutlet UILabel *frequencyCountLabel;
@end
