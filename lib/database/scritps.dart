const nameDB = "tasks";

const String createTable = '''
  CREATE TABLE tasks(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    content TEXT NOT NULL,
    status INTEGER NOT NULL
  )
 ''';