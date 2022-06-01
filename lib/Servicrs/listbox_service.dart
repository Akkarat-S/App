import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class lsBox {
  List<String> Boxs = [];
  _Box()async {
    await FirebaseFirestore.instance.collection("Boxs").get().then((querySnapshot) => {
          querySnapshot.docs.forEach((document) {
            print("ID:${document.id}");
            Boxs.add(document['boxID']);
          })
        });
    return Boxs;
  }
  _p(){
    print('Test_p');
  }
}
