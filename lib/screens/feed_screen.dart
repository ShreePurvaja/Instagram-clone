import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:instagram_clone_tutorial/utils/colors.dart";
import "package:instagram_clone_tutorial/utils/global_variables.dart";
import "package:instagram_clone_tutorial/widgets/post_card.dart";

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:  width > webScreenSize? webBackgroundColor : mobileBackgroundColor,
      appBar: width > webScreenSize? null:
        AppBar(
        backgroundColor: mobileBackgroundColor,
        title: SvgPicture.asset(
          'assets/ic_instagram.svg',
          colorFilter: const ColorFilter.mode(
            primaryColor,
            BlendMode.srcIn,
          ),
          height: 32,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.message_outlined))
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return  ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder:(context,index) => Container(
              margin:EdgeInsets.symmetric(
                horizontal: width > webScreenSize ? width*0.3 : 0,
              vertical: width > webScreenSize ? 15 : 0
            ),
              child: PostCard(
                 snap:snapshot.data!.docs[index].data(),
              ),
            ));
           
        },
      ),
    );
  }
}
