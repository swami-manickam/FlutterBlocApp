import 'package:flutter_sample_bloc_pattern/data/model/user_details.dart';
import 'package:flutter_sample_bloc_pattern/data/provider/user_detais_provider.dart';

class UserDetailsRepository {
  final UserDetailsProvider _userDetailsProvider = UserDetailsProvider();

  // Fetch the api response and pass it to bloc component
  Future<UserDetails> fetchUserDetails() async =>
      _userDetailsProvider.fetchUserDetails();
}
