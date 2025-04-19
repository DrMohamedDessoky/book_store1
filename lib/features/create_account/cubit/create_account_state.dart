part of 'create_account_cubit.dart';

@immutable
sealed class CreateAccountState {}

final class CreateAccountInitial extends CreateAccountState {}
class CreateAccountLoading extends CreateAccountState{}
class CreateAccountSuccess extends CreateAccountState{}
class CreateAccountError extends CreateAccountState{}