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
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
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
        padding: EdgeInsets.only(bottom: 8, right: 8),
        child: Icon(
          _isSelected ? Icons.favorite : Icons.favorite_border_outlined,
          color: _isSelected ? Colors.red : Colors.white,
        ),
      ),
    );
  }
}
