//
//  ViewController.m
//  KeyChain增删改查
//
//  Created by xunan on 2017/8/18.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import "ViewController.h"
#import "XNKeyChainManager.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *key;
@property (weak, nonatomic) IBOutlet UITextField *value;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)add:(id)sender {
    [self.value endEditing:YES];
    [[XNKeyChainManager shareInstance] addKeyChainWithKey:self.key.text value:self.value.text];
}

- (IBAction)delete:(id)sender {
    [self.value endEditing:YES];
    [[XNKeyChainManager shareInstance] deleteKeyChainWithKey:self.key.text value:self.value.text];
}

- (IBAction)select:(id)sender {
    [self.value endEditing:YES];
    [[XNKeyChainManager shareInstance] selectKeyChainWithKey:self.key.text];
}
- (IBAction)change:(id)sender {
    [self.value endEditing:YES];
    [[XNKeyChainManager shareInstance] updateKeyChainWithKey:self.key.text value:self.value.text];

}

@end
