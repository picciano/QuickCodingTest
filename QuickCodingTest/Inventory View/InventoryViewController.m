//
//  InventoryViewController.m
//  QuickCodingTest
//
//  Created by Anthony Picciano on 2/2/15.
//  Copyright (c) 2015 Anthony Picciano. All rights reserved.
//

#import "InventoryViewController.h"
#import "InventoryTableViewCell.h"
#import "UITableViewCell+Item.h"
#import "InventoryDataSource.h"

#define INVENTORY_TABLE_VIEW_CELL @"INVENTORY_TABLE_VIEW_CELL"
#define DEFAULT_TABLE_VIEW_CELL @"DEFAULT_TABLE_VIEW_CELL"

@interface InventoryViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *items;
@property (strong, nonatomic) InventoryDataSource *dataSource;

@end

@implementation InventoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:DEFAULT_TABLE_VIEW_CELL];
    [self.tableView registerClass:[InventoryTableViewCell class] forCellReuseIdentifier:INVENTORY_TABLE_VIEW_CELL];
    
    self.dataSource = [[InventoryDataSource alloc] init];
    [self.dataSource loadDataWithBlock:^(NSArray *data, NSError *error) {
        if (error) {
            NSLog(@"Error loading inventory data: %@", error);
        } else {
            self.items = data;
            [self.tableView reloadData];
        }
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    
    id item = self.items[indexPath.row];
    
    if (item[DATA_SOURCE_FIELD_AUTHOR]) {
        cell = [tableView dequeueReusableCellWithIdentifier:INVENTORY_TABLE_VIEW_CELL forIndexPath:indexPath];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:DEFAULT_TABLE_VIEW_CELL forIndexPath:indexPath];
    }
    
    cell.item = item;
    
    return cell;
}

@end
