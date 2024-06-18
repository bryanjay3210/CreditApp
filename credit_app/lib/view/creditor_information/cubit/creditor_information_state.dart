part of 'creditor_information_cubit.dart';

class CreditorInformationState extends Equatable {
  const CreditorInformationState(
      {required this.gender,
      required this.isLoading,
      this.base64Image,
      required this.creditor});
  final Gender gender;
  final bool isLoading;
  final Uint8List? base64Image;
  final Creditor? creditor;

  CreditorInformationState copyWith(
      {Gender? gender,
      bool? isLoading,
      Uint8List? base64Image,
      Creditor? creditor}) {
    return CreditorInformationState(
        gender: gender ?? this.gender,
        isLoading: isLoading ?? this.isLoading,
        base64Image: base64Image,
        creditor: creditor ?? this.creditor);
  }

  @override
  List<Object?> get props => [gender, isLoading, base64Image, creditor];
}
