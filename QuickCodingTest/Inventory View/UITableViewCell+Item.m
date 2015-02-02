//
//  UITableViewCell+Item.m
//  QuickCodingTest
//
//  Created by Anthony Picciano on 2/2/15.
//  Copyright (c) 2015 Anthony Picciano. All rights reserved.
//

#import "UITableViewCell+Item.h"
#import "StyleKit.h"
#import "InventoryDataSource.h"

#define LOADING_IMAGE_ICON_FRAME CGRectMake(0.0f, 0.0f, 15.0f, 15.0f)

@implementation UITableViewCell (Item)

@dynamic item;

- (void)setItem:(id)item {
    item = item;
    
    self.textLabel.text = item[DATA_SOURCE_FIELD_TITLE];
    self.detailTextLabel.text = item[DATA_SOURCE_FIELD_AUTHOR];
    
    // load image to serve as placeholder while product image loads in background
    self.imageView.image = [StyleKit imageOfLoadingIconWithFrame:LOADING_IMAGE_ICON_FRAME];
    
    // load the product image
    [self loadImageWithURLString:item[DATA_SOURCE_FIELD_IMAGE_URL]];
}

- (void)loadImageWithURLString:(NSString *)imageURLString {
    
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    dispatch_async(backgroundQueue, ^{
        NSURL *imageURL = [NSURL URLWithString:imageURLString];
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        UIImage *image = [UIImage imageWithData:imageData];
        
        // only update UI on the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = image;
            [self setNeedsLayout];
        });
        
    });
}

@end
