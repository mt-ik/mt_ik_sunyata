import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:redux/redux.dart';
import 'package:mt_ik_sunyata/app/utils/CommonUtils.dart';
import 'package:mt_ik_sunyata/app/service/DataResult.dart';
import 'package:mt_ik_sunyata/app/config/Config.dart';
import 'package:mt_ik_sunyata/app/local/LocalStorage.dart';
import 'package:mt_ik_sunyata/app/network/Api.dart';
import 'package:mt_ik_sunyata/app/network/api/UserApi.dart';
import 'package:mt_ik_sunyata/app/model/User.dart';
import 'package:mt_ik_sunyata/app/redux/UserRedux.dart';

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
    /// 初始化用户信息
    static initUser(Store store) async {
        var token = await LocalStorage.get(Config.TOKEN_KEY);
        var res = await getUserLocal();
        if (res != null && res.result && token != null) {
            store.dispatch(UpdateUserAction(res.data));
        }

        /// 读取主题
        String themeIndex = await LocalStorage.get(Config.THEME_COLOR);
        if (themeIndex != null && themeIndex.length != 0) {
            CommonUtils.pushTheme(store, int.parse(themeIndex));
        }

        /// 切换语言
        String localeIndex = await LocalStorage.get(Config.LANGUAGE_SELECT);
        if (localeIndex != null && localeIndex.length != 0) {
            CommonUtils.changeLocale(store, int.parse(localeIndex));
        }

        return new DataResult(res.data, res.result && token != null);
    }

    /// 获取本地登录用户信息
    static getUserLocal() async {
        var userInfo = await LocalStorage.get(Config.USER_INFO);
        if (userInfo != null) {
            var userMap = json.decode(userInfo);
            User user = User.fromJson(userMap);
            return new DataResult(user, true);
        } else {
            return new DataResult(null, false);
        }
    }
}