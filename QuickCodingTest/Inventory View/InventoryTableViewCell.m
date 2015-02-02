//
//  InventoryTableViewCell.m
//  QuickCodingTest
//
//  Created by Anthony Picciano on 2/2/15.
//  Copyright (c) 2015 Anthony Picciano. All rights reserved.
//

#import "InventoryTableViewCell.h"

@implementation InventoryTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    // override the default style used by dequeueReusableCellWithIdentifier:
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    return self;
}

@end
