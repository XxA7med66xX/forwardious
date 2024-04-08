part of 'invidious_instance_cubit.dart';

@immutable
sealed class InvidiousInstanceState{}

final class InvidiousInstanceInitial extends InvidiousInstanceState {}

///This state gets emitted if the API is loaded successfully.
final class LoadInvidiousInstances extends InvidiousInstanceState {
  final List<Invidiuos> url;
  final List<Invidiuos> location;
  final List<Invidiuos> flag;
  final List<Invidiuos> type;
  final List<Invidiuos> signupSupport;
  final List<Invidiuos> health;
  
  LoadInvidiousInstances({
    required this.url,
    required this.location,
    required this.flag,
    required this.type,
    required this.signupSupport,
    required this.health,
  });
}

///This state is emitted when the reload function is called.
final class ReloadInvidiousInstances extends InvidiousInstanceState {}

///This state gets emitted if an error occurs.
final class InvidiousInstancesNull extends InvidiousInstanceState {
  final String errorMessage;
  
  InvidiousInstancesNull({required this.errorMessage});
}

final class CurrentInstances extends InvidiousInstanceState {
  late final String currentInstance;

  CurrentInstances({required this.currentInstance});
}