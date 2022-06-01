import 'package:card_bd/Method/set_image.dart';
import 'package:card_bd/Servicrs/addcard_service.dart';
import 'package:card_bd/Servicrs/listbox_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AddCard extends StatefulWidget {
  AddCard({Key? key}) : super(key: key);

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  @override
  void initState()async {
    // TODO: implement initState
    _getlsBox();
    super.initState();
  }

  _getlsBox() async {
    // lsBox = ls;
    await FirebaseFirestore.instance
        .collection("Boxs")
        .get()
        .then((querySnapshot) => {
              querySnapshot.docs.forEach((document) {
                print("Box:${document.id}");
                lsBox.add(document['boxID']);
              })
            });
    setState(() {});
  }

  final formKey = GlobalKey<FormState>();
  List<String> lsBox = [];
  String valueBox = "Box";
  List<String> lsType = ['Unit', 'Command', 'Teritory'];
  String valueType = "Type";

  File? file;
  String pathImage = '';

  String cardID = '',
      cardColor = '',
      cardName = '',
      cardType = '',
      cardFullCos = '',
      cardMaincos = '',
      cardSubCos = '',
      cardSpeed = '',
      cardPower = '',
      cardHit = '',
      cardCognomen = '',
      cardClan = '',
      cardSkill = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _showImage(),
              SizedBox(
                width: size.width * 0.1,
              ),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: size.width * 0.4,
                  height: size.height * 0.06,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.blue;
                          }
                          return Colors.blue;
                        },
                      ),
                    ),
                    onPressed: () async {
                      print("set Image");
                      var _get = await SetImage().getImage(ImageSource.gallery);
                      setState(() {
                        file = _get;
                        pathImage = file.toString();
                        print("Image : $pathImage");
                      });
                    },
                    child: const Text("set Image"),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  color: Colors.grey,
                  height: size.height * 0.06,
                  width: size.width * 0.4,
                  child: Center(
                    child: DropdownButton(
                      hint: Text(valueBox,
                          style: const TextStyle(color: Colors.white)),
                      items: lsBox.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(
                            dropDownStringItem,
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          print(newValue);
                          valueBox = newValue!;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  color: Colors.grey,
                  height: size.height * 0.06,
                  width: size.width * 0.4,
                  child: Center(
                    child: DropdownButton(
                      hint: Text(valueType,
                          style: const TextStyle(color: Colors.white)),
                      items: lsType.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(
                            dropDownStringItem,
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          print(newValue);
                          valueType = newValue!;
                        });
                      },
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
        Form(
            key: formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.44,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "กรุณาใส่ Card ID";
                            }
                          },
                          //obscureText: true,
                          style: const TextStyle(color: Colors.black),
                          onSaved: (value) => setState(() => cardID = value!),
                          decoration: InputDecoration(
                              labelText: "Card ID",
                              hintText: "Input CardID",
                              labelStyle: const TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        ),
                      ),
                    ),
                    _space(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.44,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "กรุณาใส่ Card Color";
                            }
                          },
                          //obscureText: true,
                          style: const TextStyle(color: Colors.black),
                          onSaved: (value) => setState(() => cardColor = value!),
                          decoration: InputDecoration(
                              labelText: "Card Color",
                              hintText: "Input Card Color",
                              labelStyle: const TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "กรุณาใส่ Card Name";
                            }
                          },
                          //obscureText: true,
                          style: const TextStyle(color: Colors.black),
                          onSaved: (value) => setState(() => cardName = value!),
                          decoration: InputDecoration(
                              labelText: "Card Name",
                              hintText: "Input Card Name",
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
                      width: MediaQuery.of(context).size.width * 0.44,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "กรุณาใส่ Card Clan";
                            }
                          },
                          //obscureText: true,
                          style: const TextStyle(color: Colors.black),
                          onSaved: (value) => setState(() => cardClan = value!),
                          decoration: InputDecoration(
                              labelText: "Card Clan",
                              hintText: "Input Card Clan",
                              labelStyle: const TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        ),
                      ),
                    ),
                    _space(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.44,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "กรุณาใส่ Card Cognomen";
                            }
                          },
                          //obscureText: true,
                          style: const TextStyle(color: Colors.black),
                          onSaved: (value) => setState(() => cardCognomen = value!),
                          decoration: InputDecoration(
                              labelText: "Card Cognomen",
                              hintText: "Input Card Cognomen",
                              labelStyle: const TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.44,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "กรุณาใส่ Card Full Cos";
                            }
                          },
                          //obscureText: true,
                          style: const TextStyle(color: Colors.black),
                          onSaved: (value) => setState(() => cardFullCos = value!),
                          decoration: InputDecoration(
                              labelText: "Card Full Cos",
                              hintText: "Input Card Full Cos",
                              labelStyle: const TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        ),
                      ),
                    ),
                    _space(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.44,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "กรุณาใส่ Card Main Cos";
                            }
                          },
                          //obscureText: true,
                          style: const TextStyle(color: Colors.black),
                          onSaved: (value) => setState(() => cardMaincos = value!),
                          decoration: InputDecoration(
                              labelText: "Card Main Cos",
                              hintText: "Input Card Main Cos",
                              labelStyle: const TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.44,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "กรุณาใส่ Card Sub Cos";
                            }
                          },
                          //obscureText: true,
                          style: const TextStyle(color: Colors.black),
                          onSaved: (value) => setState(() => cardSubCos = value!),
                          decoration: InputDecoration(
                              labelText: "Card Sub Cos",
                              hintText: "Input Card Sub Cos",
                              labelStyle: const TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        ),
                      ),
                    ),
                    _space(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.44,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "กรุณาใส่ Card Speed";
                            }
                          },
                          //obscureText: true,
                          style: const TextStyle(color: Colors.black),
                          onSaved: (value) => setState(() => cardSpeed = value!),
                          decoration: InputDecoration(
                              labelText: "Card Speed",
                              hintText: "Input Card Speed",
                              labelStyle: const TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.44,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "กรุณาใส่ Card Power";
                            }
                          },
                          //obscureText: true,
                          style: const TextStyle(color: Colors.black),
                          onSaved: (value) => setState(() => cardPower = value!),
                          decoration: InputDecoration(
                              labelText: "Card Power",
                              hintText: "Input Card Power",
                              labelStyle: const TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        ),
                      ),
                    ),
                    _space(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.44,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "กรุณาใส่ Card Hit";
                            }
                          },
                          //obscureText: true,
                          style: const TextStyle(color: Colors.black),
                          onSaved: (value) => setState(() => cardHit = value!),
                          decoration: InputDecoration(
                              labelText: "Card Hit",
                              hintText: "Input Card Hit",
                              labelStyle: const TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "กรุณาใส่ Card Skill";
                            }
                          },
                          //obscureText: true,
                          style: const TextStyle(color: Colors.black),
                          onSaved: (value) => setState(() => cardSkill = value!),
                          decoration: InputDecoration(
                              labelText: "Card Skill",
                              hintText: "Input Card Skill",
                              labelStyle: const TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        ),
                      ),
                    ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: size.width * 0.3,
                        height: size.height * 0.06,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.orange;
                                }
                                return Colors.orange;
                              },
                            ),
                          ),
                          onPressed: () async {
                            setState(() {});
                          },
                          child: const Text("Clear"),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.1,
                      ),
                      SizedBox(
                        width: size.width * 0.3,
                        height: size.height * 0.06,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.green;
                                }
                                return Colors.green;
                              },
                            ),
                          ),
                          onPressed: () async {
                            setState(() {
                              if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              //print("Data: $valueBox $cardID $file $cardColor $cardName $cardType $cardFullCos $cardMaincos $cardSubCos $cardSpeed $cardPower $cardHit $cardCognomen $cardClan $cardSkill");

                              AddCard_Service().addcard(
                                  valueBox,
                                  cardID,
                                  file,
                                  cardColor,
                                  cardName,
                                  valueType,
                                  cardFullCos,
                                  cardMaincos,
                                  cardSubCos,
                                  cardSpeed,
                                  cardPower,
                                  cardHit,
                                  cardCognomen,
                                  cardClan,
                                  cardSkill);
                              }
                            });
                          },
                          child: const Text("Add Card"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }

  SizedBox _formData(String _var, String txt) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.44,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "กรุณาใส่ $txt";
            }
          },
          //obscureText: true,
          style: const TextStyle(color: Colors.black),
          onSaved: (value) => setState(() => _var = value!),
          decoration: InputDecoration(
              labelText: txt,
              hintText: "Input $txt",
              labelStyle: const TextStyle(color: Colors.black),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
        ),
      ),
    );
  }

  SizedBox _formData2(String _var, String txt) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "กรุณาใส่ $txt";
            }
          },
          //obscureText: true,
          style: const TextStyle(color: Colors.black),
          onSaved: (value) => setState(() => _var = value!),
          decoration: InputDecoration(
              labelText: txt,
              hintText: "Input $txt",
              labelStyle: const TextStyle(color: Colors.black),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
        ),
      ),
    );
  }

  SizedBox _space() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.02,
    );
  }

  Container _showImage() {
    if (pathImage != '') {
      return Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.4,
          color: Colors.black,
          child: Image.file(file!));
    }
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.4,
      color: Colors.black,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
          Text("Image", style: TextStyle(color: Colors.white))
        ])
      ]),
    );
  }
}
