import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_e_commerce_app/features/home/domain/entity/category_entity.dart';
import 'package:marketi_e_commerce_app/features/home/domain/usecase/category_usecase.dart';


part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.categoryUseCase) : super(CategoryInitial());

  final CategoryUseCase categoryUseCase;
  bool isFirstLoading = false;


  Future<void> getCategories() async {
    if (isFirstLoading) return;
    emit(CategoryLoading());
    final result = await categoryUseCase.call();
    result.fold((failure) {
      emit(CategoryError(failure.error));
    }, (categories) {
      isFirstLoading = true;
      emit(CategorySuccess(categories));
    });
  }
}
