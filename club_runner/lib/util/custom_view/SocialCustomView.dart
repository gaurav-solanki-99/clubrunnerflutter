// // import 'package:authapp/pages/database.dart';
// // import 'package:authapp/pages/home.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:the_apple_sign_in/scope.dart';
// import 'package:the_apple_sign_in/the_apple_sign_in.dart';
//
// class AuthMethods {
//   final FirebaseAuth auth = FirebaseAuth.instance;
//
//   getCurrentUser() async {
//     return await auth.currentUser;
//   }
//
//   // signInWithGoogle(BuildContext context) async {
//   //   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   //   final GoogleSignIn googleSignIn = GoogleSignIn();
//   //
//   //   final GoogleSignInAccount? googleSignInAccount =
//   //   await googleSignIn.signIn();
//   //
//   //   final GoogleSignInAuthentication? googleSignInAuthentication =
//   //   await googleSignInAccount?.authentication;
//   //
//   //   final AuthCredential credential = GoogleAuthProvider.credential(
//   //       idToken: googleSignInAuthentication?.idToken,
//   //       accessToken: googleSignInAuthentication?.accessToken);
//   //
//   //   UserCredential result = await firebaseAuth.signInWithCredential(credential);
//   //
//   //   User? userDetails = result.user;
//   //
//   //   if (result != null) {
//   //     Map<String, dynamic> userInfoMap = {
//   //       "email": userDetails!.email,
//   //       "name": userDetails.displayName,
//   //       "imgUrl": userDetails.photoURL,
//   //       "id": userDetails.uid,
//   //     };
//   //     DatabaseMethods().addUser(userDetails.uid, userInfoMap).then((value) {
//   //       Navigator.push(
//   //           context, MaterialPageRoute(builder: (context) => Home()));
//   //     });
//   //   }
//   // }
//
//   Future<User> signInWithApple({List<Scope> scopes = const []}) async {
//     final result = await TheAppleSignIn.performRequests(
//         [AppleIdRequest(requestedScopes: scopes)]);
//
//     switch (result.status) {
//       case AuthorizationStatus.authorized:
//         final AppleIdCredential = result.credential!;
//         final oAuthProvider = OAuthProvider('apple.com');
//         final credential = oAuthProvider.credential(
//             idToken: String.fromCharCodes(AppleIdCredential.identityToken!));
//         final UserCredential = await auth.signInWithCredential(credential);
//         final firebaseUser = UserCredential.user!;
//         if (scopes.contains(Scope.fullName)) {
//           final fullName = AppleIdCredential.fullName;
//           if (fullName != null &&
//               fullName.givenName != null &&
//               fullName.familyName != null) {
//             final displayName = '${fullName.givenName} ${fullName.familyName}';
//             await firebaseUser.updateDisplayName(displayName);
//           }
//         }
//         return firebaseUser;
//       case AuthorizationStatus.error:
//         throw PlatformException(
//             code: 'ERROR_AUTHORIZATION_DENIED',
//             message: result.error.toString());
//
//       case AuthorizationStatus.cancelled:
//         throw PlatformException(
//             code: 'ERROR_ABORTED_BY_USER', message: 'Sign in aborted by user');
//
//       default:
//         throw UnimplementedError();
//     }
//   }
// }


import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:twitter_login/twitter_login.dart';

/// Generates a cryptographically secure random nonce, to be included in a
/// credential request.
String generateNonce([int length = 32]) {
  final charset =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
  final random = Random.secure();
  return List.generate(length, (_) => charset[random.nextInt(charset.length)])
      .join();
}

/// Returns the sha256 hash of [input] in hex notation.
String sha256ofString(String input) {
  final bytes = utf8.encode(input);
  final digest = sha256.convert(bytes);
  return digest.toString();
}

Future<UserCredential> signInWithApple() async {
  // To prevent replay attacks with the credential returned from Apple, we
  // include a nonce in the credential request. When signing in with
  // Firebase, the nonce in the id token returned by Apple, is expected to
  // match the sha256 hash of `rawNonce`.
  final rawNonce = generateNonce();
  final nonce = sha256ofString(rawNonce);

  // Request credential for the currently signed in Apple account.
  final appleCredential = await SignInWithApple.getAppleIDCredential(
    scopes: [
      AppleIDAuthorizationScopes.email,
      AppleIDAuthorizationScopes.fullName,
    ],
    nonce: nonce,
  );

  // Create an `OAuthCredential` from the credential returned by Apple.
  final oauthCredential = OAuthProvider("apple.com").credential(
    idToken: appleCredential.identityToken,
    rawNonce: rawNonce,
  );

  // Sign in the user with Firebase. If the nonce we generated earlier does
  // not match the nonce in `appleCredential.identityToken`, sign in will fail.
  return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
}




