import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({super.key});

  @override
  ConsumerState<Profile> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'Profile',
                  style: TextStyle(fontSize: 30),
                ),
                flexibleSpace: const FlexibleSpaceBar(
                  centerTitle: false,
                  titlePadding: EdgeInsets.all(0),
                  collapseMode: CollapseMode.pin,
                ),
                bottom:  PreferredSize(
                  preferredSize: const Size.fromHeight(30.0), // Adjusted height
                  child: Container(
margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Aditya Vyas",style:TextStyle(fontSize: 21, color: Colors.black54) ,),
                       Icon(Icons.notifications)
                      ],
                    ),
                  )
                ),
              ),
            ];
          },
          body:const ProfileContent(title: "Profile",)
        ),
      ); // Replace with your actual widget content
  }
}




class ProfileContent extends StatefulWidget {
  final String title;
  const ProfileContent({super.key, required this.title});

  @override
  State<ProfileContent> createState() => _PortfolioTabContentState();
}

class _PortfolioTabContentState extends State<ProfileContent> {
  List<Widget> widgetList = [];

  // Sample dynamic list of stocks with "NSE", "INDICES", "BSE" as index values


  @override
  void initState() {
    appendInList();
    super.initState();
  }

  void appendInList() {
    // Add Searchbar to widgetList
    widgetList.add(Searchbar());
    widgetList.add(bodyContent());

  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero, 
      itemCount: widgetList.length,
      itemBuilder: (context, index) {
        return widgetList[index];
      },
    );
  }

  Widget Searchbar() => Container(
        color: Colors.grey[300],
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20), // Removed margin to avoid gap
              height: 40,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
            ),
            // Container(
            //   height: 50,
            //   margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10), // Adjust margin to remove extra gap
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.grey.withOpacity(0.3), // Shadow color
            //         spreadRadius: 2, // Spread radius
            //         blurRadius: 5, // Blur radius
            //         offset: const Offset(0, 2), // Changes position of shadow
            //       ),
            //     ],
            //   ),
            //   child: const Center(
            //     child: ListTile(
            //       leading: Icon(
            //         Icons.search,
            //         color: Colors.grey,
            //       ),
            //       title: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text(
            //             "Search and add ",
            //             style: TextStyle(color: Colors.grey),
            //           ),
            //           Text("20/100", style: TextStyle(color: Colors.grey))
            //         ],
            //       ),
            //       trailing: Icon(Icons.filter_list_outlined),
            //     ),
            //   ),
            // ),
          ],
        ),
      );
}

Widget bodyContent()=>Container(
  // margin: EdgeInsets.symmetric(horizontal: 14),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const ListTile(title: Text("Account",style: TextStyle(color: Colors.black87,fontSize: 16,fontWeight: FontWeight.bold),)),
      const Divider(),
      cardList('Funds', Icons.currency_rupee),

    const Divider(),  
    cardList('App Code',Icons.lock_open),
    const Divider(),  
    cardList('Profile',Icons.person_2_outlined),
    const Divider(),  
    cardList('Setting',Icons.settings),
    const Divider(),  
    cardList('Connected apps',Icons.align_horizontal_center),
    const Divider(),  
    cardList('Logout',Icons.logout_outlined),
     const Divider(), 

    const SizedBox(height: 20,),

    const ListTile(title: Text("Support",style: TextStyle(color: Colors.black87,fontSize: 16,fontWeight: FontWeight.bold),)),
    

            const Divider(),  
    cardList('Support portal',Icons.support_rounded),
    const Divider(),  
    cardList('User manual',Icons.contact_support_outlined),
       const Divider(),  
    cardList('Contact',Icons.phone),
    const Divider(),

     const SizedBox(height: 20,),

    const ListTile(title: Text("Others",style: TextStyle(color: Colors.black87,fontSize: 16,fontWeight: FontWeight.bold),)),
    

            const Divider(),  
    cardList('Invite friends',Icons.person_add_alt_1),
    const Divider(),  
    cardList('Licenses',Icons.document_scanner_outlined),
       const Divider(),  
    const ListTile(
      title: Text('version 3.7.0b214',style: TextStyle(color:Colors.grey),),
    )
    ],
  ),
);


Widget cardList(String title,IconData icon)=>ListTile(
  title: Text(title,),
  trailing: Icon(icon,color: Colors.grey,),
);