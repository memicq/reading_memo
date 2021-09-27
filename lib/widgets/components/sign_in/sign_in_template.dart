import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:reading_memo/blocs/global/session_bloc.dart';
import 'package:reading_memo/resources/models/enums/login_type.dart';
import 'package:reading_memo/resources/models/session_state.dart';
import 'package:reading_memo/widgets/components/common/basic_app_bar.dart';
import 'package:reading_memo/widgets/screens/sign_in_screen.dart';

class SignInTemplate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignInTemplateState();
}

class SignInTemplateState extends State<SignInTemplate> {
  void _checkLoginStateAfterBuild(SessionBloc _session) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_session.currentState.shouldShowSignInScreen())
        SignInScreen.close(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    SessionBloc _session = SessionBloc();
    return StreamBuilder(
      stream: _session.currentStateStream,
      builder: (BuildContext context, AsyncSnapshot<SessionState> snapshot) {
        _checkLoginStateAfterBuild(_session);

        return Scaffold(
          appBar: BasicAppBar(title: "アカウント登録・ログイン"),
          body: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 150),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SignInButton(
                  Buttons.Google,
                  text: "Google でサインイン",
                  onPressed: () {
                    _session.signIn(LoginType.GOOGLE);
                  },
                ),
                // SignInButton(
                //   Buttons.Twitter,
                //   text: "Twitter でサインイン",
                //   onPressed: () {},
                // ),
                // SignInButton(
                //   Buttons.FacebookNew,
                //   text: "Facebook でサインイン",
                //   onPressed: () {},
                // ),
                SignInButton(
                  Buttons.AppleDark,
                  text: "Apple でサインイン",
                  onPressed: () {},
                ),
                SignInButton(
                  Buttons.Email,
                  text: "Email でサインイン",
                  onPressed: () {},
                ),
                TextButton(
                  child:
                      Text("匿名でサインイン", style: TextStyle(color: Colors.black)),
                  onPressed: () {},
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
