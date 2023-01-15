import 'package:bloc/bloc.dart';
import 'package:btd6_wiki/data/repositories/btd_repo.dart';
import 'package:equatable/equatable.dart';

part 'ids_state.dart';

class IdsCubit extends Cubit<IdsState> {
  IdsCubit({required this.btdRepo}) : super(IdsInitial());
  bool _dataFetched = false;
  final BTDRepo btdRepo;

  void setIDS() async {
    try {
      if (!_dataFetched) {
        emit(LoadingState());
        final towerIDS = await btdRepo.fetchTowersIDS();
        //TODO - implement IDS for heroes and bloons
        emit(LoadedState(towerIDS, const [], const []));
        _dataFetched = true;
      }
    } catch (e) {
      emit(ErrorState());
    }
  }
}
