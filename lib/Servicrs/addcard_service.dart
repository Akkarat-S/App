import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AddCard_Service {
  CollectionReference cardcollection =
      FirebaseFirestore.instance.collection("Cards");
  addcard(
      String boxID,
      String cardID,
      var file,
      String cardColor,
      String cardName,
      String cardType,
      String cardFullCos,
      String cardMaincos,
      String cardSubCos,
      String cardSpeed,
      String cardPower,
      String cardHit,
      String cardCognomen,
      String cardClan,
      String cardSkill) async {
    print('Add Card');
    String url = '';

    print( "$boxID $cardID $file $cardColor $cardName $cardType $cardFullCos $cardMaincos $cardSubCos $cardSpeed $cardPower $cardHit $cardCognomen $cardClan $cardSkill");

    //up image
    //if (file == null) return;
    final fileName = file!.path;
    final destination = 'images/$cardID';

    try {
      final ref = firebase_storage.FirebaseStorage.instance.ref(destination);
      await ref.putFile(file!);

      url = (await ref.getDownloadURL()).toString();
      //print("URL:$url");
    } catch (e) {
      print('Upload Eror');
    }

    cardcollection.doc().set({
      "boxID": boxID,
      "cardID": cardID,
      "cardImage": url,
      "cardColor": cardColor,
      "cardName": cardName,
      "cardType": cardType,
      "cardFullCos": cardFullCos,
      "cardMaincos": cardMaincos,
      "cardSubCos": cardSubCos,
      "cardSpeed": cardSpeed,
      "cardPower": cardPower,
      "cardHit": cardHit,
      "cardCognomen": cardCognomen,
      "cardClan": cardClan,
      "cardSkill": cardSkill
    });
  }
}
