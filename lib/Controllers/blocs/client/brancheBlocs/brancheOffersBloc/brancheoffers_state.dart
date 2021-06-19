part of 'brancheoffers_bloc.dart';

abstract class BrancheOffersState extends Equatable {
  const BrancheOffersState();

  @override
  List<Object> get props => [];
}

class BrancheoffersInitial extends BrancheOffersState {}

class BrancheOffersLoading extends BrancheOffersState {}

class BrancheOffersSuccess extends BrancheOffersState {
  final List<BrancheOffer> offers;

  BrancheOffersSuccess(this.offers);
}

class BrancheOffersFaild extends BrancheOffersState {
  final String message;

  BrancheOffersFaild(this.message);
}
