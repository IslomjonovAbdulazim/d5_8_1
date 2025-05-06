import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey key1 = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((value) {
      ShowCaseWidget.of(context).startShowCase([key1]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Spacer(),
              Showcase(
                key: key1,
                title: "Order Now button",
                titleTextStyle: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
                description: 'Press this button to order',
                descTextStyle: TextStyle(
                  color: Colors.blue,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                descriptionTextAlign: TextAlign.center,
                showArrow: true,
                tooltipActions: [
                  TooltipActionButton(
                    type: TooltipDefaultActionType.previous,
                    backgroundColor: Colors.red,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    leadIcon: ActionButtonIcon(icon: )
                  ),
                  TooltipActionButton(
                    type: TooltipDefaultActionType.next,
                    backgroundColor: Colors.blue,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
                child: CupertinoButton(
                  onPressed: () {},
                  color: Colors.yellow,
                  child: Center(
                    child: Text("Order Now"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
