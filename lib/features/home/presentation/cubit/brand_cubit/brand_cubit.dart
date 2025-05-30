import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_e_commerce_app/features/home/domain/entity/brand_entity.dart';
import 'package:marketi_e_commerce_app/features/home/domain/usecase/brand_usecase.dart';

part 'brand_state.dart';

class BrandCubit extends Cubit<BrandState> {
  BrandCubit(this.brandUseCase) : super(BrandInitial());

  final BrandUsecase brandUseCase;
  bool isFirstLoading = false;


  Future<void> getBrands() async {
    if (isFirstLoading) return;
    emit(BrandLoading());
    final result = await brandUseCase.call();
    result.fold((failure) {
      emit(BrandError(failure.error));
    }, (brands) {
      isFirstLoading = true;
      emit(BrandSuccess(brands));
    });
  }

}
