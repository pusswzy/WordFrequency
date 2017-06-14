//
//  FrequencyTableViewController.m
//  WordFrequency
//
//  Created by puss on 2017/6/9.
//  Copyright © 2017年 puss. All rights reserved.
//

#import "FrequencyTableViewController.h"
#import "WordFactory.h"
#import "WordFrequencyCell.h"
@interface FrequencyTableViewController ()
/** dict  */
@property (nonatomic, strong) NSMutableDictionary *dict;
/** sort array  */
@property (nonatomic, strong) NSArray *lowerKeysArray;
/** sort array  */
@property (nonatomic, strong) NSArray *uperKeysArray;
/** sort array  */
@property (nonatomic, strong) NSArray *sortKeysArray;
@end

@implementation FrequencyTableViewController
static NSString *const CellID = @"frequency";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    [self handleData];
    self.navigationController.tabBarItem.badgeValue = nil;
    self.sortKeysArray = self.lowerKeysArray;
}

- (void)setupTableView
{
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    [self.tableView registerNib:[UINib nibWithNibName:@"WordFrequencyCell" bundle:nil] forCellReuseIdentifier:CellID];
}

- (void)handleData
{
    WordFactory *factory = [[WordFactory alloc] init];
    NSMutableDictionary *dict = [factory getWordFrequencyDictIsCaseSensitive:NO];
    self.dict = dict;
    self.lowerKeysArray = [factory getSortKeysFromDictionary:dict withSortType:KLowerType];
    self.uperKeysArray = [factory getSortKeysFromDictionary:dict withSortType:KUperType];
}

- (IBAction)transform:(UISegmentedControl *)sender {
    
    if (sender.selectedSegmentIndex == 0) { //水往低处流
        self.sortKeysArray = self.lowerKeysArray;
    } else if (sender.selectedSegmentIndex == 1) { //人往高处走
        self.sortKeysArray = self.uperKeysArray;
    }
    [self.tableView reloadData];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dict.allKeys.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WordFrequencyCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID forIndexPath:indexPath];
    cell.wordLabel.text = [NSString stringWithFormat:@"%zd.%@", indexPath.row + 1, self.sortKeysArray[indexPath.row]];
    cell.frequencyCountLabel.text = [self.dict objectForKey:self.sortKeysArray[indexPath.row]];
    return cell;
}

@end
