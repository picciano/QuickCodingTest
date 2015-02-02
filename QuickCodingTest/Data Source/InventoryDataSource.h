//
//  InventoryDataSource.h
//  QuickCodingTest
//
//  Created by Anthony Picciano on 2/2/15.
//  Copyright (c) 2015 Anthony Picciano. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DATA_SOURCE_FIELD_AUTHOR        @"author"
#define DATA_SOURCE_FIELD_IMAGE_URL     @"imageURL"
#define DATA_SOURCE_FIELD_TITLE         @"title"

@interface InventoryDataSource : NSObject

- (void)loadDataWithBlock:(void (^)(NSArray *data, NSError *error))completion;

@end
