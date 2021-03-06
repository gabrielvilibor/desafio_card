import 'package:desafio_card/models/card_model.dart';
import 'package:desafio_card/services/service_api.dart';

class CardsController {
  Future<List<Cards>?> fetch() async {
    try {
      List<Cards>? cards = await ServiceApi().getCards();
      return cards;
    } finally {}
  }

  Future<bool> deleteCard(int id) async {
    try {
      return await ServiceApi().deleteCard(id);
    } catch (e) {
      return false;
    }
  }

  Future<bool> createCard(String title, String content) async {
    try {
      return await ServiceApi().createCard(title, content);
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> editCard(int id, String title, String content) async {
    try {
      return await ServiceApi().editCard(id, title, content);
    } catch (e) {
      print(e);
      return false;
    }
  }
}
