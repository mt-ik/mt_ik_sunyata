import 'package:redux/redux.dart';
import 'package:mt_ik_sunyata/app/model/User.dart';

final userReducer = combineReducers<User>([
  TypedReducer<User, UpdateUserAction>(_updateLoaded)
]);

User _updateLoaded(User user, action) {
  user = action.user;
  return user;
}

class UpdateUserAction {
  final User user;
  UpdateUserAction(this.user);
}