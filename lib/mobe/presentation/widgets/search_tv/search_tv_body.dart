import 'package:movie_app/core/utils/sizes.dart';
import 'package:movie_app/mobe/presentation/widgets/search_tv/search_bloc_builder.dart';

import '../../../../../lib_imports.dart';
import '../../bloc/tv/search/search_tv_cubit.dart';

class SearchTvBody extends StatefulWidget {
  const SearchTvBody({super.key});

  @override
  State<SearchTvBody> createState() => _SearchTvBodyState();
}

class _SearchTvBodyState extends State<SearchTvBody> {

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SearchTvCubit>();
    return Padding(
      padding: const EdgeInsets.all(AppSizes.kDefaultPadding20),
      child: Column(
        children: [
          AppTextFormField(
            hintText: AppStrings.search,
            onChanged: (value) {
              if (value.isNotEmpty) {
                if (cubit.query != value) {
                  cubit.query = value;
                  cubit.clear();
                  cubit.searchTv(value);
                }
              } else {
                cubit.query = '';
                cubit.clear();
              }
            },
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: AppSizes.kDefaultHeight20,
          ),
          const SearchTvBlocBuilder(
          ),
        ],
      ),
    );
  }
}
