import 'package:flags_app/core/redux/action_mapper.dart';
import 'package:flags_app/core/redux/actions/authentication_action.dart';
import 'package:flags_app/core/redux/actions/navigation_action.dart';
import 'package:flags_app/core/router/navigation_destination.dart';
import 'package:flags_app/ui/components/circle_name.dart';
import 'package:flags_app/ui/components/user_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulActionMapper {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () => widget.dispatch(
              ShowDialogAction(
                destination: InfoDialogDestination(
                  title: 'Keluar',
                  message: 'apakah Anda yakin ingin keluar?',
                  onTap: () => widget.dispatch(
                    const LogoutAction(),
                  ),
                ),
              ),
            ),
            icon: const Icon(
              Icons.exit_to_app,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: UserWidget(builder: (context, user) {
          return ListView(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
            children: [
              CircleName(
                name: user.fullName,
                size: 65,
                fontSize: 24,
              ),
              _ProfileItem(
                title: 'ID',
                data: user.id,
                margin: const EdgeInsets.only(top: 30),
              ),
              const Divider(
                height: 30,
              ),
              _ProfileItem(
                title: 'Nama',
                data: user.fullName,
              ),
              const Divider(
                height: 30,
              ),
              _ProfileItem(
                title: 'Email',
                data: user.email,
              ),
            ],
          );
        }),
      ),
    );
  }
}

class _ProfileItem extends StatelessWidget {
  const _ProfileItem({
    required this.title,
    required this.data,
    this.margin,
  });

  final String title;
  final String data;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Row(
        children: [
          Text(title),
          const SizedBox(width: 20),
          Expanded(
            child: SelectableText(
              data,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
