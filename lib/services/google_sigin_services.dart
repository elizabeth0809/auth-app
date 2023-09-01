import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
class GoogleSignInService{
  static GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email'
    ]
  );
  static Future<GoogleSignInAccount?> signInWithGoogle() async{
    try{
    final account =  await _googleSignIn.signIn();
    final googleKey = await account!.authentication;
/*     print('============= id Token: ');
    print(googleKey.idToken);
   print(account);*/
    final signInWithGoogleEndpoint = Uri(
      scheme: 'https',
      host: 'suave-slash-buckthorn.glitch.me',
      path: '/google'
    );
    final session = await http.post(
      signInWithGoogleEndpoint,
      body: {
        'token' : googleKey.idToken
      }
      );
      print('====backend===');
      print(session.body);
    return account;
    }catch(e){
      print('error en gogle');
      print(e);
      return null;
     }
  }
  static Future signOut() async{
    await _googleSignIn.signOut();
  }
}