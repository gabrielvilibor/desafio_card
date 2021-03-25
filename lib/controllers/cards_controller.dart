import 'package:desafio_card/models/card_model.dart';
import 'package:desafio_card/services/service_api.dart';

class CardsController{

  Future<List<Cards>?> fetch() async{
    try{
      List<Cards>? cards = await ServiceApi().getCards();
      return cards;
    }finally{

    }
  }

  Future<bool> deleteCard(int id) async{
    try{
      return await ServiceApi().deleteCard(id);
    }catch(e){
      return false;
    }
  }

}