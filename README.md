## react-native-mta for IOS

`react-native-mta` 静态库提供了 `react-native` 调用 `MTA` 的接口，关于 `MTA` 的介绍和使用说明请看 [mta.qq.com](`http://mta.qq.com`)

### 安装

通过使用 `npm` 和 `react-native` 进行安装

```
npm install react-native-mta
react-native link react-native-mta
```

工程中添加 `react-native-mta` 所需要的系统库

在 `TAGETS > Build Phases > Link Binary With Libraries` 中添加

```
libz.dylib
libsqlite3.dylib
SystemConfiguration.framework
CoreTelephony.framework
AdSupport.framework
```

### 使用

这个静态库提供了 `MTA` 的大部分数据接口桥接

另外增加了设置全局 kv 变量的方法，在使用 KeyValue 方式进行上报时，将把全局的kv合并发送

```javascript
import mta from 'react-native-mta';

mta.startWithAppkey("myAppKey"); //初始化控件，使用 mta appkey 进行注册

mta.setGlobalKvs({user_id:""});  //设置全局变量

mta.trackCustomKeyValueEvent("event_1", {}); //自定义事件上报

```

