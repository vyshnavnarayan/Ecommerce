import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce1/profile/repository/profile_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final _auth = FirebaseAuth.instance;
  final CollectionReference profileRef =
      FirebaseFirestore.instance.collection('sellercollection');

  // Future<void> getImage() async {
  //   final imagePicker = ImagePicker();
  //   final image = await imagePicker.pickImage(source: ImageSource.gallery);
  //   await ManageProfile().updateProfile(image!);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: profileRef.doc(_auth.currentUser!.uid).get(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                final profileData = snapshot.data!;
                return Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            child: profileData['profile_photo'] == ''
                                ? Text(profileData['username'][0].toString(),
                                    style: TextStyle(fontSize: 50))
                                : ClipOval(
                                    child: Image.network(
                                      profileData['profile_photo'].toString(),
                                      fit: BoxFit.cover,
                                      width: 200,
                                    ),
                                  ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(profileData['email'].toString()),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Details'),
                    ListTile(
                      title: Text(profileData['username'].toString()),
                    ),
                    ListTile(
                      title: Text('Personal Informations'),
                    ),
                    ListTile(
                      title: Text(profileData['phone'].toString()),
                    ),
                    ListTile(
                      title: Text('Change Password'),
                    ),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: Text('Logout')),
                    )
                  ],
                );
              }else{
                return CircularProgressIndicator();
              }
            }));
  }
}
