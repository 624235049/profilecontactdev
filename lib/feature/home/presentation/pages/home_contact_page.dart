import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profiledevtest/feature/home/cubit/profile_cubit.dart';

import '../../../../utils/app_theme.dart';
import 'detail_contact_page.dart';

class HomeContactPage extends StatefulWidget {
  const HomeContactPage({Key? key}) : super(key: key);

  @override
  State<HomeContactPage> createState() => _HomeContactPagrState();
}

class _HomeContactPagrState extends State<HomeContactPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, profileState) {
        if (profileState is ProfileFailure) {
          return const Scaffold(
            body: Center(
              child: Text(
                  "An error occurred, the profilee page could not be displayed."),
            ),
          );
        }

        if (profileState is ProfileLoading) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20,
                  ),
                  Text("please wait..."),
                ],
              ),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppTheme.mainAppColor,
            title: const Center(
              child: Text("รายชื่อผู้ติดต่อ"),
            ),
          ),
          body: Column(
            children: [
              if (profileState is ProfileLoaded)
                Expanded(
                  child: ListView.builder(
                    itemCount: profileState.users.length,
                    itemBuilder: (context, index) {
                      final profile = profileState.users[index];
                      return ListTile(
                        leading: CircleAvatar(
                            backgroundImage: NetworkImage(profile.picture)),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${profile.firstName} ${profile.lastName}'),
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(' ${profile.email} '),
                            Text(' ${profile.phone} '),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailContactPage(
                                      userEntity: profile,
                                    )),
                          );
                        },
                      );
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
