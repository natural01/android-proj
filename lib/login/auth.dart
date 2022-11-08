import 'package:data_bases_project/login/services/authServ.dart';
import 'package:data_bases_project/login/userWidget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthorizationWidget extends StatefulWidget {
  const AuthorizationWidget({super.key});

  @override
  State<AuthorizationWidget> createState() => _AuthorizationWidgetState();
}

class _AuthorizationWidgetState extends State<AuthorizationWidget> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _email = '';
  String _password = '';
  bool showLogin = true;

  AuthSevrice _authService = AuthSevrice();

  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return const Padding(
        padding: EdgeInsets.only(top: 100),
        child: Align(
          child: Text(
            'Traveller',
            style: TextStyle(
                fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      );
    }

    Widget _input(Icon icon, String hint, TextEditingController controller,
        bool obscure) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          controller: controller,
          obscureText: obscure,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
          decoration: InputDecoration(
              hintText: hint,
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 3)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54, width: 1)),
              prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: IconTheme(
                    data: const IconThemeData(color: Colors.white),
                    child: icon,
                  )),
              hintStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white)),
        ),
      );
    }

    Widget _button(String text, void func()) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: const Color(0xff3A4A66),
          ),
        ),
        onPressed: () {
          func();
        },
      );
    }

    Widget _form(String label, void func()) {
      return Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 10),
              child: _input(
                const Icon(Icons.email),
                "Email",
                _emailController,
                false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: _input(const Icon(Icons.lock), "Password",
                  _passwordController, true),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: _button(label, func),
              ),
            )
          ],
        ),
      );
    }

    void _loginButtonAction() async {
      _email = _emailController.text;
      _password = _passwordController.text;

      if (_email.isEmpty || _password.isEmpty) return;

      UserWidget? user = await _authService.signInWithEmailAndPassword(
          _email.trim(), _password.trim());
      if (user == null) {
        Fluttertoast.showToast(
            msg: "Can't SignIn you! Please check your email/password",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        _emailController.clear();
        _passwordController.clear();
      }
    }

    void _registerButtonAction() async {
      _email = _emailController.text;
      _password = _passwordController.text;

      if (_email.isEmpty || _password.isEmpty) return;

      UserWidget? user = await _authService.registerWithEmailAndPassword(
          _email.trim(), _password.trim());
      if (user == null) {
        Fluttertoast.showToast(
            msg: "Can't Register you! Please check your email/password",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        _emailController.clear();
        _passwordController.clear();
      }
    }

    Widget _bottomWave() {
      return Expanded(
        child: Align(
          child: ClipPath(
            child: Container(
              color: Colors.white,
              height: 300,
            ),
            clipper: BottomWaveClipper(),
          ),
          alignment: Alignment.bottomCenter,
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xff3A4A66),
      body: Column(
        children: [
          _logo(),
          const SizedBox(
            height: 100,
          ),
          (showLogin
              ? Column(
                  children: [
                    _form('LOGIN', _loginButtonAction),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                        child: const Text('Not regigstered yet? Register',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        onTap: () {
                          setState(
                            () {
                              showLogin = false;
                            },
                          );
                        },
                      ),
                    )
                  ],
                )
              : Column(
                  children: [
                    _form('REGISTER', _registerButtonAction),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                        child: const Text('Already regigstered? Login',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        onTap: () {
                          setState(
                            () {
                              showLogin = true;
                            },
                          );
                        },
                      ),
                    )
                  ],
                )),
          _bottomWave()
        ],
      ),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, size.height + 5);
    var secondControlPoint = Offset(size.width - (size.width / 6), size.height);
    var secondEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
