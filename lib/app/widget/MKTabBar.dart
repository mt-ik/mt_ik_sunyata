import 'package:flutter/material.dart';

class MKTabBar extends StatefulWidget {

    /// 底部tab
    static const int BOTTOM_TAB = 1;
    /// 顶部tab
    static const int TOP_TAB = 2;

    final int type;
    
    final List<Widget> tabItems;

    final List<Widget> tabViews;
    /// 背景色
    final Color backgroundColor;
    /// 选中色
    final Color indicatorColor;

    final Widget title;

    final Widget drawer;

    final Widget floatingActionButton;

    final TarWidgetControl tarWidgetControl;

    final PageController pageController;

    final ValueChanged<int> onPageChanged;

    MKTabBar({
        Key key, 
        this.type,
        this.tabItems, 
        this.tabViews,
        this.backgroundColor,
        this.indicatorColor,
        this.title,
        this.drawer,
        this.floatingActionButton,
        this.tarWidgetControl,
        this.pageController,
        this.onPageChanged,
    }) : super(key: key);
        

    @override
    _MKTabBarState createState() => new _MKTabBarState(
        type,
        tabViews,
        indicatorColor,
        title,
        drawer,
        floatingActionButton,
        tarWidgetControl,
        pageController,
        onPageChanged,
    );
}

class _MKTabBarState extends State<MKTabBar> with SingleTickerProviderStateMixin { 
    
    final int _type;

    final List<Widget> _tabViews;

    final Color _indicatorColor;

    final Widget _title;

    final Widget _drawer;

    final Widget _floatingActionButton;

    final TarWidgetControl _tarWidgetControl;

    final PageController _pageController;

    final ValueChanged<int> _onPageChanged;

    _MKTabBarState(
        this._type,
        this._tabViews,
        this._indicatorColor,
        this._title,
        this._drawer,
        this._floatingActionButton,
        this._tarWidgetControl,
        this._pageController,
        this._onPageChanged,
    ) : super();

    TabController _tabController;

    /// Widget初始化
    @override
    void initState() {
        super.initState();
        _tabController = new TabController(vsync: this, length: widget.tabItems.length);
    }
    /// Widget销毁
    @override
    void dispose() {
        _tabController.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        if (this._type == MKTabBar.TOP_TAB) {
            return _getTopTabBar(context);
        } else {
            return _getBottomTabBar(context);
        }
    }

    /// 获取顶部tabBar
    _getTopTabBar(BuildContext context) {
        return new Scaffold(
            floatingActionButton: _floatingActionButton,
            persistentFooterButtons: _tarWidgetControl == null ? <Widget>[] : _tarWidgetControl.footerButton,
            appBar: new AppBar(
                backgroundColor: Theme.of(context).primaryColor,
                title: _title,
                bottom: new TabBar(
                    controller: _tabController,
                    tabs: widget.tabItems,
                    indicatorColor: _indicatorColor,
                ),
            ),
            body: new PageView(
                controller: _pageController,
                children: _tabViews,
                onPageChanged: (index) {
                    _tabController.animateTo(index);
                    _onPageChanged?.call(index);
                },
            ),
        );
    }

    /// 获取底部tabBar
    _getBottomTabBar(BuildContext context) {
        return new Scaffold(
            drawer: _drawer,
            appBar: _title == null ? null : new AppBar(
                backgroundColor: Theme.of(context).primaryColor,
                title: _title,
            ),
            body: new TabBarView(
                controller: _tabController,
                children: _tabViews,
            ),
            bottomNavigationBar: new Material(
                color: Theme.of(context).primaryColor,
                child: new TabBar(
                    labelPadding: EdgeInsets.all(10.0),
                    controller: _tabController,
                    tabs: widget.tabItems,
                    indicatorColor: _indicatorColor, /// tab标签的下划线颜色
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                    ),
                    // unselectedLabelStyle: TextStyle(
                    //     fontWeight: FontWeight.normal,
                    // )
                ),
            ), /// 包一层Material适配主题, 实现风格套用
        );
    }
} 


class TarWidgetControl {
  List<Widget> footerButton = [];
}