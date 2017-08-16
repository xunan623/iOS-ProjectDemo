//
//  MVPPresenter.h
//  MVPDemo
//
//  Created by xunan on 2017/8/16.
//  Copyright © 2017年 xunan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MVPController.h"

@interface MVPPresenter : NSObject

- (instancetype)initPersenterWithVC:(MVPController *)vc;

- (void)reloadData;

@end
