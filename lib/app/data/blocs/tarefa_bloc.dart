import 'dart:async';

import 'package:bloc_puro/app/data/blocs/tarefa_event.dart';
import 'package:bloc_puro/app/data/blocs/tarefa_state.dart';
import 'package:bloc_puro/app/data/models/tarefa_model.dart';
import 'package:bloc_puro/app/data/repositories/tarefa_repository.dart';

class TarefaBloc {
  final _repository = TarefaRepository();

  final StreamController<TarefaEvent> _inputTarefaController =
      StreamController<TarefaEvent>();
  final StreamController<TarefaState> _outputTarefaController =
      StreamController<TarefaState>();

  //expondo a entrada para o view
  Sink<TarefaEvent> get inputTarefa => _inputTarefaController.sink;
  //expondo a saída
  Stream<TarefaState> get outputTarefa => _outputTarefaController.stream;

  TarefaBloc() {
    //fica ouvindo todos os eventos
    _inputTarefaController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(TarefaEvent event) async {
    List<TarefaModel> tarefas = [];

    _outputTarefaController.add(TarefaLoadingState());

    if (event is GetTarefas) {
      tarefas = await _repository.getTarefas();
    } else if (event is PostTarefa) {
      tarefas = await _repository.postTarefa(tarefa: event.tarefa);
    } else if (event is DeleteTarefa) {
      tarefas = await _repository.deleteTarefa(tarefa: event.tarefa);
    }

    _outputTarefaController.add(TarefaLoadedState(tarefas: tarefas));
  }
}
