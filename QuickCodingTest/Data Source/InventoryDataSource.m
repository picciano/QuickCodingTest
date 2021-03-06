//
//  InventoryDataSource.m
//  QuickCodingTest
//
//  Created by Anthony Picciano on 2/2/15.
//  Copyright (c) 2015 Anthony Picciano. All rights reserved.
//

#import "InventoryDataSource.h"

#define DATA_SOURCE_URL @"http://de-coding-test.s3.amazonaws.com/books.json"

@implementation InventoryDataSource

- (void)loadDataWithBlock:(void (^)(NSArray *data, NSError *error))completion {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
    dispatch_async(queue, ^{
        NSError *error = nil;
        NSArray *data = [self loadData:&error];
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            completion(data, error);
        });
    });
}

- (NSArray *)loadData:(NSError **)error {
    NSArray *data;
    NSURL *url = [NSURL URLWithString:DATA_SOURCE_URL];
    NSData *jsonData = [NSData dataWithContentsOfURL:url];
    if (jsonData) {
        data = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:error];
    } else {
        *error = [NSError errorWithDomain:@"No data was return from source URL." code:123 userInfo:nil];
    }
    
    return data;
}

@end
