import 'package:flutter/material.dart';
import 'package:oru_mobiles/core/helpers/scaffold_helper.dart';
import 'package:oru_mobiles/core/helpers/user_helper.dart';
import 'package:oru_mobiles/features/auth/presentation/widgets/login_widget.dart';

class FavouriteIcon extends StatefulWidget {
  final Function(bool?) onChanged;
  const FavouriteIcon({super.key, required this.onChanged});

  @override
  State<FavouriteIcon> createState() => _FavouriteIconState();
}

class _FavouriteIconState extends State<FavouriteIcon> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        initialData: false,
        stream: UserAuthStream.getUserAuthStream(),
        builder: (context, snapshot) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _isSelected = !(_isSelected && snapshot.data == true);
                widget.onChanged(_isSelected);
              });

              if (_isSelected == true && UserHelper.getIsloggedIn() == false) {
                ScaffoldHelper.showBottomSheet(
                  context: context,
                  child: const LoginWidget(
                    loginWidgetType: LoginWidgetType.bottomSheet,
                  ),
                  title: 'Sign in to continue',
                ).then((value) => setState(() {
                      _isSelected = value ?? true;
                    }));
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8, right: 8),
              child: Icon(
                (_isSelected && snapshot.data == true)
                    ? Icons.favorite
                    : Icons.favorite_border_outlined,
                color: (_isSelected && snapshot.data == true)
                    ? Colors.red
                    : Colors.white,
              ),
            ),
          );
        });
  }
}
