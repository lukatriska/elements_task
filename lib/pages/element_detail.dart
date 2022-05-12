import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/bloc/my_element_bloc.dart';
import 'package:untitled1/models/my_element.dart';

class ElementDetail extends StatefulWidget {
  final MyElement currentElement;

  const ElementDetail(this.currentElement, {Key? key}) : super(key: key);

  @override
  State<ElementDetail> createState() => _ElementDetailState();
}

class _ElementDetailState extends State<ElementDetail> {
  final myController = TextEditingController();

  bool editingTitle = false;
  bool editingBody = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyElementBloc, MyElementState>(
      builder: (context, state) {
        if (state is ElementsFetched) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Element details"),
            ),
            body: Column(
              children: [
                const Text("Title of element:"),
                Row(
                  children: [
                    editingTitle
                        ? Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: myController,
                                decoration: InputDecoration(
                                    labelText: widget.currentElement.title),
                              ),
                            ),
                          )
                        : Text(widget.currentElement.title),
                    ElevatedButton(
                        onPressed: () {
                          if (editingTitle) {
                            BlocProvider.of<MyElementBloc>(context)
                                .add(UpdateElementDetail(
                                    widget.currentElement,
                                    MyElement(
                                      myController.text,
                                      widget.currentElement.body,
                                      widget.currentElement.elementIcon,
                                    )));
                          }
                          setState(() => editingTitle = !editingTitle);
                        },
                        child: editingTitle
                            ? const Icon(Icons.done)
                            : const Icon(Icons.edit))
                  ],
                ),
                const Text("Body of element:"),
                Text(widget.currentElement.body),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
