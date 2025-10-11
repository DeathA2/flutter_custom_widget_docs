class ImageDoc {
  //Dialog
  static String medicationLogDialog =
      ImagesPath.getPath('medication_log_dialog.jpg');
  //quick_guide
  static String biofluxQuickGuideSlide1 =
      ImagesPath.getPath('bioflux_quick_guide_slide1.jpg');
  static String biofluxQuickGuideSlide2 =
      ImagesPath.getPath('bioflux_quick_guide_slide2.jpg');
  static String biofluxQuickGuideSlide3 =
      ImagesPath.getPath('bioflux_quick_guide_slide3.jpg');
  static String biofluxQuickGuideSlide4 =
      ImagesPath.getPath('bioflux_quick_guide_slide4.jpg');
  static String biofluxQuickGuideSlide5 =
      ImagesPath.getPath('bioflux_quick_guide_slide5.jpg');

  //Page
  static String biofluxQuickGuidePage =
      ImagesPath.getPath('bioflux_quick_guide_page.jpg');
  static String bioheartGuidePage =
      ImagesPath.getPath('bioheart_guide_page.jpg');
  static String healthkitActivationPage =
      ImagesPath.getPath('healthkit_activation_page.jpg');
  static String guidePage = ImagesPath.getPath('guide_page.jpg');

  //picker
  static String birthdayPicker = ImagesPath.getPath('birthday_picker.jpg');
  static String monthYearPicker = ImagesPath.getPath('month_year_picker.jpg');
  static String basicPicker = ImagesPath.getPath('basic_picker.jpg');
  static String daysIntervalPickerBottomSheet =
      ImagesPath.getPath('days_interval_picker_bottom_sheet.jpg');
  static String oneHourPicker = ImagesPath.getPath('one_hour_picker.jpg');
  static String bioheartMonthCalendar =
      ImagesPath.getPath('bioheart_month_calendar.jpg');

  //list
  static String medicationList = ImagesPath.getPath('medication_list.jpg');
  static String pickImageListNull =
      ImagesPath.getPath('pick_image_list_null.jpg');
  static String pickImageListHasData =
      ImagesPath.getPath('pick_image_list_has_data.jpg');

  //pdf
  static String pdfScreen = ImagesPath.getPath('pdf_screen.jpg');

  //emailVertified
  static String enterEmail = ImagesPath.getPath('center_enter_email.jpg');
  static String emailNotVerified =
      ImagesPath.getPath('center_not_verified.jpg');
  static String emailVerified = ImagesPath.getPath('center_verified.jpg');

  //NavigationBar
  static String bottomNavigationBar =
      ImagesPath.getPath('bottom_navigation_bar_biocare.jpg');
  //BottomSheet
  static String addNotesBottomSheet =
      ImagesPath.getPath('add_notes_bottom_sheet.jpg');
  static String bioDevicesBottomSheet =
      ImagesPath.getPath('bio_devices_bottom_sheet.jpg');
  static String bioHeartDevicesFoundBottomSheet =
      ImagesPath.getPath('bioheart_devices_found_bottom_sheet.jpg');
  static String contactSupportBottomSheet =
      ImagesPath.getPath('contact_support_bottom_sheet.jpg');
  static String countryBottomSheet =
      ImagesPath.getPath('country_bottom_sheet.jpg');
  static String imagePickerBottomSheet =
      ImagesPath.getPath('image_picker_bottom_sheet.jpg');
  static String listViewBottomSheet =
      ImagesPath.getPath('list_view_bottom_sheet.jpg');
  static String rulerBottomSheet = ImagesPath.getPath('ruler_bottom_sheet.jpg');
  static String bioheartUpdateBottomSheet =
      ImagesPath.getPath('bioheart_update_bottom_sheet.jpg');
  //Card
  static String appointmentCard = ImagesPath.getPath('appointment_card.jpg');
  static String servicesAppointmentCard =
      ImagesPath.getPath('services_appointment_card.jpg');
  static String articleCard = ImagesPath.getPath('article_card.jpg');
  static String detailArticleCard =
      ImagesPath.getPath('detail_article_card.jpg');
  static String cardItemWithIcon =
      ImagesPath.getPath('card_item_with_icon.jpg');
  static String previousCareplanCardClose =
      ImagesPath.getPath('previous_careplan_close.jpg');
  static String previousCareplanCardOpen =
      ImagesPath.getPath('previous_careplan_open.jpg');
  static String customPreviousCareplanCardClose =
      ImagesPath.getPath('custom_previous_careplan_close.jpg');
  static String customPreviousCareplanCardOpen =
      ImagesPath.getPath('custom_previous_careplan_open.jpg');
  static String qqlAssessmentCard =
      ImagesPath.getPath('qql_assessment_card.jpg');
  static String medicineCard = ImagesPath.getPath('medicine_card.jpg');
  static String dailyHealthDialogCard =
      ImagesPath.getPath('daily_health_log_card.jpg');
  static String dailyPlanCard = ImagesPath.getPath('daily_plan_card.jpg');
  static String devicesSupportCard =
      ImagesPath.getPath('devices_support_card.jpg');
  static String noteSearchCell = ImagesPath.getPath('note_search_cell.jpg');
  static String quickguideVideoCard =
      ImagesPath.getPath('quickguide_video_card.jpg');
  static String requestQoLInputCard =
      ImagesPath.getPath('request_qol_input_card.jpg');
  static String yourePreviousCareplanCard =
      ImagesPath.getPath('your_previous_careplan_card.jpg');
  static String medicineDefaultCard =
      ImagesPath.getPath('medicine_default_card.jpg');

  //Input
  static String searchDialCode = ImagesPath.getPath('search_dial_code.jpg');

  //Section
  static String activityLevelsSection =
      ImagesPath.getPath('activity_levels_section.jpg');
  static String requestQoLInput =
      ImagesPath.getPath('request_qol_input_section.jpg');
  static String vitalMeasurements =
      ImagesPath.getPath('vital_measurements_section.jpg');

  //Snack bar
  static String closeAppSnackBar =
      ImagesPath.getPath('close_app_snack_bar.jpg');

  //Bioheart user guide card
  static String bioheartUserGuideCard =
      ImagesPath.getPath('bioheart_user_guide_card.png');

  // Avatar
  static String normalAvatarPreview =
      ImagesPath.getPath('normal_avatar_preview.jpg');
  static String editableAvatarPreview =
      ImagesPath.getPath('editable_avatar_preview.jpg');

  // Snapshot card
  static String snapshotCardLoadedPreview =
      ImagesPath.getPath('snapshot_card_loaded_preview.jpg');
  static String snapshotCardLoadingPreview =
      ImagesPath.getPath('snapshot_card_loading_preview.jpg');
  static String snapshotCardNoPreviewAvailablePreview =
      ImagesPath.getPath('snapshot_card_no_preview_available_preview.jpg');
  static String snapshotCardCheckingSpacePreview =
      ImagesPath.getPath('snapshot_card_checking_space_preview.jpg');
  static String snapshotCardExceedLimitPreview =
      ImagesPath.getPath('snapshot_card_exceed_limit_preview.jpg');
  static String snapshotCardProcessingPreview =
      ImagesPath.getPath('snapshot_card_processing_preview.jpg');
}

extension ImagesPath on ImageDoc {
  static String getPath(String name) {
    return 'biocare-doc/assets/images/$name';
  }
}
