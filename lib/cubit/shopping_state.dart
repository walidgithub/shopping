abstract class ShoppingState {}

class ShoppingInitial extends ShoppingState {}

class AddProductState extends ShoppingState {}

class GetProductsState extends ShoppingState {}

class BeforeAddingLoadingState extends ShoppingState {}

class LoadingProductsState extends ShoppingState {}