//import 'dart:io';
//
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';
//
// import 'firebase_options.dart';
//
// // Needed because we can't import `web` into a mobile app,
// // while on the flip-side access to `dart:io` throws at runtime (hence the `kIsWeb` check below)
// // import 'html_shim.dart' if (dart.library.js_interop) 'package:web/web.dart'
// //     show window;
//
// void main() async{
//     await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//
//   FirebaseMessaging.instance.getToken().then((value) {
//     String? token = value;
//
//     print(">>>>>>>>>>>>>> $token");
//   });
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       onGenerateRoute: ((settings) {
//         // This is also invoked for incoming deep links
//
//         // ignore: avoid_print
//         print('onGenerateRoute: $settings');
//
//         return null;
//       }),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Example app: Sign in with Apple'),
//         ),
//         body: Container(
//           padding: const EdgeInsets.all(10),
//           child: Center(
//             child: SignInWithAppleButton(
//               onPressed: () async {
//                 final credential = await SignInWithApple.getAppleIDCredential(
//                   scopes: [
//                     AppleIDAuthorizationScopes.email,
//                     AppleIDAuthorizationScopes.fullName,
//                   ],
//                   webAuthenticationOptions: WebAuthenticationOptions(
//                     // TODO: Set the `clientId` and `redirectUri` arguments to the values you entered in the Apple Developer portal during the setup
//                     clientId:
//                     'de.lunaone.flutter.signinwithappleexample.service',
//                     redirectUri:
//                     // For web your redirect URI needs to be the host of the "current page",
//                     // while for Android you will be using the API server that redirects back into your app via a deep link
//                     // NOTE(tp): For package local development use (as described in `Development.md`)
//                     // Uri.parse('https://siwa-flutter-plugin.dev/')
//                      Uri.parse(
//                       'https://flutter-sign-in-with-apple-example.glitch.me/callbacks/sign_in_with_apple',
//                     ),
//                   ),
//                   // TODO: Remove these if you have no need for them
//                   nonce: 'example-nonce',
//                   state: 'example-state',
//                 );
//
//                 // ignore: avoid_print
//                 print(credential);
//
//                 // This is the endpoint that will convert an authorization code obtained
//                 // via Sign in with Apple into a session in your system
//                 final signInWithAppleEndpoint = Uri(
//                   scheme: 'https',
//                   host: 'flutter-sign-in-with-apple-example.glitch.me',
//                   path: '/sign_in_with_apple',
//                   queryParameters: <String, String>{
//                     'code': credential.authorizationCode,
//                     if (credential.givenName != null)
//                       'firstName': credential.givenName!,
//                     if (credential.familyName != null)
//                       'lastName': credential.familyName!,
//                     'useBundleId':
//                     !kIsWeb && (Platform.isIOS || Platform.isMacOS)
//                         ? 'true'
//                         : 'false',
//                     if (credential.state != null) 'state': credential.state!,
//                   },
//                 );
//
//                 final session = await http.Client().post(
//                   signInWithAppleEndpoint,
//                 );
//
//                 // If we got this far, a session based on the Apple ID credential has been created in your system,
//                 // and you can now set this as the app's session
//                 // ignore: avoid_print
//                 print(session);
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



signInWithTwitter() async {
  final twitterLogin = TwitterLogin(
    // Consumer API keys
    apiKey: 'S0dPGOWKzgKxiRRa0jxszuyzY',
    // Consumer API Secret keys
    apiSecretKey: 'g7kvPE5I9hmAXRwB8iTtEvbknNHJ8OCV8dGP1aagZHRnne8cOD',
    // Registered Callback URLs in TwitterApp
    // Android is a deeplink
    // iOS is a URLScheme
    redirectURI: 'flutter-twitter-login://',
  );
  await twitterLogin.login().then((value) async {
    print("Twitter Value $value");
    print("Twitter Value " + value.status.toString());


    print("Twitter Value " + value.user.toString());
    print("Twitter Value " + value.user!.name.toString());
    print("Twitter Value " + value.user!.email.toString());
    print("Twitter Value " + value.user!.id.toString());


    // setState(() {
      //user=value.user;
      // name = value.user!.name;
      // email = value.user!.email;
      // id = value.user!.id.toString();
    // });

    final TwitterAuthCredential  = TwitterAuthProvider.credential(
        accessToken: value.authToken!,
        secret: value.authTokenSecret!);

    await FirebaseAuth.instance.signInWithCredential(TwitterAuthCredential);
    switch (value.status) {
      case TwitterLoginStatus.loggedIn:
      // success
        break;
      case TwitterLoginStatus.cancelledByUser:
      // cancel
        break;
      case TwitterLoginStatus.error:
      // error
        break;
      case null:
      // TODO: Handle this case.
        break;
    }

  });
}

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}