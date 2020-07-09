import 'package:flutter/material.dart';

import 'DynamicPage.dart';
import 'HomePage.dart';
import 'MinePage.dart';
import 'OtherPage.dart';

class MainPage extends StatefulWidget {
  final arguments;

  MainPage({this.arguments});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pageView = MyPageView();
  final titles = ["首页", "动态", "其他", "我的"];
  int _position = 0;

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold(
      appBar: AppBar(
        title: Text(titles.elementAt(_position ??= 0)),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
      body: pageView,
      bottomNavigationBar: MyBottomNavigationBar(pageView: pageView),
    );
    _position = pageView.getPageViewController()?.page?.toInt();
    print("当前位置==$_position");
    return scaffold;
  }
}

class MyPageView extends StatefulWidget {
  final _myPageViewState = _MyPageViewState();

  @override
  _MyPageViewState createState() => _myPageViewState;

  PageController getPageViewController() => _myPageViewState._controller;

  setPageViewOnPageChanged(ValueChanged<int> onPageChanged) {
    _myPageViewState._onPageChanged = onPageChanged;
  }
}

class _MyPageViewState extends State<MyPageView> {
  var pages = [HomePage(), DynamicPage(), OtherPage(), MinePage()];

  PageController _controller;
  var _onPageChanged;

  @override
  void dispose() {
    _controller = null;
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    //viewportFraction 控制视图显示比例，可产生画廊效果
    _controller = PageController(viewportFraction: 1);
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: pages,
      controller: _controller,
      onPageChanged: _onPageChanged,
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  final MyPageView pageView;

  MyBottomNavigationBar({this.pageView});

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState(pageView: this.pageView);
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  final iconMap = {
    "首页": {"icon": Icons.home, "color": Colors.pink},
    "动态": {"icon": Icons.toys, "color": Colors.deepPurple},
    "其他": {"icon": Icons.audiotrack, "color": Colors.indigo},
    "我的": {"icon": Icons.child_care, "color": Colors.brown}
  };
  var selectItemPosition = 0;

  MyPageView myPageView;

  _MyBottomNavigationBarState({MyPageView pageView, String titleText}) {
    if (pageView != null) {
      this.myPageView = pageView;
    }
  }

  @override
  Widget build(BuildContext context) {
    this.myPageView.setPageViewOnPageChanged((selectIndex) {
      setState(() {
        selectItemPosition = selectIndex;
      });
    });

    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      elevation: 20,
      currentIndex: selectItemPosition,
      fixedColor: Theme.of(context).accentColor,
      backgroundColor: Colors.white,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(fontStyle: FontStyle.italic),
      selectedIconTheme: IconThemeData(size: 35),
      items:
          //此中写法更好：需要的存储数据的空间更小，组件list会更占内存
          iconMap.keys
              .map((title) => BottomNavigationBarItem(
                  title: Text(title), icon: Icon(iconMap[title]["icon"]), backgroundColor: iconMap[title]["color"]))
              .toList(),
      onTap: (index) {
        setState(() {
          selectItemPosition = index;
          this
              .myPageView
              .getPageViewController()
              .animateToPage(index, duration: Duration(seconds: 1), curve: Curves.easeInOut);
        });
      },
    );
  }
}
