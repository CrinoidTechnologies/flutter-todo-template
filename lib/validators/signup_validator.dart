
import '../data/models/profile.dart';
import '../generated/l10n.dart';

class SignupValidator {
  Profile? profile;

  SignupValidator({this.profile});

  String validate() {
    String? firstName = profile?.firstName;
    String? lastName = profile?.lastName;
    String? email = profile?.email;
    String? password = profile?.password;

    String value = S.current.validationSuccessful;

    if ((firstName ?? '').isEmpty) {
      value = S.current.pleaseEnterYourFirstName;
    } else if ((lastName ?? '').isEmpty) {
      value = S.current.pleaseEnterYourLastName;
    } else if ((email ?? '').isEmpty) {
      value = S.current.pleaseEnterEmail;
    } else if ((password ?? '').isEmpty) {
      value = S.current.pleaseEnterPassword;
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email!)) {
      value = S.current.pleaseEnterValidEmail;
    } else if (password!.length < 6 || password.length > 20) {
      value = S.current.passwordMustBeWithIn620Characters;
    } else if (!RegExp(
            "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@\$%^&*-]).{6,}\$")
        .hasMatch(password)) {
      value = S.current.passwordMustIncludeAtLeastOneUpperLowerCaseOne;
    }
    return value;
  }
}
