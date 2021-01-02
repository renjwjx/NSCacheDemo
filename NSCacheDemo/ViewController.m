//
//  ViewController.m
//  NSCacheDemo
//
//  Created by renjinwei on 2021/1/1.
//  Copyright © 2021 renjinwei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) NSCache* cache;
@end

@implementation ViewController

- (NSCache *)cache
{
    if (!_cache) {
        _cache = [[NSCache alloc] init];
        _cache.totalCostLimit = 20;
        _cache.countLimit = 8;
    }
    return _cache;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)addData:(id)sender {
    NSURL* url = [NSURL URLWithString:@"https://tse4-mm.cn.bing.net/th/id/OIP.XZIluAO4s8Q4M3DQQs5lSAHaLL?pid=Api&rs=1"];
    for (int i = 0 ; i < 10; i++) {
        NSData* data = [NSData dataWithContentsOfURL:url];
        [self.cache setObject:data forKey:@(i) cost:2];
        NSLog(@"add data %d", i);
    }
    
}
- (IBAction)checkData:(id)sender {
    for (int i = 0; i < 10; i ++) {
        NSData* data = [self.cache objectForKey:@(i)];
        if (data) {
            NSLog(@"get data, %d", i);
        }
    }
    
}
- (IBAction)clearData:(id)sender {
    NSLog(@"clear ...");
    [self.cache removeAllObjects];
    
}

@end
