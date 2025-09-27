import 'package:bloc_puro/app/data/models/tarefa_model.dart';

//nosso contrato (interface)
abstract class TarefaState {
  List<TarefaModel> tarefas;

  TarefaState({required this.tarefas});
}

class TarefaInitalState extends TarefaState {
  TarefaInitalState() : super(tarefas: []);
}

class TarefaLoadingState extends TarefaState {
  TarefaLoadingState() : super(tarefas: []);
}

/*
class TarefaLoadedState extends TarefaState {
  TarefaLoadedState({required List<TarefaModel> tarefas})
    : super(tarefas: tarefas);
} 

é o mesmo que :
*/
class TarefaLoadedState extends TarefaState {
  TarefaLoadedState({required super.tarefas});
}

class TarefaErrorState extends TarefaState {
  final Exception exception;
  TarefaErrorState({required this.exception}) : super(tarefas: []);
}
