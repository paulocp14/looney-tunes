import 'package:looney_tunes/model/tarefa_aqlite_model.dart';

import 'sqlitedatabase.dart';

class TarefaSQLiteRepository {
  Future<List<TarefaSQLiteModel>> obterDados() async {
    List<TarefaSQLiteModel> tarefas = [];
    var db = await SQLiteDataBase().obterdatabase();
    var result =
        await db.rawQuery("SELECT id, descricao, concluido FROM tarefas");
    for (var element in result) {
      tarefas.add(TarefaSQLiteModel(int.parse(element["id"].toString()),
          element["descricao"].toString(), element["concluido"] == "1"));
    }

    return tarefas;
  }

  Future<void> salvar(TarefaSQLiteModel tarefaSQLiteModel) async {
    var db = await SQLiteDataBase().obterdatabase();
    db.rawInsert("INSERT INTO tarefas(descricao, concluido) value(?,?)",
        [tarefaSQLiteModel.descricao, tarefaSQLiteModel.concluido]);
  }

  Future<void> update(TarefaSQLiteModel tarefaSQLiteModel) async {
    var db = await SQLiteDataBase().obterdatabase();
    db.rawInsert(
        "UPDATE tarefas SET descricao = ?, concluido = ? WHERE id = ?", [
      tarefaSQLiteModel.descricao,
      tarefaSQLiteModel.concluido,
      tarefaSQLiteModel.id
    ]);
  }

  Future<void> remove(int id) async {
    var db = await SQLiteDataBase().obterdatabase();
    db.rawInsert("DELITE  tarefas WHERE id = ?", [id]);
  }
}
