//
//  RNMTA.h
//
//  Created by xiaosheng xu on 16/11/15.
//  Copyright © 2016年 TX. All rights reserved.
//
/**
 名称:        RNMTA
 描述:        MTA的RN支持库
 作者:        kiddxu
 创建时间:     16/11/15
 */

#import <Foundation/Foundation.h>

#import "RCTBridgeModule.h"
#import "RCTBridge.h"
#import "RCTEventEmitter.h"



@interface RNMTA : NSObject <RCTBridgeModule>

  @property (nonatomic, strong) RCTBridge *bridge;

@end
