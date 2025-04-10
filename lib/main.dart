import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'my_app.dart';
import 'pages/core/logic/core_service.dart';
import 'storage/my_storage.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://emeieomtahllehlrfdwf.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVtZWllb210YWhsbGVobHJmZHdmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDQyNjMxODcsImV4cCI6MjA1OTgzOTE4N30.eqK5er31muM-wLYbraV-uWbbkWxt8RVj2FkSFx56MlM',
  );

  await MyStorage.instance.init();
  await Get.putAsync<CoreService>(() async => CoreService());

  runApp(const MyApp());
}
