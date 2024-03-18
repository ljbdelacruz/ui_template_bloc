


import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_template_bloc/core/failure.dart';
import 'package:ui_template_bloc/core/success.dart';

abstract class IuITemplateLocalDatasource {
  Future<Either<Failure, Success>> cacheDropDownValue(String key, String value);
  Future<Either<Failure, String>> getDropDownValue(String key);
}


class UITemplateLocalDatasource extends IuITemplateLocalDatasource {
  final SharedPreferences _sharedPref;
  UITemplateLocalDatasource(this._sharedPref);
  @override
  Future<Either<Failure, Success>> cacheDropDownValue(String key, String value) async {
    try{
      _sharedPref.setString(key, value);
      return Right(CacheSuccess());
    }catch(e){
      return Left(LocalDatasourceFailure());
    }
  }
  @override
  Future<Either<Failure, String>> getDropDownValue(String key) async {
    try{
      return Right(_sharedPref.getString(key) ?? "");
    }catch(e){
      return Left(LocalDatasourceFailure());
    }
  }
}