abstract class SingupState{}
class InitialSingState extends SingupState{}
class LoadingSingState extends SingupState{}
class SuccessSingState extends SingupState{}
class FailureSingState extends SingupState{
  String Error;
  FailureSingState({required this.Error});
}