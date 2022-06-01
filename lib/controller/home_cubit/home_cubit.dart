import 'package:task_etisalat/controller/network/remote/dio_helper.dart';
import 'package:task_etisalat/controller/home_cubit/home_states.dart';
import 'package:task_etisalat/model/search_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(initialHomeState());
  static HomeCubit get(context) => BlocProvider.of(context);

  MainModel? mainModel;
  void getSearch(String userName) async {
    emit(LoadingHomeState());
    await DioHelper.getData(
      url: 'users/$userName/repos',
    ).then((value) {
      print(value.data);
      mainModel = MainModel.fromJson(value.data);
      print(mainModel!.search![0].name);

      emit(SuccessHomeState());
    }).catchError((onError) {
      print(onError);
      emit(ErrorHomeState(onError.toString()));
    });
  }

  List<MainModel> favItems = [];
  Map<int, bool> favItemColor = {};
  void addFavItem(MainModel repo) {
    favItems.add(repo);
    favItemColor.addAll({repo.search![0].id!: true});
    emit(AddFavItemState());
    //print(favItems.length);
    // String encodeData = jsonEncode(MainModel);
    // CacheHelper.put(key: "key", value: encodeData).then((value) => emit(AddFavItemState()),);
  }

  Map<int, int> indexx = {};

  void deleteFavItem(int index, int repoId) {
    favItems.removeAt(index);
    favItemColor.addAll({repoId: false});
    //print(favItems.length);
    emit(RemoveFavItemState());
  }
}
