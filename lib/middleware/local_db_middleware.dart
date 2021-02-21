import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:redux/redux.dart';
import 'package:sembast/sembast_io.dart';
import 'package:semester_calc_flutter/actions/actions.dart';
import 'package:semester_calc_flutter/models/app_state.dart';

List<Middleware<AppState>> createLocalDbMiddleware() {
  return [
    TypedMiddleware<AppState, OpenLocalDbAction>(_openLocalDb),
  ];
}

_openLocalDb(Store<AppState> store, action, NextDispatcher next) {
  return (Store<AppState> store, OpenLocalDbAction action,
      NextDispatcher next) async {

    if (action.localDbOpened) {
      return;
    }

    next(action);
    // get the application documents directory
    var dir = await getApplicationDocumentsDirectory();
// make sure it exists
    await dir.create(recursive: true);
// build the database path
    var dbPath = join(dir.path, 'my_database.db');
// open the database
    var db = await databaseFactoryIo.openDatabase(dbPath);

    store.dispatch(LocalDbOpenedAction(db));
  };
}
