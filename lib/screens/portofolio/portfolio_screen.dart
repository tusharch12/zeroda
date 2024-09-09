import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zeroda/screens/portofolio/holdingTabView.dart';
import 'package:zeroda/screens/portofolio/positionTabView.dart';

class Portfolio extends ConsumerStatefulWidget {
  const Portfolio({super.key});

  @override
  ConsumerState<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends ConsumerState<Portfolio> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
                  'Portfolio',
                  style: TextStyle(fontSize: 30),
                ),
                flexibleSpace: const FlexibleSpaceBar(
                  centerTitle: false,
                  titlePadding: EdgeInsets.all(0),
                  collapseMode: CollapseMode.pin,
                ),
                bottom:  PreferredSize(
                  preferredSize: Size.fromHeight(48.0), // Adjusted height
                  child: TabBar(
                    padding: EdgeInsets.zero, // Remove extra padding
                    labelPadding: EdgeInsets.symmetric(horizontal: 16.0), // Add some padding for better look
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorPadding: EdgeInsets.zero,
                    tabs: [
                      Tab(  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [// Space between icon and text
                      Text("Holding"),
                       SizedBox(width: 8),
                        Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(50), // Half of width/height
                        ),
                        child: Center(child: Text("10",style: TextStyle(color: Colors.white),),)),
                    ],
                  ),
                ),
                      Tab(text: "Positions"),
                    ],
                    
                    indicatorColor: Colors.blue, // Indicator color
                    labelColor: Colors.blue, // Selected label color
                    unselectedLabelColor: Colors.black, // Unselected label color
                  ),
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              // Content for each tab
              HoldingTabContent(title: 'Holding'),
           PositionTabContent(title: 'Positions'),
            ],
          ),
        ),
      ),
    );
  }
}

