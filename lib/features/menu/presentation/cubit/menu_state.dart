sealed class MenuState {}

final class MenuInitial extends MenuState {}

final class ChangeMenuItemState extends MenuState {}

final class ChangeGroupValState extends MenuState {}

final class AddMealLoadingState extends MenuState {}

final class AddMealSuccessState extends MenuState {}

final class AddMealErrorState extends MenuState {}

final class DeleteMealLoadingState extends MenuState {}

final class DeleteMealSuccessState extends MenuState {}

final class DeleteMealErrorState extends MenuState {}

final class GetAllChefMealsLoadingState extends MenuState {}

final class GetAllChefMealsSuccessState extends MenuState {}

final class GetAllChefMealsErrorState extends MenuState {}
