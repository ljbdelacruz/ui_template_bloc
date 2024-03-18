import 'package:ui_template_bloc/core/ui_template_local_datasource.dart';

abstract class IuITemplateServices {
  Future<String> getDropDownValue({String key = "ui_dropdown_bloc_value"});
}

class UITemplateServices extends IuITemplateServices {
  final IuITemplateLocalDatasource localDS;
  UITemplateServices(this.localDS);
  @override
  Future<String> getDropDownValue({String key = "ui_dropdown_bloc_value"}) async {
    try {
      var result = await localDS.getDropDownValue(key);
      var rightResult = result.fold((l) => null, (r) => r) ?? "";
      return rightResult;
    } catch(e) {
      return "";
    }
  }
}