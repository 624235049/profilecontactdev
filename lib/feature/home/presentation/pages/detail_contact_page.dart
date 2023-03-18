
import 'package:flutter/material.dart';
import 'package:profiledevtest/feature/home/domain/entities/user_entity.dart';
import 'package:profiledevtest/utils/app_theme.dart';


class DetailContactPage extends StatefulWidget {
  final UserEntity userEntity;
  const DetailContactPage({Key? key, required this.userEntity}) : super(key: key);

  @override
  State<DetailContactPage> createState() => _DetailContactPageState();
}

class _DetailContactPageState extends State<DetailContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.mainAppColor,
        title: Center(child: const Text('ข้อมูลผู้ติดต่อ')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          CircleAvatar(
            backgroundImage: NetworkImage(widget.userEntity.picture),
            radius: 50,
          ),
          const SizedBox(height: 20),
          Text(
            '${widget.userEntity.firstName} ${widget.userEntity.lastName}',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.phone),
            title: Text(widget.userEntity.phone),
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: Text(widget.userEntity.email),
          ),
        ],
      ),
    );
  }
}
