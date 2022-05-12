import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/models/my_element.dart';
import 'package:untitled1/models/my_element.dart';
import 'package:untitled1/pages/element_detail.dart';

import '../bloc/my_element_bloc.dart';

class ElementsList extends StatelessWidget {
  const ElementsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyElementBloc, MyElementState>(
      builder: (context, state) {
        if (state is ElementsFetched) {
          return BlocProvider(
            create: (context) => MyElementBloc(),
            child: Scaffold(
              body: ListView.builder(
                itemBuilder: (context, index) {
                  var currentElement = state.elements[index];
                  return ListTile(
                    title: Text(currentElement.title),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ElementDetail(currentElement)));
                    },
                  );
                },
                itemCount: state.elements.length,
              ),
              appBar: AppBar(
                title: const Text("Axles Task"),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
