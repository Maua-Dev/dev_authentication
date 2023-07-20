import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CodeWidget extends StatefulWidget {
  final void Function(String)? onChanged;
  final void Function()? onSubmitted;
  const CodeWidget({super.key, this.onChanged, this.onSubmitted});

  @override
  State<CodeWidget> createState() => _CodeWidgetState();
}

class _CodeWidgetState extends State<CodeWidget> {
  final _box1Controller = TextEditingController();
  final _box2Controller = TextEditingController();
  final _box3Controller = TextEditingController();
  final _box4Controller = TextEditingController();
  final _box5Controller = TextEditingController();
  final _box6Controller = TextEditingController();

  final _box1FocusNode = FocusNode();
  final _box2FocusNode = FocusNode();
  final _box3FocusNode = FocusNode();
  final _box4FocusNode = FocusNode();
  final _box5FocusNode = FocusNode();
  final _box6FocusNode = FocusNode();

  List<TextEditingController> _boxesControllers = [];
  List<FocusNode> _boxesFocusNodes = [];

  String _code = '';

  @override
  void initState() {
    super.initState();
    _boxesControllers = [
      _box1Controller,
      _box2Controller,
      _box3Controller,
      _box4Controller,
      _box5Controller,
      _box6Controller,
    ];
    _boxesFocusNodes = [
      _box1FocusNode,
      _box2FocusNode,
      _box3FocusNode,
      _box4FocusNode,
      _box5FocusNode,
      _box6FocusNode,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            6,
            (index) => SizedBox(
                  width: MediaQuery.of(context).size.width / 7,
                  height: MediaQuery.of(context).size.width / 7 + 8,
                  child: TextFormField(
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24),
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: '0',
                    ),
                    controller: _boxesControllers[index],
                    focusNode: _boxesFocusNodes[index],
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onTap: () {
                      if (_code.isEmpty) {
                        FocusScope.of(context)
                            .requestFocus(_boxesFocusNodes[0]);
                      } else {
                        FocusScope.of(context)
                            .requestFocus(_boxesFocusNodes[index]);
                      }
                    },
                    onChanged: (value) {
                      setState(() {
                        _code = _boxesControllers.fold(
                            '',
                            (previousValue, element) =>
                                previousValue + element.text);
                      });
                      if (widget.onChanged != null) widget.onChanged!(_code);
                      if (value.isNotEmpty) {
                        if (index < 5) {
                          FocusScope.of(context)
                              .requestFocus(_boxesFocusNodes[index + 1]);
                        } else {
                          FocusScope.of(context).unfocus();
                          if (widget.onSubmitted != null) {
                            widget.onSubmitted!();
                          }
                        }
                      } else {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                  ),
                )));
  }
}
