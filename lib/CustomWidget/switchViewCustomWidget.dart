import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.blue[700],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildOption("Liste des produits", !isSwitched),
          Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
            },
            activeTrackColor: Colors.blue[700],
            activeColor: Colors.blue[900],
            inactiveThumbColor: Colors.blue[900],
            inactiveTrackColor: Colors.blue[700],
          ),
          _buildOption("Liste des mouvements", isSwitched),
        ],
      ),
    );
  }

  Widget _buildOption(String title, bool isActive) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        decoration: isActive
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.blue[900],
              )
            : null,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
