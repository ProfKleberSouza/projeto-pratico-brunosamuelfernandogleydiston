import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';

class MyDatabase {  
  static final databaseName = "DoarDB.db";
  static final databaseVersion = 1;
  static final table = 'profile';  
  static final columnId = '_id';
  static final columnNome = 'nome';

  // Torna esta classe singleton
  MyDatabase.privateConstructor();
  static final MyDatabase instance = MyDatabase.privateConstructor();
  // Tem somente uma referência ao banco de dados
  static Database database;

  Future<Database> get database async {
    if (database != null) return database;
    // Instancia o db na primeira vez que for acessado
    database = await initDatabase();
    return database;
  }  
  // Abre o banco de dados e o cria se ele não existir
  initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, databaseName);
    return await openDatabase(path,
        version: databaseVersion,
        onCreate: doCreate);
  }
  // Código SQL para criar o banco de dados e a tabela
  Future doCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnNome TEXT NOT NULL,
          )
          ''');
  }  
  // Métodos Helper
  //----------------------------------------------------
  // Insere uma linha no banco de dados onde cada chave 
  // no Map é um nome de coluna e o valor é o valor da coluna. 
  // O valor de retorno é o id da linha inserida.
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }
  // Todas as linhas são retornadas como uma lista de mapas, onde cada mapa é
  // uma lista de valores-chave de colunas.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }
  // Todos os métodos : inserir, consultar, atualizar e excluir, 
  // também podem ser feitos usando  comandos SQL brutos. 
  // Esse método usa uma consulta bruta para fornecer a contagem de linhas.
  Future<int?> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }
  // Assumimos aqui que a coluna id no mapa está definida. Os outros
  // valores das colunas serão usados para atualizar a linha.
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }
  // Exclui a linha especificada pelo id. O número de linhas afetadas é
  // retornada. Isso deve ser igual a 1, contanto que a linha exista.
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}