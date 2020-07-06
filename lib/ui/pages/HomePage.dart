import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutterdemoapp/data/imageUrl.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: HomeContent(),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 350,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: NetworkImage(
                    "https://imgpub.chuangkit.com/designTemplate/2020/03/16/532744779_thumb?v=1584325800000"),
                fit: BoxFit.cover,
              )),
          child: MyListView(),
        ),
        Container(
          height: 450,
          child: MyGridView(),
        ),
        DynamicAddListItem(),
      ],
    );
  }
}

// ignore: must_be_immutable

class MyListView extends StatelessWidget {
  final List<Widget> _listTitles = _getListData();

  static List<Widget> _getListData() {
    var tempList = <Widget>[];
    for (int i = 0; i < 10; i++) {
      if (i == 0) {
        tempList.add(CustomColumn());
      }
      tempList.add(Container(
        //ListTile 默认宽度是无限制的，所以在横向列表时需要限制它的宽度，不然布局就会出错
        width: 100,
        child: ListTile(
          leading: ClipOval(
            child: Image(
              image: NetworkImage(imageUrlData["可爱design"][0]),
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            ),
          ),
          title: Text('标题$i'),
          subtitle: Text("内容概览$i"),
          selected: true,
        ),
      ));
    }
    return tempList;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => _listTitles[index],
        separatorBuilder: (context, index) {
          return Divider(
            height: 2,
            thickness: 1,
            indent: 80,
            color: Colors.deepOrange,
          );
        },
        itemCount: _listTitles.length);
  }
}

class CustomColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyContainer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("本地图片"),
            Image(
              image: AssetImage('images/Avatar_2.jpg'),
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("网络图片"),
            Image(
              image: NetworkImage(
                  "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2782555045,2953409065&fm=26&gp=0.jpg"),
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            )
          ],
        )
      ],
    );
  }
}

class MyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      alignment: Alignment.center,
      margin: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
//      color: Colors.lightBlueAccent,
      decoration: ShapeDecoration(
          gradient:
              LinearGradient(colors: [Colors.lightBlue, Colors.deepPurpleAccent], transform: GradientRotation(10)),
          shape: Border(
              left: BorderSide(color: Colors.black, width: 2),
              top: BorderSide(color: Colors.deepOrange, width: 2),
              bottom: BorderSide(color: Colors.green, width: 2),
              right: BorderSide(color: Colors.pink, width: 2))),
      child: GestureDetector(
        child: Text("Hello World"),
      ),
      transform: Matrix4.rotationX(math.pi / 6),
    );
  }
}

class MyGridView extends StatelessWidget {
  final List<Widget> _gridData = _getGridData();

  static List<Widget> _getGridData() {
    var tempList = <Widget>[];
    imageUrlData["唯美插画"].forEach((imageUrl) => tempList.add(Card(
          color: Colors.white,
          elevation: 15,
          shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20)),
          shadowColor: Colors.pink,
          child: Stack(
            children: <Widget>[
              AspectRatio(
                //aspectRatio：代表宽高比
                aspectRatio: 1.618,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment(0, 0.9),
                child: Text(
                  "唯美插画${imageUrlData["唯美插画"].indexOf(imageUrl)}",
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 20,
                      decorationColor: Colors.cyan,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.wavy),
                ),
              ),
            ],
          ),
        )));
    return tempList;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5, childAspectRatio: 0.618)
      //childAspectRatio: 代表交叉轴与横轴的比例
      ,
      itemBuilder: (context, index) => _gridData[index],
      itemCount: _gridData.length,
    );
  }
}

class DynamicAddListItem extends StatefulWidget {
  @override
  _DynamicAddListItemState createState() => _DynamicAddListItemState();
}

class _DynamicAddListItemState extends State<DynamicAddListItem> {
  var items = [];

  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Wrap(spacing: 10, runSpacing: 10, children: List.castFrom(items)),
        MaterialButton(
          child: Text("动态添加item"),
          elevation: 10,
          splashColor: Colors.cyanAccent,
          //水波纹颜色
          color: Theme.of(context).buttonColor,
          highlightColor: Colors.deepOrange,
          onPressed: () {
            setState(() {
              items.add(CircleAvatar(
                backgroundImage: NetworkImage(imageUrlData["唯美插画"][index++]),
              ));
            });
          },
        )
      ],
    );
  }
}
