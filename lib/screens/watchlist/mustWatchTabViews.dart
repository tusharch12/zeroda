import 'package:flutter/material.dart';

class MustWatchTabContent extends StatefulWidget {
  final String title;
  const MustWatchTabContent({super.key, required this.title});

  @override
  State<MustWatchTabContent> createState() => _MustWatchTabContentState();
}

class _MustWatchTabContentState extends State<MustWatchTabContent> {
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
          Text("ASHOKLEY"),
          Text(
            "0.00",
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
      subtitle: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("NSE", style: TextStyle(color: Colors.grey)),
          Text(
            "0.00 (0.00%)",
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
              margin: const EdgeInsets.only(top: 20), // Removed margin to avoid gap
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
              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10), // Adjust margin to remove extra gap
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
