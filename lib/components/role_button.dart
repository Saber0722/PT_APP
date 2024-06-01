import 'package:flutter/material.dart';


class RoleButton extends StatelessWidget {
  final String roleName;
  final VoidCallback onTap;

  const RoleButton({required this.roleName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(color: Colors.blue),
        child: Text(
          roleName,
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
      ),
    );
  }
}