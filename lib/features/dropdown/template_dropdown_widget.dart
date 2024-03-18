import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_template_bloc/features/dropdown/ui_dropdown_bloc.dart';

class UITemplate1DropDownWidget extends StatelessWidget {
  final UIDropDownBloc bloc;
  const UITemplate1DropDownWidget(this.bloc, {super.key});
  @override
  Widget build(BuildContext context) {

    return BlocProvider<UIDropDownBloc>(
        create: (context) => bloc,
        child: BlocBuilder<UIDropDownBloc, UIDropdownState>(
          bloc: bloc,
          builder: (context, state) {
            if(state is UIDropdownInitState) {
              return dropDownWidget(state.value, state.options);
            } else if(state is UIDropDownLoadingState) {
              return Container();
            } else if(state is UIDropDownErrorState) {
              return Column(children:[
                dropDownWidget(state.value, state.options),
                Text(state.message),
              ]);
            } else {
              return Container();
            }
          })
    );
  }

  Widget dropDownWidget(String value, List<String> options) {
    return Container(
      color: Colors.blue,
      child:DropdownButton<String>(
                      // Set the currently selected value
                      value: value,
                      // This function is called when the user selects a new item
                      onChanged: (String? newValue) {
                        bloc.add(UIDropDownSelectItemEvent(newValue ?? ""));
                      },
                      // List of DropdownMenuItem objects
                      items: options.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
    ));
  }
}