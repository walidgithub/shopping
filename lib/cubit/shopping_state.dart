abstract class ShoppingState {}

class ShoppingInitial extends ShoppingState {}

class AddProductState extends ShoppingState {}

class GetProductsState extends ShoppingState {}

class BeforeAddingLoadingState extends ShoppingState {}

class LoadingProductsState extends ShoppingState {}

class AddFollowState extends ShoppingState {}

class CheckFollowState extends ShoppingState {}

class ToggleFollowState extends ShoppingState {}

class AddToCartState extends ShoppingState {}

class CheckAddToCartState extends ShoppingState {}

class ToggleAddToCartState extends ShoppingState {}

class CountInCartState extends ShoppingState {}