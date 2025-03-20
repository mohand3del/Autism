import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:autism/features/privacy/presentation/viewmodel/privacy_cubit.dart';
import 'package:autism/features/privacy/data/models/legal_info_model.dart';

class PrivacyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Legal Information'),
      ),
      body: BlocBuilder<PrivacyCubit, PrivacyState>(
        builder: (context, state) {
          switch (state.status) {
            case PrivacyStatus.loading:
              return Center(child: CircularProgressIndicator());
            case PrivacyStatus.loaded:
              return _buildLegalInfoList(state.legalInfo);
            case PrivacyStatus.error:
              return Center(
                  child: Text(state.errorMessage ?? 'Error loading data'));
            default:
              return Center(
                  child: Text('Welcome to the Legal Information Page'));
          }
        },
      ),
    );
  }

  Widget _buildLegalInfoList(LegalInfoModel? legalInfo) {
    if (legalInfo == null) return SizedBox();
    return ListView.builder(
      itemCount: legalInfo.items.length,
      itemBuilder: (context, index) {
        final item = legalInfo.items[index];
        return ListTile(
          title: Text(item.title,
              style: AppStyles.medium16(context).copyWith(
                fontFamily: 'Poppins',
                color: AppColors.black,
              )),
          subtitle: Text(item.content,
              style: AppStyles.regular16(context).copyWith(
                fontFamily: 'Poppins',
                color: AppColors.grey,
              )),
        );
      },
    );
  }
}
