// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xilancer/business_logic/controllers/country_states_controllers/country_dropdown_controller.dart';
import 'package:xilancer/business_logic/core/utils/const_strings.dart';
import 'package:xilancer/business_logic/models/states_dropdown_model.dart';

class StatesDropdownController extends GetxController {
  var statesDropdownList = ['Dhaka', 'Khulna'];
  var statesDropdownIndexList = ['Dhaka', 'Khulna'];

  dynamic selectedState = ConstString.selectState;
  dynamic selectedStateId = defaultId;

  bool isLoading = false;

  late int totalPages;

  int currentPage = 1;

  setCurrentPage(newValue) {
    currentPage = newValue;
    update();
  }

  setTotalPage(newPageNumber) {
    totalPages = newPageNumber;
    update();
  }

  setStateDefault() {
    statesDropdownList = [];
    statesDropdownIndexList = [];
    selectedState = ConstString.selectState;
    selectedStateId = defaultId;

    currentPage = 1;
    update();
  }

  setStatesValue(value) {
    selectedState = value;
    print('selected state $selectedState');
    update();
  }

  setSelectedStatesId(value) {
    selectedStateId = value;
    print('selected state id $value');
    update();
  }

  setLoadingTrue() {
    isLoading = true;
    update();
  }

  setLoadingFalse() {
    isLoading = false;
    update();
  }

  Future<bool> fetchStates(BuildContext context,
      {bool isrefresh = false}) async {
    return false;
    // if (isrefresh) {
    //   //making the list empty first to show loading bar (we are showing loading bar while the product list is empty)
    //   //we are make the list empty when the sub category or brand is selected because then the refresh is true
    //   setStateDefault();

    //   setCurrentPage(currentPage);
    // }

    // var selectedCountryId =
    //     Provider.of<CountryDropdownService>(context, listen: false)
    //         .selectedCountryId;

    // var response = await http.get(Uri.parse(
    //     '${ApiUrl.stateListUri}/$selectedCountryId?page=$currentPage'));

    // if ((response.statusCode == 200 || response.statusCode == 201) &&
    //     jsonDecode(response.body)['state']['data'].isNotEmpty) {
    //   var data = StatesDropdownModel.fromJson(jsonDecode(response.body));
    //   for (int i = 0; i < data.state.data.length; i++) {
    //     statesDropdownList.add(data.state.data[i].name);
    //     statesDropdownIndexList.add(data.state.data[i].id);
    //   }

    //   set_State(context, data: data);
    //   notifyListeners();

    //   currentPage++;
    //   setCurrentPage(currentPage);

    //   return true;
    // } else {
    //   //error fetching data

    //   if (statesDropdownList.isEmpty) {
    //     statesDropdownList.add(ConstString.selectCity);
    //     statesDropdownIndexList.add(defaultId);
    //     selectedState = ConstString.selectCity;
    //     selectedStateId = defaultId;
    //     notifyListeners();
    //   }

    //   return false;
    // }
  }

  //Set state based on user profile
//==============================>
  setStateBasedOnUserProfile(BuildContext context) {
    // var profileProvider =
    //     Provider.of<ProfileService>(context, listen: false).profileDetails;

    // selectedState =
    //     profileProvider?.userDetails.state ?? ConstString.selectCity;
    // selectedStateId = profileProvider?.userDetails.userState != null
    //     ? profileProvider?.userDetails.userState?.id
    //     : defaultId;
    // print(statesDropdownList);
    // print(statesDropdownIndexList);
    // print('selected state $selectedState');
    // print('selected state id $selectedStateId');
    // Future.delayed(const Duration(milliseconds: 500), () {
    //   notifyListeners();
    // });
  }

  //==============>
  set_State(BuildContext context, {StatesDropdownModel? data}) {
    // var profileData =
    //     Provider.of<ProfileService>(context, listen: false).profileDetails;

    // if (profileData != null) {
    //   var userCountryId = Provider.of<ProfileService>(context, listen: false)
    //           .profileDetails
    //           ?.userDetails
    //           .userCountry
    //           ?.id ??
    //       defaultId;

    //   var selectedCountryId =
    //       Provider.of<CountryDropdownService>(context, listen: false)
    //           .selectedCountryId;

    //   if (userCountryId == selectedCountryId) {
    //     //if user selected the country id which is save in his profile
    //     //only then show state/area based on that

    //     setStateBasedOnUserProfile(context);
    //   } else {
    //     if (data != null) {
    //       selectedState = data.state.data[0].name;
    //       selectedStateId = data.state.data[0].id;
    //     }
    //   }
    // } else {
    //   if (data != null) {
    //     selectedState = data.state.data[0].name;
    //     selectedStateId = data.state.data[0].id;
    //   }
    // }

    // Future.delayed(const Duration(milliseconds: 500), () {
    //   notifyListeners();
    // });
  }

  // ================>
  // Search
  // ================>

  Future<bool> searchState(BuildContext context, String searchText,
      {bool isrefresh = false, bool isSearching = false}) async {
    return false;
    // if (isSearching) {
    //   setStateDefault();
    // }

    // var response =
    //     await http.get(Uri.parse('${ApiUrl.stateSearchUri}/$searchText'));

    // if ((response.statusCode == 200 || response.statusCode == 201) &&
    //     jsonDecode(response.body)['state']['data'].isNotEmpty) {
    //   var data = StatesDropdownModel.fromJson(jsonDecode(response.body));
    //   for (int i = 0; i < data.state.data.length; i++) {
    //     statesDropdownList.add(data.state.data[i].name);
    //     statesDropdownIndexList.add(data.state.data[i].id);
    //   }

    //   notifyListeners();

    //   currentPage++;
    //   setCurrentPage(currentPage);

    //   return true;
    // } else {
    //   //error fetching data
    //   statesDropdownList.add(ConstString.selectCity);
    //   statesDropdownIndexList.add(defaultId);
    //   selectedState = ConstString.selectCity;
    //   selectedStateId = defaultId;
    //   notifyListeners();
    //   return false;
    // }
  }
}
