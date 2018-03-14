import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  @override
  ExpensesState createState() => new ExpensesState();
}

class ExpensesState extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _createListView(50),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () {},
        child: new Icon(
          Icons.add,
          color: Colors.white,
        ),
        tooltip: 'Add expense',
      ),
    );
  }

  _createListView(int count) {
    return new ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _createListItem(index);
        },
        itemCount: count);
  }

  _createListItem(int index) {
    return new Column(
      children: <Widget>[
        new InkWell(
            onTap: () {},
            child: new Padding(
              padding: new EdgeInsets.fromLTRB(12.0, 18.0, 12.0, 18.0),
              child: new Row(
                children: <Widget>[
                  _createListItemLeftContent(index),
                  _createListItemRightContent(index)
                ],
              ),
            )),
        new Divider(height: 1.0)
      ],
    );
  }

  _createListItemLeftContent(int index) {
    return new Expanded(
        flex: 4,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(_getDate(index),
                style: new TextStyle(fontSize: 16.0, color: Colors.black)),
            new Text((index % 2 == 0) ? 'Income' : 'Expense',
                style: new TextStyle(fontSize: 12.0, color: Colors.grey))
          ],
        ));
  }

  _getDate(int index){
    DateTime dateTime = new DateTime.now().add(new Duration(days: index));
    return dateTime.day.toString()+'-'+ dateTime.month.toString()+'-'+dateTime.year.toString();
  }

  _createListItemRightContent(index) {
    return new Expanded(
        flex: 2,
        child: new Material(
          borderRadius: new BorderRadius.circular(18.0),
          child: new Container(
            padding: new EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
            color: _isEvenRow(index) ? Colors.lightBlue : Colors.blueGrey,
            child: new Center(
                child: new Text( _isEvenRow(index) ? '+13000' : '-3000',
                    style: new TextStyle(color: Colors.white, fontSize: 14.0))),
          ),
        ));
  }

  _isEvenRow(int index){
    return (index % 2 == 0);
  }
}
