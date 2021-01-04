import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        iconList: [
          Icons.home,
          Icons.favorite,
          Icons.list_alt_outlined,
          Icons.settings
        ],
        onChange: (val) {
          setState(() {
            _selectedItem = val;
          });
        },
        defaultSelectedIndex: 0,
      ),
      // appBar: AppBar(
      //   title: Text('Customer Main'),
      // ),
      body: Center(
        child: Text('Customer'),
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> iconList;

  CustomBottomNavigationBar({this.defaultSelectedIndex = 0, @required this.onChange,@required this.iconList});

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  List<IconData> _iconList=[];

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

  Widget buildNavBarItem(IconData icon, int index) {
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
            : BoxDecoration(), child: Icon(icon, color: index == _selectedIndex ? const Color(0xffFE4180) : Colors.black),
      ),
    );
  }
}