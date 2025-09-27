import 'package:bloc/bloc.dart';
import 'package:bloc_puro/app/data/blocs/tarefa_event.dart';
import 'package:bloc_puro/app/data/blocs/tarefa_state.dart';
import 'package:bloc_puro/app/data/models/tarefa_model.dart';
import 'package:bloc_puro/app/data/repositories/tarefa_repository.dart';

//Bloc<Entrada,Saida>
class TarefaBloc extends Bloc<TarefaEvent, TarefaState> {
  final _repository = TarefaRepository();

  //passado o estado inicial via super
  TarefaBloc() : super(TarefaInitalState()) {
    on(_mapEventToState);
  }

  void _mapEventToState(TarefaEvent event, Emitter emit) async {
    List<TarefaModel> tarefas = [];

    emit(TarefaLoadingState());

    if (event is GetTarefas) {
      tarefas = await _repository.getTarefas();
    } else if (event is PostTarefa) {
      tarefas = await _repository.postTarefa(tarefa: event.tarefa);
    } else if (event is DeleteTarefa) {
      tarefas = await _repository.deleteTarefa(tarefa: event.tarefa);
    }

    emit(TarefaLoadedState(tarefas: tarefas));
  }
}
