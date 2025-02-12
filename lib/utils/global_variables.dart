import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_tutorial/screens/add_post_screen.dart';
import 'package:instagram_clone_tutorial/screens/feed_screen.dart';
import 'package:instagram_clone_tutorial/screens/profile_screen.dart';
import 'package:instagram_clone_tutorial/screens/search_screen.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  const FeedScreen(),
  const SearchScreen(),
 const AddPostScreen(),
  const Text('favorite'),
  ProfileScreen(uid:FirebaseAuth.instance.currentUser!.uid)
];
