import 'package:autism/features/privacy/data/models/legal_info_model.dart';
import 'package:autism/features/privacy/data/repositories/legal_info_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum PrivacyStatus { initial, loading, loaded, error }

class PrivacyState {
  final PrivacyStatus status;
  final LegalInfoModel? legalInfo;
  final String? errorMessage;

  PrivacyState({
    required this.status,
    this.legalInfo,
    this.errorMessage,
  });

  factory PrivacyState.initial() => PrivacyState(status: PrivacyStatus.initial);

  factory PrivacyState.loading() => PrivacyState(status: PrivacyStatus.loading);

  factory PrivacyState.loaded(LegalInfoModel legalInfo) => PrivacyState(
        status: PrivacyStatus.loaded,
        legalInfo: legalInfo,
      );

  factory PrivacyState.error(String message) => PrivacyState(
        status: PrivacyStatus.error,
        errorMessage: message,
      );
}

class PrivacyCubit extends Cubit<PrivacyState> {
  final LegalInfoRepository _repository;

  PrivacyCubit({LegalInfoRepository? repository})
      : _repository = repository ?? LegalInfoRepository(),
        super(PrivacyState.initial());

  Future<void> loadLegalInfo() async {
    emit(PrivacyState.loading());
    try {
      final legalInfo = _repository.getLegalInfo();
      emit(PrivacyState.loaded(legalInfo));
    } catch (e) {
      emit(PrivacyState.error('Failed to load legal information: $e'));
    }
  }
}
