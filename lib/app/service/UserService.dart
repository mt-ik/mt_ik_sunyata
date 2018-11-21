import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mt_ik_sunyata/app/service/DataResult.dart';
import 'package:mt_ik_sunyata/app/config/Config.dart';
import 'package:mt_ik_sunyata/app/local/LocalStorage.dart';
import 'package:mt_ik_sunyata/app/network/Api.dart';
import 'package:mt_ik_sunyata/app/network/api/UserApi.dart';

class UserService {
    /// 邮箱密码登录
    static login(email, password, store) async {
        String signIn = email + ":" + password;
        var bytes = utf8.encode(signIn);
        var base64Str = base64.encode(bytes);

        if (Config.DEBUG) {
            print("base64Str login " + base64Str);
        }

        await LocalStorage.save(Config.USER_NAME_KEY, email);
        await LocalStorage.save(Config.USER_BASIC_CODE, base64Str);

        Map<String, String> params = { "email": email, "password": password };
        /// 清除授权
        HttpManager.clearAuthorization();

        var res = await HttpManager.netFetch(UserApi.LOGIN['API'], params, null, new Options(method: UserApi.LOGIN['METHOD']));
        
        if (res != null && res.result) {
            await LocalStorage.save(Config.USER_PW_KEY, password);
            // var resultData = await getUserInfo(null);
            // store.dispatch(new UpdateUserAction(resultData.data));
        }
        return new DataResult(res.data, res.result);
    }
}