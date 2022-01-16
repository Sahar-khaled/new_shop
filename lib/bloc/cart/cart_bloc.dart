import 'package:bloc/bloc.dart';
import 'package:shopping_app/models/cart_model.dart';

import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading());

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is CartStarted) {
      yield* _mapcartStartedToState();
    } else if (event is CartProductAdded) {
      yield* _mapcartAddedToState(event, state);
    } else if (event is CartProductRemoved) {
      yield* _mapcartRemovedToState(event, state);
    }
  }
}

Stream<CartState> _mapcartStartedToState() async* {
  yield CartLoading();
  try {
    await Future<void>.delayed(Duration(seconds: 2));
    yield CartLoaded();
  } catch (_) {}
}

Stream<CartState> _mapcartAddedToState(
    CartProductAdded event, CartState state) async* {
  if (state is CartLoaded) {
    try {
      yield CartLoaded(
        cart:
            Cart(products: List.from(state.cart.products)..add(event.product)),
      );
    } catch (_) {}
  }
}

Stream<CartState> _mapcartRemovedToState(
    CartProductRemoved event, CartState state) async* {
  if (state is CartLoaded) {
    try {
      yield CartLoaded(
        cart: Cart(
            products: List.from(state.cart.products)..remove(event.product)),
      );
    } catch (_) {}
  }
}
