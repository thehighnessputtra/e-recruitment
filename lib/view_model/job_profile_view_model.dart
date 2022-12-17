import 'package:flutter/material.dart';
import 'package:latihan_firebase/models/job_profile_model.dart';

class JobProfileViewModel extends ChangeNotifier {
  List<JobProfileModel> listJobProfiles = listJobProfile;
  JobProfileModel? jobProfileModels;

  List<JobProfileModel> get getlistJobProfiles => listJobProfiles;
}
