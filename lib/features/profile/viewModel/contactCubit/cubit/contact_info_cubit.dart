import 'package:autism/features/profile/data/model/contact_info_model.dart';
import 'package:autism/features/profile/data/repo/contact_info_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_info_state.dart';
part 'contact_info_cubit.freezed.dart';

class ContactInfoCubit extends Cubit<ContactInfoState> {
  ContactInfoCubit(this._contactInfoRepo) : super(const ContactInfoState.initial());
  final ContactInfoRepo _contactInfoRepo;

  Future<void> getContactInfo() async {
    emit(const ContactInfoState.loading());
    final result = await _contactInfoRepo.getContactInfo();
    result.when(
      success: (contactInfoModel) => emit(ContactInfoState.loaded(contactInfoModel)),
      failure: (error) => emit(ContactInfoState.error(error.apiErrorModel.message?? "An error occurred")),
    );
  }

  Future<void> editContactInfo({
    required String address,
    required String phone,
    required String facebook,
    required String linkedIn,
  }) async {
    emit(const ContactInfoState.loading());
    final result = await _contactInfoRepo.editContactInfo(
      address: address,
      phone: phone,
      facebook: facebook,
      linkedIn: linkedIn,
    );
    result.when(
      success: (response) => getContactInfo(),
      failure: (error) => emit(ContactInfoState.error(error.apiErrorModel.message?? "An error occurred")),
    );
  }
}
