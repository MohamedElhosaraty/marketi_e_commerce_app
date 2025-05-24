import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_e_commerce_app/core/api/dio_factory.dart';
import 'package:marketi_e_commerce_app/marketi_app.dart';
import 'core/di/dependency_injection.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/observer/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait<void>([ScreenUtil.ensureScreenSize(),  setupGetIt(), DioFactory.init()]);
  Bloc.observer = MyBlocObserver();
  runApp(const MarketApp());
}

