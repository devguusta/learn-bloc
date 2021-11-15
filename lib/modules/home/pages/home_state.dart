import 'package:blocjson/core/services/dio/utils/failure.dart';

abstract class HomeStateState {}

class HomeStateStateSuccess implements HomeStateState {}

class HomeStateFailure implements HomeStateState {
  late Failure error;
  HomeStateFailure({
    required this.error,
  });
}

class CreateWalletStateLoading implements HomeStateState {}

class CreateWalletStateEmpty implements HomeStateState {}

extension CreateWalletStateExt on HomeStateState {
  when({
    Function? success,
    Function? failure,
    Function? loading,
    Function? empty,
    required Function orElse,
  }) {
    switch (runtimeType) {
      case HomeStateStateSuccess:
        {
          if (success != null) return success();
          return orElse();
        }
      case HomeStateFailure:
        {
          if (failure != null) return failure();
          return orElse();
        }

      case CreateWalletStateLoading:
        {
          if (loading != null) return loading();
          return orElse();
        }
      case CreateWalletStateEmpty:
        {
          if (empty != null) return empty();
          return orElse();
        }
      default:
        {
          return orElse();
        }
    }
  }
}
