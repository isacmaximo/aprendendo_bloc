import 'package:bloc_puro/app/data/models/tarefa_model.dart';

class TarefaRepository {
  final List<TarefaModel> _tarefas = [];

  Future<List<TarefaModel>> getTarefas() async {
    _tarefas.addAll([
      TarefaModel(nome: 'Tarefa 1'),
      TarefaModel(nome: 'Tarefa 2'),
      TarefaModel(nome: 'Tarefa 3'),
      TarefaModel(nome: 'Tarefa 4'),
    ]);

    return Future.delayed(const Duration(seconds: 2), () {
      return _tarefas;
    });
  }

  Future<List<TarefaModel>> postTarefa({required TarefaModel tarefa}) async {
    _tarefas.add(tarefa);

    return Future.delayed(const Duration(seconds: 2), () {
      return _tarefas;
    });
  }

  Future<List<TarefaModel>> deleteTarefa({required TarefaModel tarefa}) async {
    _tarefas.remove(tarefa);

    return Future.delayed(const Duration(seconds: 2), () {
      return _tarefas;
    });
  }
}
