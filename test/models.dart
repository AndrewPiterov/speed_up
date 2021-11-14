import 'package:equatable/equatable.dart';

class CoinOrder extends Equatable {
  const CoinOrder(this.amount, this.coinPrice);

  final double amount;
  final double coinPrice;

  @override
  List<Object?> get props => [
        amount,
        coinPrice,
      ];
}

class Person extends Equatable {
  const Person(
    this.name, {
    this.age,
  });

  final String name;
  final int? age;

  @override
  List<Object?> get props => [
        name,
        age,
      ];
}
