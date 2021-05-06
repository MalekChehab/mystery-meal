import 'package:flutter/material.dart';
import 'package:mystery_meal/constants/constants.dart';
import 'package:mystery_meal/main.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        height: _height/10,
        width: _width,
        padding: EdgeInsets.only(left: 15, top: 25),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors:
              [Theme.of(context).primaryColor, SecondaryColor]
          ),
        ),
        child: Row(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.arrow_back,),
                color: Theme.of(context).iconTheme.color,
                onPressed: (){
                  print("pop");
                  Navigator.of(context).pop();
                },
            ),
          ],
        ),
      ),
    );
  }
}

class HomeCustomAppBar extends StatefulWidget {
  // final bool searching;

  // HomeCustomAppBar(@required this.searching);
  @override
  _HomeCustomAppBarState createState() => _HomeCustomAppBarState();
}

class _HomeCustomAppBarState extends State<HomeCustomAppBar> {
  bool _searching = false;
  @override
  Widget build(BuildContext context) {
    // _searching = widget.searching;
    return Material(
      child: AppBar(
        centerTitle: true,
        title: Center(
            child: SearchBar(
              isSearching: _searching,
            )
        ),
        actions: <Widget>[
          IconButton(
            icon: !_searching? Icon(Icons.search) : Icon(Icons.clear_rounded),
            onPressed: () {
              setState(() {
                _searching = !_searching;
              });
            },
            tooltip: 'Search',
          ),
        ],
        elevation: 10,
        automaticallyImplyLeading: false,
        leading: new IconButton(
            icon: new Icon(Icons.location_on_rounded),
            tooltip: "Location",
            onPressed: () {}
            ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final bool isSearching;
  SearchBar({@required this.isSearching});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimateExpansion(
          animate: !isSearching,
          axisAlignment: 1.0,
          child: Text('Mystery Meal'),
        ),
        AnimateExpansion(
          animate: isSearching,
          axisAlignment: -1.0,
          child: Search(),
        ),
      ],
    );
  }
}

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Search for...',
        hintStyle: TextStyle(
          fontSize: 20,
          color: Colors.white.withOpacity(.5),
        ),
      ),
    );
  }
}

class AnimateExpansion extends StatefulWidget {
  final Widget child;
  final bool animate;
  final double axisAlignment;
  AnimateExpansion({
    this.animate = false,
    this.axisAlignment,
    this.child,
  });

  @override
  _AnimateExpansionState createState() => _AnimateExpansionState();
}

class _AnimateExpansionState extends State<AnimateExpansion>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  void prepareAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 350),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInCubic,
      reverseCurve: Curves.easeOutCubic,
    );
  }

  void _toggle() {
    if (widget.animate) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _toggle();
  }

  @override
  void didUpdateWidget(AnimateExpansion oldWidget) {
    super.didUpdateWidget(oldWidget);
    _toggle();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        axis: Axis.horizontal,
        axisAlignment: -1.0,
        sizeFactor: _animation,
        child: widget.child);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
