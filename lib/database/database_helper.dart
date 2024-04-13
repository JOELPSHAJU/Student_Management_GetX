
import 'package:sqflite/sqflite.dart';
import 'package:studentmanagementgetx/model/student_model.dart';

class DatabaseHelper {
  static const _databaseVersion = 1;

  static const table = 'students';

  static const columnId = '_id';
  static const columnName = 'name';
  static const columnSchoolname = 'schoolname';
  static const columnFathersname = 'fathername';
  static const columnAge = 'Age';
  static const columnProfilePicture = 'profile_picture';

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase('student.db',
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $table(
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnName TEXT NOT NULL,
      $columnSchoolname TEXT NOT NULL,
      $columnFathersname TEXT NOT NULL,
      $columnAge INTEGER NOT NULL,
      $columnProfilePicture TEXT NOT NULL
    )
    ''');
  }

  Future<int> insertStudent(Student student) async {
    final db = await database;
    return await db.insert(table, {
      columnName: student.name,
      columnSchoolname: student.schoolname,
      columnFathersname: student.fathername,
      columnAge: student.age,
      columnProfilePicture: student.profielPicture
    });
  }

  Future<List<Student>> getStudents() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(
        maps.length,
        (index) => Student(
            id: maps[index][columnId],
            name: maps[index][columnName],
            schoolname: maps[index][columnSchoolname],
            fathername: maps[index][columnFathersname],
            age: maps[index][columnAge],
            profielPicture: maps[index][columnProfilePicture]));
  }

  Future<int> updateStudent(Student student) async {
    final db = await database;
    return await db.update(
        table,
        {
          columnName: student.name,
          columnSchoolname: student.schoolname,
          columnFathersname: student.fathername,
          columnAge: student.age,
          columnProfilePicture: student.profielPicture
        },
        where: '$columnId = ?',
        whereArgs: [student.id]);
  }

  Future<int> deleteStudent(int id) async {
    final db = await database;
    return await db.delete(
      table,
      where: '$columnId = ?',
      whereArgs: [id]
    );
  }
}
