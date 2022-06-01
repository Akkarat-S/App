import 'package:flutter/material.dart';

class SearchCard extends StatefulWidget {
  SearchCard({Key? key}) : super(key: key);

  @override
  State<SearchCard> createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  List<String> lsSelectBox = [];
  List<String> lsSelectType = [];
  List<String> lsSelectColor = [];
  bool black = false, white = false, red = false, blue = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _selectBox(),
          _spaceH(),
          _selectType(),
          _spaceH(),
          _selectColor(),
        ],
      ),
    );
  }

  SizedBox _selectBox() {
    if (lsSelectBox.isEmpty) {
      return SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.06,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.grey;
                }
                return Colors.grey;
              },
            ),
          ),
          onPressed: () {
            setState(() {
              lsSelectBox.add("BoxID");
            });
          },
          child: const Text("Set Box"),
        ),
      );
    }
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.06,
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
        onPressed: () {},
        child: const Text("Box On Set!"),
      ),
    );
  }

  SizedBox _selectType() {
    if (lsSelectType.isEmpty) {
      return SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.06,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.grey;
                }
                return Colors.grey;
              },
            ),
          ),
          onPressed: () {
            setState(() {
              lsSelectType.add("Card Type");
            });
          },
          child: const Text("Set Type"),
        ),
      );
    }
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.06,
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
        onPressed: () {},
        child: const Text("Type On Set!"),
      ),
    );
  }

  SizedBox _selectColor() {
    if (lsSelectColor.isEmpty) {
      return SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.06,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.grey;
                }
                return Colors.grey;
              },
            ),
          ),
          onPressed: () {
            setState(() {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text('โปรดเลือกสี'),
                  //content: const Text('AlertDialog description'),
                  actions: <Widget>[
                    Column(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: black,
                              onChanged: (value) {
                                setState(() {
                                  print('on changed');
                                  if (black == false) {
                                    print('t');
                                    black = true;
                                  } else {
                                    black = false;
                                    print('f');
                                  }
                                  print(black);
                                });
                              },
                            ),
                            const Text("สีดำ"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () async {},
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            });
          },
          child: const Text("Set Color"),
        ),
      );
    }
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.06,
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
        onPressed: () {},
        child: const Text("Color On Set!"),
      ),
    );
  }

  SizedBox _spaceH() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.06,
    );
  }
}
