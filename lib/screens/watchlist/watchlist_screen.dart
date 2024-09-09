import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zeroda/screens/watchlist/favoritesTabViews.dart';
import 'package:zeroda/screens/watchlist/lowPriorityTabViews.dart';
import 'package:zeroda/screens/watchlist/mustWatchTabViews.dart';
import 'package:zeroda/screens/watchlist/myListTabViews.dart';
import 'package:zeroda/screens/watchlist/passiveTabView.dart';
import 'package:zeroda/screens/watchlist/randomTaBViews.dart';

class WatchList extends ConsumerStatefulWidget {
  const WatchList({super.key});

  @override
  ConsumerState<WatchList> createState() => _PortfolioState();
}

class _PortfolioState extends ConsumerState<WatchList> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                floating: true,
                backgroundColor: Colors.grey[300],
                expandedHeight: 100,
                elevation: 0,
                pinned: true,
                title: const Text(
                  'WishList',
                  style: TextStyle(fontSize: 30),
                ),
                flexibleSpace: const FlexibleSpaceBar(
                  centerTitle: false,
                  titlePadding: EdgeInsets.all(0),
                  collapseMode: CollapseMode.pin,
                ),
                bottom: const PreferredSize(
                  preferredSize: Size.fromHeight(48.0), // Adjusted height
                  child: TabBar(
                    padding: EdgeInsets.zero, // Remove extra padding
                    labelPadding: EdgeInsets.symmetric(horizontal: 16.0), // Add some padding for better look
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorPadding: EdgeInsets.zero,
                   isScrollable: true,

    tabs: [
                      Tab(text: "Favorites"),
                      Tab(text: "My list"),
                      Tab(text: "Must watch"),
                      Tab(text: "Random"),
                      Tab(text: "Passive"),
                      Tab(text: "Low Priority"),
                    ],
                    indicatorColor: Colors.blue, // Indicator color
                    labelColor: Colors.blue, // Selected label color
                    unselectedLabelColor: Colors.black, // Unselected label color
                  ),
                ),
              ),
            ];
          },
          body:const TabBarView(
              children: [
                // Content for each tab
              FavoriteTabContent(title: 'Favorites Content'),
              MyListTabContent(title: 'My List Content'),
              MustWatchTabContent(title: 'Must Watch Content'),
              RandomTabContent(title: 'Random Content'),
              PassiveTabContent(title: 'Passive Content'),
              LowPriorityTabContent(title: 'Low Priority Content'),
              ],
            ),
        ),
      ),
    );
  }
}

class WishListTabContent extends StatefulWidget {
  final String title;
  const WishListTabContent({super.key, required this.title});

  @override
  State<WishListTabContent> createState() => _PortfolioTabContentState();
}

class _PortfolioTabContentState extends State<WishListTabContent> {
  List<Widget> widgetList = [];

  @override
  void initState() {
    appendInList();
    super.initState();
  }

  void appendInList() {
    widgetList.add(
    Searchbar()
    );

    for (int i = 0; i < 20; i++) {
      widgetList.add(
        Column(
  children: [
    ListTile(
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("SENSEX"),
          Text(
            "61,084.65",
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
      subtitle: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("INDEX", style: TextStyle(color: Colors.grey)),
          Text(
            "-345 (-0.57%)",
            style: TextStyle(color: Colors.black54),
          ),
        ],
      ),
      onTap: () {
        // Handle item tap
      },
    ),
    const Divider(color: Colors.grey,thickness: 0.5, ), // Add this line for a bottom line
  ],
)
,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero, // Remove padding from ListView
      itemCount: widgetList.length,
      itemBuilder: (context, index) {
        return widgetList[index];
      },
    );
  }


  Widget Searchbar()=>
    Container(
        color: Colors.grey[300],
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 15), // Removed margin to avoid gap
              height: 50,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 10), // Adjust margin to remove extra gap
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3), // Shadow color
                    spreadRadius: 2, // Spread radius
                    blurRadius: 5, // Blur radius
                    offset: const Offset(0, 2), // Changes position of shadow
                  ),
                ],
              ),
              child: const Center(
                child: ListTile(
                  leading: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Search and add ",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text("20/100", style: TextStyle(color: Colors.grey))
                    ],
                  ),
                  trailing: Icon(Icons.filter_list_outlined),
                ),
              ),
            ),
          ],
        ),
      );
}
