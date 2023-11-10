import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:metastock/app_cubit.dart';
import 'package:metastock/models/product.dart';

import '../../services/product_service.dart';

part 'produit_state.dart';

class ProduitCubit extends Cubit<ProduitState> {
  ProduitCubit({required this.appCubit, required this.product})
      : super(ProduitState(
          product: product,
          archive: product.archive,
          name: product.name ?? '',
          uniprice: product.unitprice ?? 0,
          threshold: product.threshold ?? 0,
          stock: product.stock,
          description: product.description ?? "",
          id: product.id ?? 0,
          picture: product.picture ?? "",
        ));

  Product product;
  ProductService service = ProductService();
  AppCubit appCubit;

  // void changeId(int id) {
  //   emit(state.copyWith(id: id));
  // }

  void changeName(String name) {
    if (name == "") {
      emit(state.copyWith(name: appCubit.state.product?.name ?? "Error"));
      return;
    }
    emit(state.copyWith(name: name));
  }

  void changeDescription(String description) {
    if (description == "") {
      emit(
          state.copyWith(name: appCubit.state.product?.description ?? "Error"));
      return;
    }
    emit(state.copyWith(description: description));
  }

  void changePicture(String picture) {
    if (picture == "") {
      emit(state.copyWith(name: appCubit.state.product?.picture ?? "Error"));
      return;
    }
    emit(state.copyWith(picture: picture));
  }

  void changeThreshold(int threshold) {
    if (threshold == "") {
      emit(state.copyWith(threshold: appCubit.state.product?.threshold));
      return;
    }
    emit(state.copyWith(threshold: threshold));
  }

  void changeStock(int stock) {
    if (stock == "") {
      emit(state.copyWith(stock: appCubit.state.product?.stock));
      return;
    }
    emit(state.copyWith(stock: stock));
  }

  void changeUniprice(double uniprice) {
    if (uniprice == "") {
      emit(state.copyWith(uniprice: appCubit.state.product?.unitprice));
      return;
    }
    emit(state.copyWith(uniprice: uniprice));
  }

  void changeArchive(bool archive) {
    emit(state.copyWith(archive: archive));
  }

  void updateProduct() {
    Product product = Product(
        state.archive,
        state.product.id,
        state.stock,
        state.description,
        state.name,
        state.picture,
        state.uniprice,
        state.threshold);
    print("id :");
    print(product.id.toString());
    service.update(product);
  }
}
