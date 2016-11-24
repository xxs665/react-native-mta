'use strict';

import React, {Component, PropTypes} from 'react';
import {
	StyleSheet,
	View,
	Text,
	Animated,
	Platform,
	Dimensions,
	PickerIOS,
	NativeModules
} from 'react-native';

const RNMTA = NativeModules.MTA;


class MTA {
	startWithAppkey(appkey){
		// appkey = typeof appkey === "string" ? appkey : "";
		RNMTA.startWithAppkey(appkey);
		this.kvs = {};
	}
	startWithAppkeyVersion(appkey){
		// appkey = typeof appkey === "string" ? appkey : "";
		return new Promise((resolve, reject)=>{
			RNMTA.startWithAppkeyVersion(appkey, (error, res)=>{
				if(!error)
					return resolve(res);
				else
					return reject(error);
			});
			
		})
	}
	/**
	 * 设置MTA全局kvs，用户注入用户user_id等操作
	 * @Author   kiddxu
	 * @DateTime 2016-11-17T14:50:08+0800
	 * @param    {object}                 kvs 对象
	 */
	setGlobalKvs(kvs){
		kvs = typeof kvs === "object" && !Array.isArray(kvs) ? kvs : {};
		this.globalKvs = kvs;
	}
	changeToDebugMode(){
		RNMTA.changeToDebugMode();
	}
	trackPageViewBegin(page){
		RNMTA.trackPageViewBegin(page);
	}
	trackPageViewEnd(page){
		RNMTA.trackPageViewEnd(page);
	}

	trackError(error){
		RNMTA.trackError(error);
	}
	trackException(exception){
		RNMTA.trackException(exception);
	}

	trackCustomEvent(event_id, array){
		RNMTA.trackCustomEvent(event_id, array);
	}
	trackCustomEventBegin(event_id, array){
		RNMTA.trackCustomEventBegin(event_id, array);
	}
	trackCustomEventEnd(event_id, array){
		RNMTA.trackCustomEventEnd(event_id, array);
	}

	trackCustomKeyValueEvent(event_id, kvs={}){
		console.debug("trackCustomKeyValueEvent:  ", event_id);
		RNMTA.trackCustomKeyValueEvent(event_id, {...kvs, ...this.globalKvs});
	}
	trackCustomKeyValueEventBegin(event_id, kvs={}){
		RNMTA.trackCustomKeyValueEventBegin(event_id, {...kvs, ...this.globalKvs});
	}
	trackCustomKeyValueEventEnd(event_id, kvs={}){
		RNMTA.trackCustomKeyValueEventEnd(event_id,{...kvs, ...this.globalKvs})
	}
	trackCustomKeyValueEventDuration(seconds,event_id, kvs={}){
		RNMTA.trackCustomKeyValueEventDuration(seconds, event_id, {...kvs, ...this.globalKvs});
	}

	commitCachedStats(maxStatCount){
		RNMTA.commitCachedStats(maxStatCount);
	}

	startNewSession(){
		RNMTA.startNewSession();
	}
	stopSession(){
		RNMTA.stopSession();
	}

	trackActiveBegin(){
		RNMTA.trackActiveBegin();
	}
	trackActiveEnd(){
		RNMTA.trackActiveEnd();
	}
	reportQQ(qq){
		RNMTA.reportQQ(qq);
	}

	reportAccount(account,type,ext){
		RNMTA.reportAccount(account, type, ext);
	}

	trackGameUser(uid,world,level){
		RNMTA.trackGameUser(uid, world, level);
	}

	getMtaUDID(){
		return new Promise((resolve, reject)=>{
			const id = RNMTA.getMtaUDID();
			resolve(id);
		})
	}
}
const mta = new MTA();
export default mta;