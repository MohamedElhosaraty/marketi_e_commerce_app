

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_e_commerce_app/features/home/domain/usecase/product_usecase.dart';

import '../../../domain/entity/product_entity.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productUseCase) : super(ProductInitial());

  bool isFirstLoading = false;

  final ProductUseCase  productUseCase;
  Future<void> getProducts()async{
    if(isFirstLoading) return;
    emit(ProductLoading());
    final result = await productUseCase.call();
    result.fold((failure) {
      emit(ProductError(failure.error));
    }, (products) {
      isFirstLoading = true;
      emit(ProductSuccess(products));
    });
  }

}
