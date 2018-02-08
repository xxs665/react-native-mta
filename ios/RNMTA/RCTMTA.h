//
//  RCTMta.h
//  RCTMta
//
//  Created by xiaosheng xu on 16/11/23.
//  Copyright © 2016年 xiaosheng xu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <React/RCTBridgeModule.h>
#import <React/RCTBridge.h>
#import <React/RCTEventEmitter.h>


@interface RCTMTA : NSObject <RCTBridgeModule>

@property (nonatomic, strong) RCTBridge *bridge;

@end
