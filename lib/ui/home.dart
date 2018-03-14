import 'package:expense_tracker/ui/balance.dart';
import 'package:expense_tracker/ui/expenses.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final List<Widget> tabItems = <Widget>[
    const Tab(text: 'EXPENSES'),
    const Tab(text: 'BALANCE')
  ];
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(vsync: this, length: tabItems.length);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: _createAppBar(),
        body: new TabBarView(
            children: <Widget>[new Expenses(), new Balance()],
            controller: _controller));
  }

  _createAppBar() => new AppBar(
      title: const Text('Expense Tracker',
          style: const TextStyle(color: Colors.white)),
      bottom: _createTab());

  _createTab() => new TabBar(
      labelColor: Colors.white,
      indicatorColor: Colors.deepOrange,
      controller: _controller,
      isScrollable: false,
      tabs: tabItems);
}
