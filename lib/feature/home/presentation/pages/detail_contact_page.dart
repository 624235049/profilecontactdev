
import 'package:flutter/material.dart';
import 'package:profiledevtest/feature/home/domain/entities/user_entity.dart';
import 'package:profiledevtest/utils/app_theme.dart';
import 'package:profiledevtest/utils/dimension.dart';


class DetailContactPage extends StatefulWidget {
  final UserEntity userEntity;
  const DetailContactPage({Key? key, required this.userEntity}) : super(key: key);

  @override
  State<DetailContactPage> createState() => _DetailContactPageState();
}



class _DetailContactPageState extends State<DetailContactPage> {

  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.mainAppColor,
        title: const Text('ข้อมูลผู้ติดต่อ',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           SizedBox(height: Dimensions.height30(context)),
          CircleAvatar(
            backgroundImage: NetworkImage(widget.userEntity.picture),
            radius: Dimensions.radius(context, 50),
          ),
           SizedBox(height: Dimensions.height20(context)),
          Text(
            '${widget.userEntity.firstName} ${widget.userEntity.lastName}',
            style:  TextStyle(
              fontSize: Dimensions().fontSize(context, 35),
              fontWeight: FontWeight.bold,
            ),
          ),
           SizedBox(height: Dimensions.height20(context)),
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
