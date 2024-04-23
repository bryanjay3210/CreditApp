part of 'creditor_information_cubit.dart';

class CreditorInformationState extends Equatable {
  const CreditorInformationState(
      {required this.gender, required this.isLoading, this.base64Image});
  final Gender gender;
  final bool isLoading;
  final Uint8List? base64Image;

  CreditorInformationState copyWith(
      {Gender? gender, bool? isLoading, Uint8List? base64Image}) {
    return CreditorInformationState(
        gender: gender ?? this.gender,
        isLoading: isLoading ?? this.isLoading,
        base64Image: base64Image);
  }

  @override
  List<Object?> get props => [gender, isLoading, base64Image];
}
