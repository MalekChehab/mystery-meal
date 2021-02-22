import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconButton> iconList;

  CustomBottomNavigationBar({this.defaultSelectedIndex = 0, @required this.onChange,@required this.iconList});

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  List<IconButton> _iconList=[];

  @override
  void initState() {
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList=widget.iconList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList=[];

    for(var i=0;i<_iconList.length;i++){
      _navBarItemList.add(buildNavBarItem(_iconList[i], i));
    }
    return Row(
      children: _navBarItemList,
    );
  }

  Widget buildNavBarItem(IconButton icon1, int index) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: MediaQuery.of(context).size.width / _iconList.length,
        decoration: index == _selectedIndex ? BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 5, color: const Color(0xffFE4180))),
          gradient: LinearGradient(colors: [
            const Color(0xfffe9256).withOpacity(0.5),
            const Color(0xffFE4180).withOpacity(0.03),
          ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter),
        )
            : BoxDecoration(),
        child: IconButton(icon: icon1,color: index == _selectedIndex ? const Color(0xffFE4180) : Colors.black),
      ),
    );
  }
}

