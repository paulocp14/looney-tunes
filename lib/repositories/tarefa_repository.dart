import 'package:looney_tunes/model/tarefa.dart';

class TarefaRepository {
  final List<Tarefa> _tarefa = [];

  Future<void> adicionat(Tarefa tarefa) async {
    _tarefa.add(tarefa);
  }

  Future<void> alterar(String id, bool concluido) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tarefa.where((element) => element.id == id).first.concluido = (concluido);
  }

  Future<void> remove(String id) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tarefa.remove(_tarefa.where((tarefa) => tarefa.id == id).first);
  }

  Future<List<Tarefa>> listarTarefas() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _tarefa;
  }

  Future<List<Tarefa>> listarNaoConcluidas() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _tarefa.where((tarefa) => !tarefa.concluido).toList();
  }

  listar() {}
}
