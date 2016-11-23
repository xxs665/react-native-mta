//
//  RCTMta.h
//  RCTMta
//
//  Created by xiaosheng xu on 16/11/23.
//  Copyright © 2016年 xiaosheng xu. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RCTBridgeModule.h"
#import "RCTBridge.h"
#import "RCTEventEmitter.h"


@interface RCTMta : : NSObject <RCTBridgeModule>

@property (nonatomic, strong) RCTBridge *bridge;

@end
