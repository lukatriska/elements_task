import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled1/models/my_element.dart';
import 'package:untitled1/service.dart';

part 'my_element_event.dart';
part 'my_element_state.dart';

class MyElementBloc extends Bloc<MyElementEvent, MyElementState> {
  MyElementBloc() : super(MyElementInitial()) {
    var elementRepository = ElementRepository();
    on<FetchElements>((event, emit) async {
      emit(ElementsFetched(await elementRepository.fetchElements()));
    });
    on<UpdateElementDetail>((event, emit) {
      var index = elementRepository.savedList.indexWhere((element) => element == event.oldElement);
      elementRepository.savedList[index] = event.newElement;
      emit(ElementsFetched(elementRepository.savedList));
    });
  }
}
