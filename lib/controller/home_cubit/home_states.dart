abstract class HomeStates {}

class initialHomeState extends HomeStates {}

class LoadingHomeState extends HomeStates {}

class SuccessHomeState extends HomeStates {}

class ErrorHomeState extends HomeStates {
  ErrorHomeState(String string);
}

class AddFavItemState extends HomeStates {}

class RemoveFavItemState extends HomeStates {}
