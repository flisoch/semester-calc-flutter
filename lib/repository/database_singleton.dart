import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:async/async.dart';

class DBManager {

  // Singleton pattern
  static final DBManager _dbManager = new DBManager._internal();
  DBManager._internal();
  static DBManager get instance => _dbManager;

  // Members
  static Database _database;
  final _initDBMemoizer = AsyncMemoizer<Database>();

  Future<Database> get database async {
    if (_database != null)
      return _database;

    // if _database is null we instantiate it
    _database = await _initDBMemoizer.runOnce(() async {
      return await _initDB();
    });

    return _database;
  }

  Future<Database> _initDB() async {
    var dir = await getApplicationDocumentsDirectory();
// make sure it exists
    await dir.create(recursive: true);
// build the database path
    var dbPath = join(dir.path, 'my_database.db');
// open the database
    var db = await databaseFactoryIo.openDatabase(dbPath);
    return db;
  }

}
