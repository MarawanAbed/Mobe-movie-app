
import 'package:movie_app/mobe/presentation/widgets/search_tv/search_bloc_builder.dart';

import '../../../../../lib_imports.dart';
import '../../bloc/tv/search/search_tv_cubit.dart';

class SearchTvBody extends StatelessWidget {
  const SearchTvBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SearchTvCubit>();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          AppTextFormField(
            hintText:AppStrings.search,
            onChanged: (value) {
              cubit.searchTv(value);
            },
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const SearchTvBlocBuilder(),
        ],
      ),
    );
  }
}
