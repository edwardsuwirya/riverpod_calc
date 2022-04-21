import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_river_calc/models/calculator.dart';
import 'package:my_river_calc/repository/calculator_api.dart';
import 'package:my_river_calc/repository/calculator_api_impl.dart';
import 'package:my_river_calc/screens/calculator/providers/calculator_viewmodel.dart';

final calculatorViewModelProvider =
    StateNotifierProvider<CalculatorViewModel, Calculator>(
  (ref) => CalculatorViewModel(ref),
);
final calculatorApiRepoProvider = FutureProvider<CalculatorApi>((ref) async {
  return CalculatorApiImpl();
});
