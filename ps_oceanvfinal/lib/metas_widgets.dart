import 'package:flutter/material.dart';
import 'package:ps_ocean/meta_item.dart';

class MetasWidget extends StatelessWidget {
  final Metas metas;
  final Animation animation;
  final VoidCallback onClicked;

  const MetasWidget({
    @required this.metas,
    @required this.animation,
    @required this.onClicked,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ScaleTransition(
        scale: animation,
        child: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            leading: CircleAvatar(
                radius: 32,
                backgroundImage: Image.asset('assets/goal14.png').image),
            title: Text(metas.titulo, style: TextStyle(fontSize: 20)),
            trailing: IconButton(
              icon: Icon(Icons.check_circle, color: Colors.green, size: 32),
              onPressed: onClicked,
            ),
          ),
        ),
      );
}
