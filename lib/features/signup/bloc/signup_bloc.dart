import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpSubmittedEvent>(_onSignUpSubmitted);
    on<SignUpReset>(_onSignUpReset);
    on<InitSignUpScreenEvent>(_onSignUpInit);
  }

  Future<void> _onSignUpSubmitted(
    SignUpSubmittedEvent event,
    Emitter<SignUpState> emit,
  ) async {
    // ✅ Built-in validation inside BLoC
    if (!event.email.contains('@') || !event.email.contains('.')) {
      emit(SignUpFailure('Invalid email format'));
      return;
    }

    if (event.password.length < 6) {
      emit(SignUpFailure('Password must be at least 6 characters'));
      return;
    }

    if (event.password != event.confirmPassword) {
      emit(SignUpFailure('Passwords do not match'));
      return;
    }

    // Simulate loading
    emit(SignUpLoading());

    await Future.delayed(const Duration(seconds: 2));

    // Fake server responses for testing
    if (event.email == 'exists@example.com') {
      emit(SignUpFailure('Email already in use'));
    } else if (event.email == 'error@example.com') {
      emit(SignUpFailure('Server error occurred'));
    } else {
      emit(SignUpSuccess(event.email));
    }
  }

  void _onSignUpReset(SignUpReset event, Emitter<SignUpState> emit) {
    emit(SignUpInitial());
  }

  void _onSignUpInit(InitSignUpScreenEvent event, Emitter<SignUpState> emit) {
    emit(SignUpInitial());
  }
}
