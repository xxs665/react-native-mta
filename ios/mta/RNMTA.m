//
//  RNMTA.m
//  answer
//
//  Created by xiaosheng xu on 16/11/15.
//  Copyright © 2016年 TX. All rights reserved.
//

#import "RNMTA.h"


#import "RCTConvert.h"
#import "RCTEventDispatcher.h"
#import "RCTEventEmitter.h"
#import "AppInitialize.h"

#import "MTA.h"
#import "MTAConfig.h"


#import <AVFoundation/AVFoundation.h>
#import <AdSupport/AdSupport.h>


@implementation RNMTA

@synthesize bridge = _bridge;

RCT_EXPORT_MODULE();

/**
 *  启动MTA，必须使用有效的appkey才能正确启动
 */
RCT_EXPORT_METHOD(startWithAppkey:(NSString *)appkey)
{
  [MTA startWithAppkey:appkey];
  NSString *adId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
  NSLog(@"adid: %@", adId);
}

/**
 *  开启debug模式
 */
RCT_EXPORT_METHOD(changeToDebugMode)
{
  [[MTAConfig getInstance] setValue:@true forKey:@"debugEnable"];
}

/**
 * 其它SDK内置启动MTA情况下需要调用下面方法，传入MTA_SDK_VERSION，并检查返回值。
 */
RCT_EXPORT_METHOD(startWithAppkeyVersion:(NSString*) appkey callback:(RCTResponseSenderBlock)callback)
{
  BOOL success = [MTA startWithAppkey:appkey checkedSdkVersion:MTA_SDK_VERSION];
  NSString * error = success ? @"" : @"failed";
  callback(@[error, @true]);
}

/**
 * 统计制定页面访问情况，在页面开始和结束时分别调用以下方法进行数据上报
 */
RCT_EXPORT_METHOD(trackPageViewBegin:(NSString*) page){
  NSLog(@"trackPageViewBegin: %@", page);
  [MTA trackPageViewBegin:page];
}
RCT_EXPORT_METHOD(trackPageViewEnd:(NSString*) page){
  NSLog(@"trackPageViewEnd: %@", page);
  [MTA trackPageViewEnd:page];
}

/**
 * 上报错误和异常
 */
RCT_EXPORT_METHOD(trackError:(NSString*)error){
  [MTA trackError:error];
}
RCT_EXPORT_METHOD(trackException:(NSException*)exception){
  [MTA trackException:exception];
}
//开启自动捕获异常
RCT_EXPORT_METHOD(setAutoExceptionCaught:(bool)tag){
  [[MTAConfig getInstance] setAutoExceptionCaught:tag];
}


RCT_EXPORT_METHOD(trackCustomEvent:(NSString*)event_id args:(NSArray*) array){
  [MTA trackCustomEvent:event_id args:array];
}
RCT_EXPORT_METHOD(trackCustomEventBegin:(NSString*)event_id args:(NSArray*) array){
  [MTA trackCustomEventBegin:event_id args:array];
}
RCT_EXPORT_METHOD(trackCustomEventEnd:(NSString*)event_id args:(NSArray*) array){
  [MTA trackCustomEventEnd:event_id args:array];
}


RCT_EXPORT_METHOD(trackCustomKeyValueEvent:(NSString*)event_id props:(NSDictionary*) kvs){
  [MTA trackCustomKeyValueEvent:event_id props:kvs];
}
RCT_EXPORT_METHOD(trackCustomKeyValueEventBegin:(NSString*)event_id props:(NSDictionary*) kvs){
  [MTA trackCustomKeyValueEventBegin:event_id props:kvs];
}
RCT_EXPORT_METHOD(trackCustomKeyValueEventEnd:(NSString*)event_id props:(NSDictionary*) kvs){
  [MTA trackCustomKeyValueEventEnd:event_id props:kvs];
}


RCT_EXPORT_METHOD(trackCustomKeyValueEventDuration:(uint32_t)seconds withEventid:(NSString*)event_id props:(NSDictionary*) kvs){
  [MTA trackCustomKeyValueEventDuration:seconds withEventid:event_id props:kvs];
}


/**
 * 参数配置
 */
//设置
RCT_EXPORT_METHOD(commitCachedStats:(int32_t) maxStatCount){
  [MTA commitCachedStats:maxStatCount];
}

//启动新会话
RCT_EXPORT_METHOD(startNewSession){
  [MTA startNewSession];
}
//停止会话
RCT_EXPORT_METHOD(stopSession){
  [MTA stopSession];
}

RCT_EXPORT_METHOD(trackActiveBegin){
  [MTA trackActiveBegin];
}
RCT_EXPORT_METHOD(trackActiveEnd){
  [MTA trackActiveEnd];
}

RCT_EXPORT_METHOD(reportAppMonitorStat:(MTAAppMonitorStat*)stat){
  [MTA reportAppMonitorStat:stat];
}

RCT_EXPORT_METHOD(reportQQ:(NSString*)qq){
  [MTA reportQQ:qq];
}

RCT_EXPORT_METHOD(reportAccount:(NSString *)account type:(uint32_t)type ext:(NSString *)ext){
  [MTA reportAccount:account type:type ext:ext];
}

RCT_EXPORT_METHOD(trackGameUser:(NSString*)uid world:(NSString*)wd level:(NSString*)lev){
  [MTA trackGameUser:uid world:wd level:lev];
}

RCT_EXPORT_METHOD(getMtaUDID:(RCTResponseSenderBlock)callback){
  callback(@[[NSNull null], [MTA getMtaUDID] ]);
}

@end
