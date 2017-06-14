//
//  WordFactory.m
//  WordFrequency
//
//  Created by puss on 2017/6/9.
//  Copyright © 2017年 puss. All rights reserved.
//

#import "WordFactory.h"

@implementation WordFactory
#pragma mark - initialization
static WordFactory *_instance;
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

+ (instancetype)factory
{
    return [[self alloc] init];
}

#pragma mark - public method
- (NSString *)getWordData
{
    NSFileManager *manager = [NSFileManager defaultManager];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"word" ofType:@"txt"];
    
    if ([manager fileExistsAtPath:filePath]) {
        NSString *str = [self getStringFrom:filePath];
        return str;
    } else {
        [NSException raise:NSGenericException format:@"word.txt did not exist in filePath"];
        return nil;
    }
}

- (NSMutableDictionary *)getWordFrequencyDictIsCaseSensitive:(BOOL)isCaseSensitive
{
    NSArray *wordArray = [self getWordArray];
    NSMutableArray *originalArray = [wordArray mutableCopy];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArray = [originalArray mutableCopy];
    NSInteger times = 0;
    //两点需要优化
    //1.已经遍历的主单词 不应该在遍历一次了 [其实 不会多算的 removeObject其实就是移除所有相同的对象!!!!]
    //2.已经判断等同性的单词应该从数组中删除掉才对

    for (NSInteger i = 0; i <= originalArray.count; i++) {

        i = 0;
        NSString *compareWord = originalArray[i];
        NSInteger count = 0;
        for (NSString *word in originalArray) {
            
            if (isCaseSensitive == YES) {
                if ([compareWord isEqualToString:word]) {
                    count += 1;
                    times += 1;
                    [tempArray removeObject:word];
                }
            } else {
                if ([compareWord caseInsensitiveCompare:word] == NSOrderedSame) {
                    count += 1;
                    times += 1;
                    [tempArray removeObject:word];
                }
            }
        }

        originalArray = [tempArray mutableCopy];
        dict[compareWord] = [NSString stringWithFormat:@"%zd", count];
        NSLog(@"%计算次数zd>>>>>", times);
    }
    return dict;
}

- (NSArray *)getSortKeysFromDictionary:(NSMutableDictionary *)dictionary withSortType:(SortType)type
{
    NSMutableDictionary *dict = dictionary;
    NSArray *sortArray = [dict keysSortedByValueUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        if ([obj1 integerValue] > [obj2 integerValue]) {
            if (type == KLowerType) {
               return (NSComparisonResult)NSOrderedAscending;
            } else {
               return (NSComparisonResult)NSOrderedDescending;
            }
        }
        if ([obj1 integerValue] < [obj2 integerValue]) {
            if (type == KLowerType) {
                return (NSComparisonResult)NSOrderedDescending;
            } else {
                return (NSComparisonResult)NSOrderedAscending;
            }
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    return sortArray;
}

#pragma mark - private method
- (NSArray *)getWordArray
{
    NSString *txtStrings = [self getWordData];
    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@", . ; ( ) : — \n-"];
    NSArray *originalWordArray = [txtStrings componentsSeparatedByCharactersInSet:characterSet];
    NSArray *noBlankArray = [originalWordArray filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"self <> ''"]];
    return noBlankArray;
}

- (NSString *)getStringFrom:(NSString *)filePath
{
    NSString *txtStrings = nil;
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingAtPath:filePath];
    if (fileHandle != nil) {
        NSData *wordData = fileHandle.availableData;
        txtStrings = [[NSString alloc] initWithData:wordData encoding:NSUTF8StringEncoding];
    }
    [fileHandle closeFile];
    return txtStrings;
}
@end
