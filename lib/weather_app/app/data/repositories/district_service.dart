import 'package:supabase_flutter/supabase_flutter.dart';

class DistrictService {
  final SupabaseClient supabase;

  DistrictService({required this.supabase});

  Future<List<dynamic>> fetchDistricts() async {
    final response = await supabase
        .from('district_name')
        .select()
        .order('district_id', ascending: true);

    print("Fetched data: $response");

    if (response == null) {
      throw Exception('No data returned');
    }
    return response as List<dynamic>;
  }
}
