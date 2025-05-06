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
  GlobalKey key2 = GlobalKey();
  GlobalKey key3 = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((value) {
      ShowCaseWidget.of(context).startShowCase([key1, key2, key3]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  _IntroWidget(
                    key: key2,
                    title: "Your cart",
                    desc: "Her are all your carts",
                    child: Text(
                      "Your cart",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              _IntroWidget(
                key: key1,
                title: "Order Now button",
                desc: "To order press this Button",
                child: CupertinoButton(
                  color: Colors.yellow,
                  onPressed: () {},
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

class _IntroWidget extends StatelessWidget {
  final GlobalKey key;
  final String title;
  final String desc;
  final Widget child;

  const _IntroWidget({
    required this.key,
    required this.title,
    required this.desc,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Showcase(
      blurValue: 5,
      key: key,
      title: title,
      titleTextStyle: TextStyle(
        color: Colors.deepPurple,
        fontSize: 15,
        fontWeight: FontWeight.w700,
      ),
      description: desc,
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
          leadIcon: ActionButtonIcon(
            icon: Icon(
              CupertinoIcons.chevron_left,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
        TooltipActionButton(
          type: TooltipDefaultActionType.next,
          backgroundColor: Colors.blue,
          textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
          tailIcon: ActionButtonIcon(
            icon: Icon(
              CupertinoIcons.chevron_right,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
      ],
      child: child,
    );
  }
}
