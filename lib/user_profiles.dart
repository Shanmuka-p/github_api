import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:github_api/repos.dart';
import 'package:github_api/user_models.dart';
import 'package:http/http.dart' as http;

class UserProfiles extends StatefulWidget {
  final String username;
  const UserProfiles({super.key, required this.username});

  @override
  State<UserProfiles> createState() => _UserProfilesState();
}

class _UserProfilesState extends State<UserProfiles> {
  Map<String, dynamic>? userData;
  repos? repo;
  bool isloading = false;
  UserModels? userModel;

  void fetchUserProfile() async {
    setState(() {
      isloading = true;
    });

    try {
      final res = await http.get(
        Uri.parse("https://api.github.com/users/${widget.username}"),
        
      );
      final repon = await http.get(Uri.parse("https://api.github.com/users/${widget.username}/repos"));
      if (res.statusCode == 200) {
        userModel = UserModels.fromJson(jsonDecode(res.body));
        repo = repos.fromJson(jsonDecode(repon.body));
      } else {
        throw Exception("Failed to load user profile");
      }
    } catch (e) {
      throw Exception('Failed to load user profile: $e');
    } finally {
      setState(() {
        isloading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Github Profile")),
      body: Column(
        children: [
          Center(
            child: isloading
                ? CircularProgressIndicator()
                : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(                
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              
                              radius: 80,
                              foregroundImage: NetworkImage(userModel?.avatarUrl ?? ''),
                            ),
                            SizedBox(width: 30,),
                            Text("Followers\n${userModel?.followers}",style: TextStyle(fontSize: 15),),
                            
                            SizedBox(width: 18,),
                            Text("Following\n${userModel?.following}",style: TextStyle(fontSize: 15),)
                          ],
                        ),
                        //SizedBox(height: 20,),
                        Text(userModel?.name ?? '',style: TextStyle(fontSize: 15),),
                        //Text("${repo?.defaultBranch}"),
                      ],
                    ),
                ),
          ),
        ],
      ),
    );
  }
}
