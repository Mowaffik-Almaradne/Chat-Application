import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_chat1/core/shared/bloc/viewbloc/cubit/view_cubit.dart';
import 'package:flutter_test_chat1/core/shared/bloc/viewbloc/cubit/view_state.dart';
import 'package:flutter_test_chat1/core/enum/view_page_enum.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/presentation/view/shearch_partner.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/presentation/view/suggestions_partner.dart';

class SearchPartnerPage extends StatelessWidget {
  const SearchPartnerPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewCubit, ViewState>(
      builder: (context, state) {
        return buildBody(state.changeView);
      },
    );
  }

//! this is for swatch view Page
  Widget buildBody(ViewPageChange viewPageState) {
    switch (viewPageState) {
      case ViewPageChange.searchPartner:
        return const ShearchPartnerView();
      case ViewPageChange.suggestionsPartners:
        return const SuggestionsPartnerView();
      default:
        return const ShearchPartnerView();
    }
  }
}
