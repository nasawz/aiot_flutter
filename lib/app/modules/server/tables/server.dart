class ServerTable {
  static const String tableName = "server";

  static const String createQuery = '''
  create table if not exists ${ServerTable.tableName} (
      "id"	INTEGER,
      "ip"	TEXT,
      "identity"	TEXT,
      "password"	TEXT,
      "lastConnection"	NUMERIC,
      PRIMARY KEY("id" AUTOINCREMENT)
    );
  ''';
}
