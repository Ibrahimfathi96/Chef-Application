import 'package:chef_app/features/menu/presentation/cubit/menu_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuInitial());
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
}
