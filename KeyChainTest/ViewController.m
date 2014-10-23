//
//  ViewController.m
//  KeyChainTest
//
//  Created by ksnowlv on 14/10/23.
//  Copyright (c) 2014年 alibaba. All rights reserved.
//

#import "ViewController.h"
#import "KeychainItemWrapper.h"

@interface ViewController ()

@property (nonatomic, strong) KeychainItemWrapper *uuid;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    KeychainItemWrapper *uuid = [[KeychainItemWrapper alloc]
                                         initWithIdentifier:@"UUID"
                                         accessGroup:@"com.taobao.userinfo"];
    NSString *strUUID = [uuid objectForKey:(__bridge id)kSecValueData];
    
    if (strUUID.length == 0 )
    {
        CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
        strUUID =  CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef));
        
        [uuid setObject:strUUID forKey:(__bridge id)kSecValueData];
        
        NSLog(@"create uuid");
        CFRelease(uuidRef);
    }
    
    NSLog(@"uuid = %@",strUUID);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
