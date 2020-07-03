import 'package:flutter/material.dart';
import 'package:flutterdemoapp/UI/pages/DynamicPage.dart';
import 'package:flutterdemoapp/UI/pages/HomePage.dart';
import 'package:flutterdemoapp/UI/pages/MinePage.dart';
import 'package:flutterdemoapp/UI/pages/OtherPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final myPageView = MyPageView();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.teal,
          accentColor: Colors.cyan,
        ),
//      darkTheme: ThemeData.dark(),
//      themeMode: ThemeMode.dark,
        home: Scaffold(
          body: myPageView,
          bottomNavigationBar: MyBottomNavigationBar(pageView: myPageView),
        ));
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
  var myBottomNavigationBarState;

  MyBottomNavigationBar({MyPageView pageView}) {
    myBottomNavigationBarState = _MyBottomNavigationBarState(pageView: pageView);
  }

  @override
  _MyBottomNavigationBarState createState() => myBottomNavigationBarState;
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

  _MyBottomNavigationBarState({MyPageView pageView}) {
    if (pageView != null) {
      this.myPageView = pageView;
    }
  }

  @override
  Widget build(BuildContext context) {
    this.myPageView?.setPageViewOnPageChanged((selectIndex) {
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
              ?.getPageViewController()
              ?.animateToPage(index, duration: Duration(seconds: 1), curve: Curves.easeInOut);
        });
      },
    );
  }
}
