import 'package:e_book/constants/colors.dart';
import 'package:e_book/widgets/app_tabs.dart';
import 'package:e_book/widgets/my_tab_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
            child: Scaffold(
      body: Column(children: [
        Container(
          margin: EdgeInsets.only(left: 8, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.menu),
              Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.notifications)
                ],
              )
            ],
          ),
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 8, top: 8),
              child: Text(
                'Popular Book',
                style: TextStyle(fontSize: 38),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 180,
          child: Stack(children: [
            Positioned(
              top: 0,
              left: -20,
              right: 0,
              child: Container(
                height: 180,
                child: PageView.builder(
                    controller: PageController(viewportFraction: 0.8),
                    itemCount: 5,
                    itemBuilder: (_, i) {
                      return Container(
                        height: 180,
                        width: MediaQuery.sizeOf(context).width,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/img/book_flutter.jpg',
                              ),
                            )),
                      );
                    }),
              ),
            ),
          ]),
        ),
        Expanded(
            child: NestedScrollView(
              controller: _scrollController,
              
                headerSliverBuilder: (context, issCroll) {
                  return [
                    SliverAppBar(
                      pinned: true,
                      backgroundColor: backgroundSliver,
                      bottom: PreferredSize(preferredSize: Size.fromHeight(50),
                       child: Container(
                        margin: EdgeInsets.only(bottom: 20,left: 10),
                        child: TabBar(
                          indicatorPadding: EdgeInsets.all(10),
                          indicatorSize: TabBarIndicatorSize.label,
                          controller: _tabController,
                          isScrollable: true,
                          labelPadding: EdgeInsets.only(left: 10,right: 5),
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(color: Colors.grey.withOpacity(0.2),
                              blurRadius: 0.7,
                              offset: Offset(0, 0))
                            ]
                          ), tabs: [
                           AppTabs(color: menu1Color, text : 'new') ,       
                           AppTabs(color: menu2Color, text: 'Popular') ,
                           AppTabs(color: menu3Color, text: 'Trand')],
                        ),
                       )),
                    )
                  ];
                },
                body: TabBarView(controller: _tabController, children: [
                  MyTabView()
                ],)))
      ]),
    )));
  }
}
