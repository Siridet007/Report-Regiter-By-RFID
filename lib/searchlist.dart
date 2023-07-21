import 'package:flutter/material.dart';
import 'package:report_register/model.dart';

class SearchListPage extends StatefulWidget {
  const SearchListPage({super.key});

  @override
  State<SearchListPage> createState() => _SearchListPageState();
}

class _SearchListPageState extends State<SearchListPage> {

  String? selectonList;
  List<ListRegister>? list = [];
  List<ListRegister>? list1 = [];
  TextEditingController controller = TextEditingController();
  
  

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}