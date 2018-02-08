
package vn.lifetimetech.mta;

import android.support.annotation.Nullable;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.bridge.ReadableMapKeySetIterator;
import com.facebook.react.bridge.ReadableType;
import com.tencent.stat.MtaSDkException;
import com.tencent.stat.StatAccount;
import com.tencent.stat.StatAppMonitor;
import com.tencent.stat.StatGameUser;
import com.tencent.stat.StatService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ReactNativeMtaModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;

    public ReactNativeMtaModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "MTA";
    }

    @ReactMethod
    public String test() {
        String test = "test";
        return test;
    }

    @Override
    public @Nullable
    Map<String, Object> getConstants() {
        HashMap<String, Object> constants = new HashMap<String, Object>();

        constants.put("test", this.test());

        return constants;
    }

    @ReactMethod
    public void startWithAppkey(String appkey) {
        try {
            // 第三个参数必须为：com.tencent.stat.common.StatConstants.VERSION
            StatService.startStatService(this.reactContext, appkey,
                    com.tencent.stat.common.StatConstants.VERSION);
        } catch (MtaSDkException e) {
            // MTA初始化失败
        }
    }

    @ReactMethod
    public void changeToDebugMode() {
//        StatService.debu
    }

    @ReactMethod
    public void startWithAppkeyVersion(String appkey, Promise promise) {
//        StatService.sta
    }

    @ReactMethod
    public void trackPageViewBegin(String page) {
        StatService.trackBeginPage(this.reactContext, page);
    }

    @ReactMethod
    public void trackPageViewEnd(String page) {
        StatService.trackEndPage(this.reactContext, page);
    }

    @ReactMethod
    public void trackError(String error){
        StatService.reportError(this.reactContext, error);
    }

    @ReactMethod
    public void trackException(ReadableMap exception){
        StatService.reportException(this.reactContext, new Throwable());
    }

    //开启自动捕获异常
    @ReactMethod
    public void setAutoExceptionCaught(boolean tag){
    }


    @ReactMethod
    public void trackCustomEvent(String eventId, ReadableArray array){
        StatService.trackCustomEvent(this.reactContext, eventId);
    }
    @ReactMethod
    public void trackCustomEventBegin(String eventId, ReadableArray array){
        StatService.trackCustomBeginEvent(this.reactContext, eventId);
    }
    @ReactMethod
    public void trackCustomEventEnd(String eventId, ReadableArray array){
        StatService.trackCustomEndEvent(this.reactContext, eventId);
    }


    @ReactMethod
    public void trackCustomKeyValueEvent(String eventId, ReadableMap kvs){
        StatService.trackCustomKVEvent(this.reactContext, eventId, null);
    }
    @ReactMethod
    public void trackCustomKeyValueEventBegin(String eventId, ReadableMap kvs){
        StatService.trackCustomBeginKVEvent(this.reactContext, eventId, null);
    }
    @ReactMethod
    public void trackCustomKeyValueEventEnd(String eventId, ReadableMap kvs){
        StatService.trackCustomEndKVEvent(this.reactContext, eventId, null);
    }


    @ReactMethod
    public void trackCustomKeyValueEventDuration(int seconds, String eventId, ReadableMap kvs){
        StatService.trackCustomKVTimeIntervalEvent(this.reactContext, seconds, eventId, null);
    }

    /**
     * 参数配置
     */
    //设置
    @ReactMethod
    public void commitCachedStats(int maxStatCount){
    }

    //启动新会话
    @ReactMethod
    public void startNewSession(){
        StatService.startNewSession(this.reactContext);
    }
    //停止会话
    @ReactMethod
    public void stopSession(){
        StatService.stopSession();
    }

    @ReactMethod
    public void trackActiveBegin(){
    }
    @ReactMethod
    public void trackActiveEnd(){
    }

    @ReactMethod
    public void reportAppMonitorStat(ReadableMap stat){
    }

    @ReactMethod
    public void reportQQ(String qq){
        StatService.reportQQ(this.reactContext, qq);
    }

    @ReactMethod
    public void reportAccount(String account){
        StatService.reportAccount(this.reactContext, new StatAccount(account));
    }

    @ReactMethod
    public void trackGameUser(String uid, String wd, String lev){
        StatService.reportGameUser(this.reactContext, new StatGameUser(uid, wd, lev));
    }

    @ReactMethod
    public void getMtaUDID(Promise promise){
    }
}
