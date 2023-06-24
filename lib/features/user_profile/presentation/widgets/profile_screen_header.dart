import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quote_generator/features/user_profile/user_profile.dart';

class ProfileScreenHeader extends StatelessWidget {
  const ProfileScreenHeader({super.key, required this.user});

  final AppUser user;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Container(
      height: deviceSize.height * 0.5,
      width: deviceSize.width,
      color: Colors.green.shade100,
      child: AspectRatio(
        aspectRatio: 9 / 16,
        child: user.profileImage == ''
            ? const FaIcon(FontAwesomeIcons.user)
            : DisplayUserImage(
                imageUrl: user.profileImage,
                isCircleAvatar: false,
              ),
      ),
    );
  }
}
