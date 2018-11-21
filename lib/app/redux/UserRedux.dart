import 'package:redux/redux.dart';
import 'package:mt_ik_sunyata/app/model/User.dart';

/// redux的combineReducers, 通过TypedReducer将UpdateUserAction与reducers关联起来
final userReducer = combineReducers<User>([
  TypedReducer<User, UpdateUserAction>(_updateLoaded)
]);

/// UpdateUserAction发起请求时会调用_updateLoaded, 接受一个新的userInfo
User _updateLoaded(User user, action) {
  user = action.user;
  return user;
}

/// 用于发起userInfo改变的动作
class UpdateUserAction {
  final User user;
  UpdateUserAction(this.user);
}