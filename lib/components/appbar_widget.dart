import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final String rota;
  final String titulo;
  final bool logout;
  final dynamic arguments;

  const AppBarWidget({super.key, required this.titulo, this.logout = false, required this.rota, this.arguments});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 75,75,75),
      title: Text(
        widget.titulo,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 24, color: Colors.white),
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: IconButton(
        key: const Key("appbarButton"),
        onPressed: widget.logout
            ? signUserOut
            : () => widget.rota == '/home_prof' || widget.rota == '/home_aluno'
                ? Navigator.pushNamed(context, '/auth_page')
                : Navigator.pushNamed(
                    context,
                    widget.rota,
                    arguments: widget.arguments,
                  ),
        icon: Icon(widget.logout ? Icons.logout : Icons.arrow_back, color: Colors.white),
      ),
    );
  }
}
