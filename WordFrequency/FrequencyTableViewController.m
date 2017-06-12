//
//  FrequencyTableViewController.m
//  WordFrequency
//
//  Created by 李昊泽 on 2017/6/9.
//  Copyright © 2017年 李昊泽. All rights reserved.
//

#import "FrequencyTableViewController.h"
#import "WordFactory.h"
#import "WordFrequencyCell.h"
@interface FrequencyTableViewController ()
/** dict  */
@property (nonatomic, strong) NSMutableDictionary *dict;
/** sort array  */
@property (nonatomic, strong) NSArray *sortKeysArray;
@end

@implementation FrequencyTableViewController
static NSString *const CellID = @"frequency";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    WordFactory *factory = [[WordFactory alloc] init];
    NSMutableDictionary *dict = [factory getWordFrequencyDictIsCaseSensitive:NO];
    self.dict = dict;
    self.sortKeysArray = [factory getSortKeys];
    
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 64, 0);
    [self.tableView registerNib:[UINib nibWithNibName:@"WordFrequencyCell" bundle:nil] forCellReuseIdentifier:CellID];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dict.allKeys.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WordFrequencyCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID forIndexPath:indexPath];
//    cell.wordLabel.text = self.dict.allKeys[indexPath.row];
//    cell.frequencyCountLabel.text = self.dict.allValues[indexPath.row];
    cell.wordLabel.text = [NSString stringWithFormat:@"%zd.%@", indexPath.row + 1, self.sortKeysArray[indexPath.row]];
    cell.frequencyCountLabel.text = [self.dict objectForKey:self.sortKeysArray[indexPath.row]];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
