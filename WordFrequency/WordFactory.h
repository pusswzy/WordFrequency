//
//  WordFactory.h
//  WordFrequency
//
//  Created by 李昊泽 on 2017/6/9.
//  Copyright © 2017年 李昊泽. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WordFactory : NSObject
- (NSString *)getWordData;
- (NSArray *)getWordArray;
- (NSMutableDictionary *)getWordFrequencyDictIsCaseSensitive:(BOOL)isCaseSensitive;
- (NSArray *)getSortKeysFromDictionary:(NSMutableDictionary *)dictionary;
@end
