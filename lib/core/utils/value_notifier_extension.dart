import 'package:flutter/widgets.dart';

extension ValueNotifierT<T> on T {
  ValueNotifier<T> get obs => ValueNotifier<T>(this);
}

extension ValueNotifierList<T> on ValueNotifier<List<T>> {
  void addAll(List<T> values) {
    value = [...value, ...values];
  }

  void add(T newValue) {
    value = [...value, newValue];
  }
}
