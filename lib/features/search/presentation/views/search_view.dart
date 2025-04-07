import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../view_model/search_cubit/search_cubit.dart';
import 'search_results_list.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomTextFormField(
                  hint: 'Search',
                  isLastInput: true,
                  autofocus: true,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      BlocProvider.of<SearchCubit>(context)
                          .fetchUsers(searchText: value);
                    }
                  },
                ),
              ),
              const SizedBox(height: 25),
              const Expanded(child: SearchResultsList()),
            ],
          ),
        ),
      ),
    );
  }
}
