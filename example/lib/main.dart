// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:ui_template_bloc/core/di_service.dart';
import 'package:ui_template_bloc/features/dropdown/template_dropdown_widget.dart';
import 'package:ui_template_bloc/features/dropdown/ui_dropdown_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupUITemplateServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  UIDropDownBloc? countryDropDownBloc;
  UIDropDownBloc? regionDropDownBloc;
  MyHomePage({super.key, required this.title}){
    countryDropDownBloc = initDropDownBloc(dropDownItems: ["Philippines", "Australia", "Canada"], localKey: "local_key_country");
    regionDropDownBloc = initDropDownBloc(dropDownItems: ["NCR", "Davao Del Sur", "Davao City"], localKey: "local_key_region");
  }
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Country DropDown Sample"),
            UITemplate1DropDownWidget(widget.countryDropDownBloc!),
            const Text("Region DropDown Sample"),
            UITemplate1DropDownWidget(widget.regionDropDownBloc!)
          ],
        ),
      ),
    );
  }
}
