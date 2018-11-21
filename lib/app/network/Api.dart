import 'dart:collection';
import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'package:mt_ik_sunyata/app/network/ResultData.dart';
import 'package:mt_ik_sunyata/app/network/Code.dart';
import 'package:mt_ik_sunyata/app/config/Config.dart';
import 'package:mt_ik_sunyata/app/local/LocalStorage.dart';

/// http请求
class HttpManager {
    static const String CONTENT_TYPE_JSON = "application/json";
    static const String CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";

    static Map<String, dynamic> optionsDio = {
        'token': null,
        'authorizationCode': null,
    };

    /// 发起网络请求
    /// [ url] 请求url
    /// [ params] 请求参数
    /// [ header] 外加头
    /// [ option] 配置
    static netFetch(url, params, Map<String, String> header, Options option, { noTip = false }) async {
        /// 网路判断-没有网络
        var connectivityResult = await (new Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.none) {
            return new ResultData(Code.errorHandleFunction(Code.NETWORK_ERROR, "", noTip), false, Code.NETWORK_ERROR);
        }


        /// header 处理
        Map<String, String> headers = new HashMap();
        if (header != null) {
            headers.addAll(header);
        }
        ///授权码
        if (optionsDio["authorizationCode"] == null) {
            var authorizationCode = await getAuthorization();
            if (authorizationCode != null) {
                optionsDio["authorizationCode"] = authorizationCode;
            }
        }
        headers["Authorization"] = optionsDio["authorizationCode"];

        /// 组织Option
        if (option == null) {
            option = new Options( method: 'GET');
        }
        option.baseUrl = '${Config.PROTOCOL}${Config.HOST}:${Config.PORT}';
        option.headers = headers;
        option.connectTimeout = Config.CONNECT_TIMEOUT;
        option.receiveTimeout = Config.RECEIVE_TIMEOUT;
        
        Dio dio = new Dio();
        /// 发送前拦截器
        dio.interceptor.request.onSend = (Options options) async {
            /// 异步拦截
            // Response response = await dio.get("/token");
            // options.headers["token"] = response.data["data"]["token"];
            // return options; 
            if (options != null) {
                return options;
            } else {
                final customer = 'customer data';
                return dio.resolve(customer);
            }
            // lock()、unlock()、clear() 请求锁定、解锁、清空队列
        };
        /// 发送成功拦截器
        dio.interceptor.response.onSuccess = (Response response) {
            // 在返回响应数据之前做一些预处理
            if (response != null) {
                return response;
            } else {
                final Map customer = {
                    "success": true
                };
                return dio.reject(customer);
            }
        };
        /// 发送失败拦截器
        dio.interceptor.response.onError = (DioError e){
            // 当请求失败时做一些预处理
            return e;
        };
        Response response;

        try {
            response = await dio.request(url, data: params, options: option);
            print(response.data.toString());
        } on DioError catch (e) {

            Response errorResponse;

            if (e.response != null) {
                errorResponse = e.response;
            } else {
                errorResponse = new Response(statusCode: 666);
            }

            if (e.type == DioErrorType.CONNECT_TIMEOUT) {
                errorResponse.statusCode = Code.NETWORK_TIMEOUT;
            }
            if (Config.DEBUG) {
                print('请求异常: ' + e.toString());
                print('请求异常url: ' + url);
            }

            return new ResultData(Code.errorHandleFunction(errorResponse.statusCode, e.message, noTip), false, errorResponse.statusCode);
        }

        try {
            if (option.contentType != null && option.contentType.primaryType == "text") {
                return new ResultData(response.data, true, Code.SUCCESS);
            } else {
                var responseJson = response.data;
                if (response.statusCode == 201 && responseJson["token"] != null) {
                    optionsDio["authorizationCode"] = 'token ' + responseJson["token"];
                    await LocalStorage.save(Config.TOKEN_KEY, optionsDio["authorizationCode"]);
                }
            }
            
            if (response.statusCode == 200 || response.statusCode == 201) {
                return new ResultData(response.data, true, Code.SUCCESS, headers: response.headers);
            }

        } catch (e) {
            return new ResultData(response.data, false, response.statusCode, headers: response.headers);
        }

        return new ResultData(Code.errorHandleFunction(response.statusCode, "", noTip), false, response.statusCode);
    }

    ///清除授权
    static clearAuthorization() {
        optionsDio["authorizationCode"] = null;
        LocalStorage.remove(Config.TOKEN_KEY);
    }

    ///获取授权token
    static getAuthorization() async {
        String token = await LocalStorage.get(Config.TOKEN_KEY);
        if (token == null) {
            String basic = await LocalStorage.get(Config.USER_BASIC_CODE);
            if (basic == null) {
            //提示输入账号密码
            } else {
                //通过 basic 去获取token，获取到设置，返回token
                return "Basic $basic";
            }
        } else {
            optionsDio["authorizationCode"] = token;
            return token;
        }
    }
}
