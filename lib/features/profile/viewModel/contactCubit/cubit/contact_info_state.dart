part of 'contact_info_cubit.dart';

@freezed
class ContactInfoState with _$ContactInfoState {
  const factory ContactInfoState.initial() = _Initial;

  const factory ContactInfoState.loading() = _Loading;
  const factory ContactInfoState.loaded(ContactInfoModel contactInfoModel) = _Loaded;
  const factory ContactInfoState.error(String error) = _Error;



}
