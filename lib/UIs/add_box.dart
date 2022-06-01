import 'package:card_bd/Models/box_model.dart';
import 'package:card_bd/Servicrs/addbox_service.dart';
import 'package:flutter/material.dart';

class AddBox extends StatefulWidget {
  AddBox({Key? key}) : super(key: key);

  @override
  State<AddBox> createState() => _AddBoxState();
}

class _AddBoxState extends State<AddBox> {
  final formKey = GlobalKey<FormState>();
  String boxID = '', boxName = '';
  //var box = boxModel(ID: '', boxID: '', boxName: '');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      //color: Colors.black,
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.4,
              width: size.width * 0.8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("lib/assets/images/BUILD_DIVIDE_logo.jpeg"),
              ),
            ),
            SizedBox(
              width: size.width * 0.8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "กรุณาใส่ชื่อชุดการ์ด";
                    }
                  },
                  //obscureText: true,
                  style: const TextStyle(color: Colors.black),
                  onSaved: (value) => setState(() => boxName = value!),
                  decoration: InputDecoration(
                      // prefixIcon: const Icon(
                      //   Icons.add_box,
                      //   color: Colors.yellow,
                      // ),
                      labelText: "BoxName",
                      //hintText: "Input password",
                      labelStyle: const TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "กรุณาใส่รหัสชุดการ์ด";
                    }
                  },
                  //obscureText: true,
                  style: const TextStyle(color: Colors.black),
                  onSaved: (value) => setState(() => boxID = value!),
                  decoration: InputDecoration(
                      // prefixIcon: const Icon(
                      //   Icons.add_box,
                      //   color: Colors.yellow,
                      // ),
                      labelText: "BoxID",
                      //hintText: "Input password",
                      labelStyle: const TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width * 0.3,
                  height: size.height * 0.06,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.green;
                          }
                          return Colors.green;
                        },
                      ),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        AddBox_Service().addBox(boxName, boxID);
                        //print("$boxID : $boxName");
                      }
                    },
                    child: const Text("AddBox"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
