part of 'creditor_cubit.dart';

class CreditorState extends Equatable {
  const CreditorState(
      {required this.isLoading,
      required this.inSearch,
      required this.creditorList});

  final bool isLoading;
  final bool inSearch;
  final List<Creditor> creditorList;

  CreditorState copyWith(
      {bool? isLoading, bool? inSearch, List<Creditor>? creditorList}) {
    return CreditorState(
        isLoading: isLoading ?? this.isLoading,
        inSearch: inSearch ?? this.inSearch,
        creditorList: creditorList ?? this.creditorList);
  }

  @override
  List<Object> get props => [isLoading, inSearch, creditorList];
}
