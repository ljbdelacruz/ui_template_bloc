

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_template_bloc/core/ui_template_local_datasource.dart';
import 'package:ui_template_bloc/features/dropdown/ui_dropdown_bloc.dart';
import 'package:ui_template_bloc/ui_template_service.dart';

final GetIt serviceLocator = GetIt.instance;

SharedPreferences? _sharedPref;
void setupUITemplateServices() async {
  _sharedPref = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => UITemplateLocalDatasource(getSharedPref()));
  serviceLocator.registerLazySingleton(() => UITemplateServices(getLocalDS()));
}

IuITemplateLocalDatasource getLocalDS(){
  return serviceLocator<UITemplateLocalDatasource>();
}
IuITemplateServices getService(){
  return serviceLocator<UITemplateServices>();
}
getSharedPref(){
  return _sharedPref!;
}

/// call this if you want to have a access to a single instance of the BloC
void setupSingleInstance({List<String> dropDownItems = const ["Test 1", "Test 2"]}){
  serviceLocator.registerLazySingleton(() => initDropDownBloc(dropDownItems: dropDownItems));
}
UIDropDownBloc getUIDropDownBloc(){
  return serviceLocator<UIDropDownBloc>();
}
/// call this method to initialize your own dropdown bloc
/// localKey -> key used to store values
UIDropDownBloc initDropDownBloc({List<String> dropDownItems = const ["Test 1", "Test 2"], String value = "", String localKey = "ui_dropdown_bloc_value"}) {
  if(value.isEmpty) {
    value = dropDownItems.first;
  }
  return UIDropDownBloc(getLocalDS(), dropDownItems, value, localKey: localKey);
}

