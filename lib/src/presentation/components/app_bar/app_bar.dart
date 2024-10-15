import 'package:flutter/material.dart';
import 'package:parkshare_app/src/core/constants/design_system.dart';
import 'package:parkshare_app/src/core/navigation.dart';
import 'package:parkshare_app/src/presentation/components/custom_form_field/custom_form_field.dart';

class BottomAppBarDemo extends StatefulWidget {
  final Widget body;

  const BottomAppBarDemo({required this.body, super.key});

  @override
  State createState() => _BottomAppBarDemoState();
}

class _BottomAppBarDemoState extends State<BottomAppBarDemo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
       body: widget.body,
        floatingActionButton: FloatingActionButton(
          backgroundColor: DesignSystem.colors.primary,
          shape: CircleBorder(),
          onPressed: () {
            Navigator.pushNamed(
                context, Navigation.routing.home);
          },
          child: const Icon(Icons.map, color: Colors.white,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: _DemoBottomAppBar(
          fabLocation: FloatingActionButtonLocation.centerDocked,
          shape: const CircularNotchedRectangle(),
        ),
      ),
    );
  }
}

class _DemoBottomAppBar extends StatelessWidget {
  const _DemoBottomAppBar({
    this.fabLocation = FloatingActionButtonLocation.endDocked,
    this.shape = const CircularNotchedRectangle(),
  });

  final FloatingActionButtonLocation fabLocation;
  final NotchedShape? shape;

  static final List<FloatingActionButtonLocation> centerLocations =
      <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      color: DesignSystem.colors.secondary,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.list_alt),
              onPressed: () {},
            ),
            if (centerLocations.contains(fabLocation)) const Spacer(),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
