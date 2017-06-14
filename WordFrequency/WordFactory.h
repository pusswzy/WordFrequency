//
//  WordFactory.h
//  WordFrequency
//
//  Created by puss on 2017/6/9.
//  Copyright © 2017年 puss. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    KUperType,
    KLowerType,
} SortType;

@interface WordFactory : NSObject


/**
 创建单词工厂的单例

 @return 返回单例对象
 */
+ (instancetype)factory;

/**
 获取txt文件的字符内容

 @return txt文件的字符数据
 */
- (NSString *)getWordData;


/**
 获取包含单词频率的字典

 @param isCaseSensitive 是否支持大小写敏感
 @return 返回包含单词频率的字典, key值为对应的单词, value为单词对应的频率
 */
- (NSMutableDictionary *)getWordFrequencyDictIsCaseSensitive:(BOOL)isCaseSensitive;


/**
 获取排序后的单词数组

 @param dictionary 包含单词和对应频率的字典
 @param type 排序选择是升序或者降序
 @return 返回排序后的单词数组
 */
- (NSArray *)getSortKeysFromDictionary:(NSMutableDictionary *)dictionary withSortType:(SortType)type;
@end
