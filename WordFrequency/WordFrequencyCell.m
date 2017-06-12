//
//  WordFrequencyCell.m
//  WordFrequency
//
//  Created by 李昊泽 on 2017/6/9.
//  Copyright © 2017年 李昊泽. All rights reserved.
//

#import "WordFrequencyCell.h"

@interface WordFrequencyCell ()


@end

@implementation WordFrequencyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
