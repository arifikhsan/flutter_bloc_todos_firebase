import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc_todos_firebase/src/domain/repository/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc({
    @required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is SignInAnonymously) {
      yield* _mapSignInAnonymouslyToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      final isSignedIn = await _userRepository.isAuthenticated();
      if (!isSignedIn) {
        await _userRepository.authenticate();
      }
      print('signed in');

      final userId = await _userRepository.getUserId();
      print(userId);
      yield Authenticated(userId);
    } catch (_) {
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapSignInAnonymouslyToState() async* {
    try {
      final isSignedIn = await _userRepository.isAuthenticated();
      if (!isSignedIn) {
        await _userRepository.authenticate();
      }
      print('signed in');
      final userId = await _userRepository.getUserId();
      print(userId);
      yield Authenticated(userId);
    } on PlatformException catch (e) {
      print('gagal ${e.toString()}');
    } catch (e) {
      print('gagal nih ${e.toString()}');
      yield Unauthenticated();
    }
  }
}
