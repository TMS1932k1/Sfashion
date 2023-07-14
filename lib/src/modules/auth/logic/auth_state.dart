import 'package:equatable/equatable.dart';
import 'package:s_fashion/src/models/auth_response.dart';

abstract class AuthState extends Equatable {
  final bool isLoading;

  const AuthState({required this.isLoading});
}

class LoadingState extends AuthState {
  const LoadingState() : super(isLoading: true);

  @override
  List<Object?> get props => [isLoading];
}

class LoadedState extends AuthState {
  final AuthResponse response;

  const LoadedState({required this.response}) : super(isLoading: false);

  @override
  List<Object?> get props => [isLoading];
}

class ErrorState extends AuthState {
  final String mesError;

  const ErrorState(this.mesError) : super(isLoading: false);

  @override
  List<Object?> get props => [isLoading];
}

class InitState extends AuthState {
  const InitState() : super(isLoading: false);

  @override
  List<Object?> get props => [isLoading];
}
