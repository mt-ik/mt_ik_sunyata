import 'dart:developer';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:mt_ik_sunyata/app/common/dao/DataResult.dart';
import 'package:mt_ik_sunyata/app/common/config/config.dart';
import 'package:mt_ik_sunyata/app/common/local/localStorage.dart';
import 'package:mt_ik_sunyata/app/common/net/Api.dart';
import 'package:mt_ik_sunyata/app/common/net/Address.dart';

class UserDao {
  static login(userName, password, store) async {
    String signIn = userName + ":" + password;
    var bytes = utf8.encode(signIn);
    var base64Str = base64.encode(bytes);
    if (Config.DEBUG) {
      print("base64Str login " + base64Str);
    }
    await LocalStorage.save(Config.USER_NAME_KEY, userName);
    await LocalStorage.save(Config.USER_BASIC_CODE, base64Str);

    Map params = { "email": userName, "password": password };

    // HttpManager.clearAuthorization();

    var res = await HttpManager.netFetch(Address.login(), params, null, new Options( method: "GET" ));
    var resultData = null;
    debugger(when: true);
    if (res != null && res.result) {
      await LocalStorage.save(Config.USER_PW_KEY, password);
      // var resultData = await getUserInfo(null);
      resultData = res.result;
      if (Config.DEBUG) {
        print("user result " + resultData.result.toString());
        print(resultData.data);
        print(res.data.toString());
      }
      // store.dispatch(new UpdateUserAction(resultData.data));
    }
    return new DataResult(resultData, res.result);
  }
}