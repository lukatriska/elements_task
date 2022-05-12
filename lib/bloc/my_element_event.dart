part of 'my_element_bloc.dart';

abstract class MyElementEvent extends Equatable {
  const MyElementEvent();
}

class FetchElements extends MyElementEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class UpdateElementDetail extends MyElementEvent {
  MyElement oldElement;
  MyElement newElement;

  UpdateElementDetail(this.oldElement, this.newElement);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}