part of 'creditor_cubit.dart';

class CreditorState extends Equatable {
  const CreditorState({required this.isLoading, required this.creditorList});

  final bool isLoading;
  final List<Creditor> creditorList;

  CreditorState copyWith({bool? isLoading, List<Creditor>? creditorList}) {
    return CreditorState(
        isLoading: isLoading ?? this.isLoading,
        creditorList: creditorList ?? this.creditorList);
  }

  @override
  List<Object> get props => [isLoading, creditorList];
}
