import 'package:bloc/bloc.dart';
import 'package:mycrypto/models/cryptocurrency.dart';

class FavouriteCubit extends Cubit<List<Cryptocurrency>>{
  FavouriteCubit(List<Cryptocurrency> cryptocurrencyListState) : super(cryptocurrencyListState);

  void addToFavourites(Cryptocurrency cryptocurrency){

    List<Cryptocurrency> updatedList = [];

    bool alreadyInFavourites = state.any((element)  {
      if(element.id == cryptocurrency.id){
        return true;
      }
      else {
        return false;
      }
    });

    if(!alreadyInFavourites){
      state.add(cryptocurrency);
      updatedList = List.from(state);
      emit(updatedList);
    }
  }

  void removeFromFavourites(Cryptocurrency cryptocurrency){

    List<Cryptocurrency> updatedList = [];

    state.remove(cryptocurrency);
    updatedList = List.from(state);
    print(state.length);
    emit(updatedList);
  }

}