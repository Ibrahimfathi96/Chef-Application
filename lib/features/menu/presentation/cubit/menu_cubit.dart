import 'package:chef_app/features/menu/data/models/menu_model.dart';
import 'package:chef_app/features/menu/data/repository/menu_repo.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class MenuCubit extends Cubit<MenuState> {
  final MenuRepository menuRepository;
  MenuCubit(this.menuRepository) : super(MenuInitial());
  String groupVal = 'quantity';
  XFile? image;
  TextEditingController mealNameController = TextEditingController();
  TextEditingController mealPriceController = TextEditingController();
  TextEditingController mealDescController = TextEditingController();
  GlobalKey<FormState> addToMenuKey = GlobalKey<FormState>();
  List categoryList = [
    "Beef",
    "Chicken",
    "Fish",
    "SeaFood",
    "Pork",
    "Lamb",
    "Vegetarian",
    "Vegan",
    "Gluten-free",
  ];
  String selectedItem = "Beef";

  void changeItem(item) {
    selectedItem = item;
    emit(ChangeMenuItemState());
  }

  void changeGroupVal(val) {
    groupVal = val;
    emit(ChangeGroupValState());
  }

  void addMealToMenu() async {
    emit(AddMealLoadingState());
    final result = await menuRepository.addMealToMenu(
      image: image!,
      mealName: mealNameController.text,
      mealDesc: mealDescController.text,
      mealPrice: double.parse(mealPriceController.text),
      mealCategory: selectedItem,
      howToSeal: groupVal,
    );
    result.fold(
      (l) => emit(AddMealErrorState()),
      (r) => emit(AddMealSuccessState()),
    );
  }

  void deleteMealFromMenu(id) async {
    emit(DeleteMealLoadingState());
    final result = await menuRepository.deleteMealById(mealId: id);
    result.fold(
      (l) => emit(DeleteMealErrorState()),
      (r) => emit(DeleteMealSuccessState()),
    );
  }

  List<MealModel> meals = [];
  void getAllChefMeals() async {
    emit(GetAllChefMealsLoadingState());
    final result = await menuRepository.getMeals();
    result.fold(
      (l) => emit(GetAllChefMealsErrorState()),
      (r) {
        meals = r.meals;
        emit(GetAllChefMealsSuccessState());
      },
    );
  }
}
