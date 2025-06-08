import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_e_commerce_app/features/home/domain/usecase/add_rate_usecase.dart';

part 'add_rate_state.dart';

class AddRateCubit extends Cubit<AddRateState> {
  AddRateCubit(this.addRateUseCase) : super(AddRateInitial());

  final AddRateUseCase addRateUseCase;

  Future<void> addRate(String productId, String rate) async {
    final result = await addRateUseCase.call(productId, rate);
    result.fold((failure) => emit(AddRateError(failure.error)),
            (data) =>
            emit(AddRateSuccess()));
  }
}
