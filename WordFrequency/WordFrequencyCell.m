//
//  WordFrequencyCell.m
//  WordFrequency
//
//  Created by puss on 2017/6/9.
//  Copyright © 2017年 puss. All rights reserved.
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
