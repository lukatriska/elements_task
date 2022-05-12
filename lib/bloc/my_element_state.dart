part of 'my_element_bloc.dart';

abstract class MyElementState extends Equatable {
  const MyElementState();
}

class MyElementInitial extends MyElementState {
  @override
  List<Object> get props => [];
}

class ElementsFetched extends MyElementState {
  final List<MyElement> elements;

  const ElementsFetched(this.elements);

  @override
  List<Object?> get props => [elements];
}
