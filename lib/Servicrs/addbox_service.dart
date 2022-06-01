import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class AddBox_Service {
  CollectionReference boxcollection =
      FirebaseFirestore.instance.collection("Boxs");
  addBox(String boxName, String boxID) {
    print("$boxID : $boxName");
    boxcollection.doc().set({
      "boxName": boxName,
      "boxID": boxID,
    });

  }
}
