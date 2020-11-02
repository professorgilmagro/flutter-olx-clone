// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterStore on _RegisterStore, Store {
  Computed<bool> _$passConfirmedComputed;

  @override
  bool get passConfirmed =>
      (_$passConfirmedComputed ??= Computed<bool>(() => super.passConfirmed,
              name: '_RegisterStore.passConfirmed'))
          .value;
  Computed<FieldChecker> _$nameCheckerComputed;

  @override
  FieldChecker get nameChecker =>
      (_$nameCheckerComputed ??= Computed<FieldChecker>(() => super.nameChecker,
              name: '_RegisterStore.nameChecker'))
          .value;
  Computed<FieldChecker> _$emailCheckerComputed;

  @override
  FieldChecker get emailChecker => (_$emailCheckerComputed ??=
          Computed<FieldChecker>(() => super.emailChecker,
              name: '_RegisterStore.emailChecker'))
      .value;
  Computed<FieldChecker> _$phoneCheckerComputed;

  @override
  FieldChecker get phoneChecker => (_$phoneCheckerComputed ??=
          Computed<FieldChecker>(() => super.phoneChecker,
              name: '_RegisterStore.phoneChecker'))
      .value;
  Computed<FieldChecker> _$passCheckerComputed;

  @override
  FieldChecker get passChecker =>
      (_$passCheckerComputed ??= Computed<FieldChecker>(() => super.passChecker,
              name: '_RegisterStore.passChecker'))
          .value;
  Computed<bool> _$canSubmitComputed;

  @override
  bool get canSubmit =>
      (_$canSubmitComputed ??= Computed<bool>(() => super.canSubmit,
              name: '_RegisterStore.canSubmit'))
          .value;

  final _$emailAtom = Atom(name: '_RegisterStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$errorAtom = Atom(name: '_RegisterStore.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$passwordAtom = Atom(name: '_RegisterStore.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$showPassAtom = Atom(name: '_RegisterStore.showPass');

  @override
  bool get showPass {
    _$showPassAtom.reportRead();
    return super.showPass;
  }

  @override
  set showPass(bool value) {
    _$showPassAtom.reportWrite(value, super.showPass, () {
      super.showPass = value;
    });
  }

  final _$loadingAtom = Atom(name: '_RegisterStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$phoneAtom = Atom(name: '_RegisterStore.phone');

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$confirmAtom = Atom(name: '_RegisterStore.confirm');

  @override
  String get confirm {
    _$confirmAtom.reportRead();
    return super.confirm;
  }

  @override
  set confirm(String value) {
    _$confirmAtom.reportWrite(value, super.confirm, () {
      super.confirm = value;
    });
  }

  final _$nameAtom = Atom(name: '_RegisterStore.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$registerAsyncAction = AsyncAction('_RegisterStore.register');

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  final _$_RegisterStoreActionController =
      ActionController(name: '_RegisterStore');

  @override
  void toggleVisibility() {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.toggleVisibility');
    try {
      return super.toggleVisibility();
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPass(String value) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.setConfirmPass');
    try {
      return super.setConfirmPass(value);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.setName');
    try {
      return super.setName(value);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
error: ${error},
password: ${password},
showPass: ${showPass},
loading: ${loading},
phone: ${phone},
confirm: ${confirm},
name: ${name},
passConfirmed: ${passConfirmed},
nameChecker: ${nameChecker},
emailChecker: ${emailChecker},
phoneChecker: ${phoneChecker},
passChecker: ${passChecker},
canSubmit: ${canSubmit}
    ''';
  }
}
