export 'package:dio/dio.dart';
export 'package:get_it/get_it.dart';
export 'package:movie_app/core/networking/api_service.dart';
export 'package:movie_app/core/networking/dio_factory.dart';
export 'package:movie_app/movie/home/data/repositories/repo_impl.dart';
export 'package:movie_app/movie/home/domain/repositories/repo.dart';
export 'package:movie_app/movie/home/domain/use_cases/get_airing_today_tv.dart';
export 'package:movie_app/movie/home/domain/use_cases/get_movie_by_genre.dart';
export 'package:movie_app/movie/home/domain/use_cases/get_movie_details.dart';
export 'package:movie_app/movie/home/domain/use_cases/get_movie_geners.dart';
export 'package:movie_app/movie/home/domain/use_cases/get_movie_videos.dart';
export 'package:movie_app/movie/home/domain/use_cases/get_popular_movies.dart';
export 'package:movie_app/movie/home/domain/use_cases/get_popular_tv.dart';
export 'package:movie_app/movie/home/domain/use_cases/get_similar_movie.dart';
export 'package:movie_app/movie/home/domain/use_cases/get_similar_tv.dart';
export 'package:movie_app/movie/home/domain/use_cases/get_top_rated_movies.dart';
export 'package:movie_app/movie/home/domain/use_cases/get_top_rated_tv.dart';
export 'package:movie_app/movie/home/domain/use_cases/get_tv_by_genre.dart';
export 'package:movie_app/movie/home/domain/use_cases/get_tv_details.dart';
export 'package:movie_app/movie/home/domain/use_cases/get_tv_geners.dart';
export 'package:movie_app/movie/home/domain/use_cases/get_tv_videos.dart';
export 'package:movie_app/movie/home/domain/use_cases/get_upcoming_movies.dart';
export 'package:movie_app/movie/home/domain/use_cases/search_movies.dart';
export 'package:movie_app/movie/home/domain/use_cases/search_tv.dart';
export 'package:movie_app/movie/home/presentation/manager/movie/by_genre/get_movies_by_genre_cubit.dart';
export 'package:shared_preferences/shared_preferences.dart';

export '../../movie/home/data/data_sources/remote_data_source/remote_data_source.dart';


export 'package:flutter/material.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:movie_app/core/routes/routes.dart';
export 'package:movie_app/movie/home/data/models/movie_model.dart';
export 'package:movie_app/movie/home/data/models/tv_model.dart';

export 'package:movie_app/movie/home/presentation/pages/favorite/movies_favorite_page.dart';
export 'package:movie_app/movie/home/presentation/pages/favorite/tv_favorite_page.dart';
export 'package:movie_app/movie/home/presentation/pages/genre/genre_page.dart';
export 'package:movie_app/movie/home/presentation/pages/home/home_page.dart';
export 'package:movie_app/movie/home/presentation/pages/movie_details/movie_details_page.dart';
export 'package:movie_app/movie/home/presentation/pages/search_movie/search_movie_page.dart';
export 'package:movie_app/movie/home/presentation/pages/search_tv/search_tv_page.dart';
export 'package:movie_app/movie/home/presentation/pages/tv_details/tv_details_page.dart';
export 'package:movie_app/movie/home/presentation/pages/type/type_page.dart';
export 'package:movie_app/movie/home/presentation/pages/view_all/view_all_page.dart';
export 'package:movie_app/movie/onboarding/presentation/pages/onboarding_page.dart';
export 'package:hive_flutter/hive_flutter.dart';
export 'package:movie_app/core/di/dependancy_injection.dart';
export 'package:movie_app/core/helpers/cache.dart';
export 'package:movie_app/core/services/bloc_observer.dart';
export 'package:movie_app/core/utils/strings.dart';
export 'package:movie_app/movie/home/data/models/favorite.dart';
export 'package:movie_app/movie_app.dart';
export 'core/routes/app_router.dart';
export 'package:movie_app/core/utils/app_secured.dart';
export 'package:movie_app/movie/home/data/models/genres_model.dart';
export 'package:movie_app/movie/home/data/models/movie_details_model.dart';
export 'package:movie_app/movie/home/data/models/tv_details_model.dart';
export 'package:movie_app/core/networking/api_error_handler.dart';
export 'package:movie_app/core/networking/api_result.dart';