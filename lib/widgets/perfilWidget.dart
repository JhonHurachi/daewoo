import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rich_alert/rich_alert.dart';

class PerfilWidget extends StatefulWidget {
  @override
  _PerfilWidgetState createState() => _PerfilWidgetState();
}

class _PerfilWidgetState extends State<PerfilWidget> {

  Future<void> _currentUser;

  @override
  initState() {
    super.initState();
    _currentUser = getUser();
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final String _bio =
      "\"Hi, I am a Freelance developer working for hourly basis. If you wants to contact me to build your product leave a message.\"";
  final String _followers = "173";
  final String _posts = "24";
  final String _scores = "450";

  Widget _buildCoverImage(Size screenSize) {
    return Container(
      height: screenSize.height / 2.6,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/fondo.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProfileImage(usuario) {
    print(usuario);
    return Center(
      child: Container(
        width: 140.0,
        height: 140.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(usuario.photoUrl),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(80.0),
          border: Border.all(
            color: Colors.white,
            width: 10.0,
          ),
        ),
      ),
    );
  }

  Widget _buildStatus(BuildContext context, usuario) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        usuario.displayName,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String count) {
    TextStyle _statLabelTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.w200,
    );

    TextStyle _statCountTextStyle = TextStyle(
      color: Colors.black54,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          count,
          style: _statCountTextStyle,
        ),
        Text(
          label,
          style: _statLabelTextStyle,
        ),
      ],
    );
  }

  Widget _buildStatContainer() {
    return Container(
      height: 60.0,
      margin: EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        color: Color(0xFFEFF4F7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildStatItem("Favoritos", _followers),
          _buildStatItem("Ingresos", _posts),
          _buildStatItem("Vistos", _scores),
        ],
      ),
    );
  }

  Widget _buildBio(BuildContext context) {
    TextStyle bioTextStyle = TextStyle(
      fontFamily: 'Spectral',
      fontWeight: FontWeight.w400,//try changing weight to w500 if not thin
      fontStyle: FontStyle.italic,
      color: Color(0xFF799497),
      fontSize: 16.0,
    );

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.all(8.0),
      child: Text(
        _bio,
        textAlign: TextAlign.center,
        style: bioTextStyle,
      ),
    );
  }

  Widget _buildSeparator(Size screenSize) {
    return Container(
      width: screenSize.width / 1.6,
      height: 2.0,
      color: Colors.black54,
      margin: EdgeInsets.only(top: 4.0),
    );
  }

  Widget _buildGetInTouch(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.0),
      child: Column( children: <Widget>[
        Text(
          "Soporte",
          style: TextStyle(fontFamily: 'Roboto', fontSize: 16.0),
        ),
        Text(
          "support@daewoo.com",
          style: TextStyle(fontFamily: 'Roboto', fontSize: 14.0, fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 30),
        Text(
          "Página Web",
          style: TextStyle(fontFamily: 'Roboto', fontSize: 16.0),
        ),
        Text(
          "https://www.dwe.com.pe/",
          style: TextStyle(fontFamily: 'Roboto', fontSize: 14.0, fontWeight: FontWeight.normal),
        ),
      ],),
      // child: Text(
      //   "Soporte",
      //   style: TextStyle(fontFamily: 'Roboto', fontSize: 16.0),
      // ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        color: Colors.red,
                        textColor: Colors.white,
                        child: Text(
                          "Cerrar Sesión",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 32.0,
                        ),
                        onPressed: () => _signOut(context),
                      ),
            // child: InkWell(
            //   onTap: () => _signOut(context),
            //   child: Container(
            //     height: 40.0,
            //     decoration: BoxDecoration(
            //       border: Border.all(),
            //       color: Color(0xFF404A5C),
            //     ),
            //     child: Center(
            //       child: Text(
            //         "Cerrar Sesión",
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontWeight: FontWeight.w600,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        color: Colors.white,
                        textColor: Colors.blueGrey,
                        child: Text(
                          "Cerrar Cuenta",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 32.0,
                        ),
                        onPressed: () => _closeAccount(context),
                      ),
            // child: InkWell(
            //   onTap: () => _closeAccount(context),
            //   child: Container(
            //     height: 40.0,
            //     decoration: BoxDecoration(
            //       border: Border.all(),
            //     ),
            //     child: Center(
            //       child: Padding(
            //         padding: EdgeInsets.all(10.0),
            //         child: Text(
            //           "Cerrar Cuenta",
            //           style: TextStyle(fontWeight: FontWeight.w600),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Stack(
        children: <Widget>[
          _buildCoverImage(screenSize),
          SafeArea(
            child: SingleChildScrollView(
              child: FutureBuilder(
                  future: _currentUser,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                  return Column(
                children: <Widget>[
                  SizedBox(height: screenSize.height / 6.4),
                  _buildProfileImage(snapshot.data),
                  _buildStatus(context, snapshot.data),
                  _buildStatContainer(),
                  SizedBox(height: 10.0),
                  _buildGetInTouch(context),
                  SizedBox(height: 8.0),
                  _buildButtons(context),
                ],
              );
                    } else {
                      return Text('${snapshot.error}');
                    }
                    
                  },
                ) 
              
              ,
            ),
          ),
        ],
    );
  }

  _signOut(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return RichAlertDialog( //uses the custom alert dialog
          alertTitle: richTitle("Advertencia"),
          alertSubtitle: richSubtitle("¿Seguro que desea cerrar sesión?"),
          alertType: RichAlertType.WARNING,
          actions: <Widget>[
                    FlatButton(
                       child: Text('Aceptar', style: TextStyle(color: Colors.white)),
                      color: Colors.red, //specify background color for the button here
                      colorBrightness: Brightness
                          .dark, //specify the color brightness here, either `Brightness.dark` for darl and `Brightness.light` for light
                      disabledColor:
                          Colors.blueGrey, // specify color when the button is disabled
                      highlightColor: Colors
                          .red, //color when the button is being actively pressed, quickly fills the button and fades out after
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 5.0),
                       onPressed: () async {
                        await _firebaseAuth.signOut();
                        Navigator.popUntil(context, ModalRoute.withName('/'));
                       },
                    ),
                    FlatButton(
                       child: Text("Cancelar"),
                       onPressed: (){Navigator.pop(context);},
                    ),
                  ],     
        );
      }
    );
   }

   _closeAccount(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return RichAlertDialog( //uses the custom alert dialog
          alertTitle: richTitle("Advertencia"),
          alertSubtitle: richSubtitle("¿Seguro que desea eliminar su cuenta?"),
          alertType: RichAlertType.WARNING,
          actions: <Widget>[
                    FlatButton(
                       child: Text('Aceptar', style: TextStyle(color: Colors.white)),
                      color: Colors.red, //specify background color for the button here
                      colorBrightness: Brightness
                          .dark, //specify the color brightness here, either `Brightness.dark` for darl and `Brightness.light` for light
                      disabledColor:
                          Colors.blueGrey, // specify color when the button is disabled
                      highlightColor: Colors
                          .red, //color when the button is being actively pressed, quickly fills the button and fades out after
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 5.0),
                       onPressed: () async {
                        FirebaseUser user = await FirebaseAuth.instance.currentUser();
                        user.delete();
                        Navigator.popUntil(context, ModalRoute.withName('/'));
                       },
                    ),
                    FlatButton(
                       child: Text("Cancelar"),
                       onPressed: (){Navigator.pop(context);},
                    ),
                  ],     
        );
      }
    );
   }

   getUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user; 
  }
}
