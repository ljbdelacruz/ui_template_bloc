


// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_template_bloc/core/ui_template_local_datasource.dart';


abstract class UIDropdownState {}
abstract class UIDropdownEvent {}

// events

class UIDropDownSelectItemEvent extends UIDropdownEvent {
  final String value;
  UIDropDownSelectItemEvent(this.value);
}
class UIDropDownShowErrorEvent extends UIDropdownEvent {
  final String message;
  UIDropDownShowErrorEvent(this.message);
}
class UIDropDownProcessingEvent extends UIDropdownEvent {}


// states
class UIDropdownInitState extends UIDropdownState {
  final List<String> options;
  final String value;
  UIDropdownInitState(this.value, this.options);
}
class UIDropDownLoadingState extends UIDropdownState {}
class UIDropDownErrorState extends UIDropdownState {
  final List<String> options;
  final String value;
  final String message;
  UIDropDownErrorState(this.message, this.options, this.value);
}

class UIDropDownBloc extends Bloc<UIDropdownEvent,UIDropdownState>{
  /// localKey - key used to store and retrieve value from local storage  
  final IuITemplateLocalDatasource localDS;
  final String localKey;
  final List<String> options;
  String? value;
  UIDropDownBloc(this.localDS, this.options, this.value, {this.localKey = "ui_dropdown_bloc_value"}):super(UIDropDownLoadingState()){
    localDS.cacheDropDownValue(localKey, value ?? "");
    emit(UIDropdownInitState(value ?? options.first, options));
    on<UIDropDownSelectItemEvent>((event, emit) async {
      _toLoadingState();
      value = event.value;
      localDS.cacheDropDownValue(localKey, value ?? "");
      emit(UIDropdownInitState(event.value, options));
    });
    on<UIDropDownShowErrorEvent>((event, emit) {
      _toLoadingState();
      emit(UIDropDownErrorState(event.message, options, value ?? ""));
    });
    on<UIDropDownProcessingEvent>((event, emit) {
      _toLoadingState();
    });
  }
  _toLoadingState(){
    if(state is! UIDropDownLoadingState){
      emit(UIDropDownLoadingState());
    }
  }
}
