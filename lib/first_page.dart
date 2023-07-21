// ignore_for_file: unused_local_variable, unnecessary_new, avoid_print

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'model.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<ListRegister>? list = [];
  List<ListRegister>? list1 = [];
  List searchList = [];
  TextEditingController controller = TextEditingController();
  TextEditingController dateInput = TextEditingController();
  //final duplicateItems = List<String>.generate(10000, (i) => "Item $i");

  Future<List<ListRegister>?> listData() async {
    FormData formData = new FormData.fromMap(
      {},
    );

    String domain2 =
        "http://172.2.0.14/security/personal_register.php?select=register_list";

    String urlAPI = domain2;

    Response response = await Dio().post(urlAPI);
    print('ddd ${response.data}');

    var result = ListRegister.fromJsonList(response.data);
    //print("fsdf $result");
    return result;
  }
/*
  void filterCrop(String query) {
    List<ListRegister> result = [];
    if (query.isEmpty) {
      result = list!;
      //print('sss');
    } else {
      //print('lll');
      result = list!
          .where((element) => (element.code!)
              .toUpperCase()
              .contains(query.toUpperCase()))
          .toList();
    }
    setState(() {
      searchList = result;
      //searchList = duplicateItems.where((element) => (element.toLowerCase().contains(query.toLowerCase()))).toList();
    });
  }*/

  Future<List<ListRegister>?> filterdatatoday() async {
    return list?.toList();
  }

  @override
  void initState() {
    super.initState();

    listData().then((value) {
      setState(() {
        list = value;
        filterdatatoday().then((value) {
          setState(() {
            list1 = value;
          });
        });
      });
    });

    //searchList = duplicateItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Report Personal Regiser',
            style: TextStyle(fontFamily: 'cm', fontSize: 25)),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 202, 83, 123),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        //decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Container(
          // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          width: MediaQuery.of(context).size.width * .5,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 25),
                    width: 400,
                    height: 100,
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        hintText: 'search',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      onChanged: (value) {
                        print(dateInput.text);
                        setState(() {
                          list1 = list!
                              .where((element) =>
                                  (element.code! +
                                          element.name.toString() +
                                          element.doctime!.toString())
                                      .toLowerCase()
                                      .contains(value.toLowerCase()) &&
                                  element.doctime!
                                      .toString()
                                      .toLowerCase()
                                      .contains(dateInput.text.toString()))
                              .toList();
                        });
                      },
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 20)),
                  Container(
                    width: 130,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5))),
                    child: TextField(
                      controller: dateInput,
                      //editing controller of this TextField
                      decoration: InputDecoration(
                          icon: const Icon(Icons.calendar_today),
                          hoverColor: Colors.lightBlue[50], //icon of text field
                          labelText: "Enter Date" //label text of field
                          ),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2100));
                        if (pickedDate != null) {
                          //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate = DateFormat('yyyy-MM-dd').format(
                              pickedDate); //formatted date output using intl package =>  2021-03-16
                          setState(() {
                            dateInput.text = formattedDate;
                            //set output date to TextField value.
                          });
                        } else {}
                      },
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  width: MediaQuery.of(context).size.width * .4,
                  height: MediaQuery.of(context).size.height * .8,
                  child: ListView.builder(
                      itemCount: list1!.length,
                      itemBuilder: (context, index) {
                        return _listItem(index);
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _listItem(index) {
    DateTime time = new DateFormat("yyyy-MM-dd hh:mm:ss")
        .parse(list1![index].doctime.toString());
    var time1 = DateFormat("dd-MM-yyyy").format(time);
    var time2 = DateFormat("hh:mm").format(time);

    return Card(
      key: ValueKey(list1![index].code),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${list1![index].code}',
                style: const TextStyle(fontFamily: 'cm', fontSize: 25)),
            Text('${list1![index].name}',
                style: const TextStyle(fontFamily: 'pg', fontSize: 25)),
            Container(
              child: Row(
                children: [
                  Text(time1,
                      style: const TextStyle(fontFamily: 'cm', fontSize: 25)),
                  const Padding(padding: EdgeInsets.only(left: 10)),
                  Text(time2,
                      style: const TextStyle(fontFamily: 'cm', fontSize: 25)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
