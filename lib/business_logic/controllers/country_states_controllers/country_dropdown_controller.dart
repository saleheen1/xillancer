import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:xilancer/business_logic/core/utils/const_strings.dart';
import 'package:xilancer/business_logic/models/country_dropdown_model.dart';

var defaultId = '0';

class CountryDropdownController extends GetxController {
  var countryDropdownList = ['Bangladesh', 'India'];
  var countryDropdownIndexList = ['Bangladesh', 'India'];
  dynamic selectedCountry = ConstString.selectCountry;
  dynamic selectedCountryId = defaultId;

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

  setCountryValue(value) {
    selectedCountry = value;
    print('selected country $selectedCountry');
    update();
  }

  setSelectedCountryId(value) {
    selectedCountryId = value;
    print('selected country id $value');
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

  setDefault() {
    countryDropdownList = [];
    countryDropdownIndexList = [];
    selectedCountry = ConstString.selectCountry;
    selectedCountryId = defaultId;
    update();
  }

  Future<bool> fetchCountries(BuildContext context,
      {bool isrefresh = false}) async {
    return false;
    //   if (countryDropdownList.isNotEmpty) return false;

    //   if (isrefresh) {
    //  setDefault();

    //     setCurrentPage(currentPage);
    //   }

    //   if (countryDropdownList.isEmpty) {
    //     Future.delayed(const Duration(milliseconds: 500), () {
    //       setLoadingTrue();
    //     });
    //     var response = await http.get(Uri.parse('${ApiUrl.countryListUri}?page=$currentPage'));

    //     if ((response.statusCode == 200 || response.statusCode == 201) &&
    //         jsonDecode(response.body)['countries']['data'].isNotEmpty) {
    //       var data = CountryDropdownModel.fromJson(jsonDecode(response.body));
    //       for (int i = 0; i < data.countries.data.length; i++) {
    //         countryDropdownList.add(data.countries.data[i].name);
    //         countryDropdownIndexList.add(data.countries.data[i].id);
    //       }

    //       setCountry(context, data: data);

    //       notifyListeners();

    //       currentPage++;
    //       setCurrentPage(currentPage);
    //       return true;
    //     } else {
    //       //error fetching data
    //       countryDropdownList.add(ConstString.selectCountry);
    //       countryDropdownIndexList.add(defaultId);
    //       selectedCountry = ConstString.selectCountry;
    //       selectedCountryId = defaultId;
    //       notifyListeners();

    //       return false;
    //     }
    //   } else {
    //     //country list already loaded from api
    //     setCountry(context);

    //     return false;
    //   }
  }

  //Set country based on user profile
//==============================>

  setCountryBasedOnUserProfile(BuildContext context) {
    // selectedCountry = Provider.of<ProfileService>(context, listen: false)
    //         .profileDetails
    //         ?.userDetails
    //         .country ??
    //     ConstString.selectCountry;
    // selectedCountryId = Provider.of<ProfileService>(context, listen: false)
    //         .profileDetails
    //         ?.userDetails
    //         .userCountry
    //         ?.id ??
    //     defaultId;

    // Future.delayed(const Duration(milliseconds: 500), () {
    //   notifyListeners();
    // });
  }

  setCountry(BuildContext context, {CountryDropdownModel? data}) {
    // var profileData =
    //     Provider.of<ProfileService>(context, listen: false).profileDetails;
    // //if profile of user loaded then show selected dropdown data based on the user profile
    // if (profileData != null && profileData.userDetails.country != null) {
    //   setCountryBasedOnUserProfile(context);
    // } else {
    //   if (data != null) {
    //     selectedCountry = data.countries.data[0].name;
    //     selectedCountryId = data.countries.data[0].id;
    //   }
    // }
    // Future.delayed(const Duration(milliseconds: 500), () {
    //   notifyListeners();
    // });
  }

  // ================>
  // Search country
  // ================>

  Future<bool> searchCountry(BuildContext context, String searchText,
      {bool isrefresh = false, bool isSearching = false}) async {
    return false;
    // if (isSearching) {
    //   setDefault();
    // }

    // var response =
    //     await http.get(Uri.parse('${ApiUrl.countrySearchUri}/$searchText'));

    // if ((response.statusCode == 200 || response.statusCode == 201) &&
    //     jsonDecode(response.body)['countries']['data'].isNotEmpty) {
    //   var data = CountryDropdownModel.fromJson(jsonDecode(response.body));
    //   for (int i = 0; i < data.countries.data.length; i++) {
    //     countryDropdownList.add(data.countries.data[i].name);
    //     countryDropdownIndexList.add(data.countries.data[i].id);
    //   }

    //   notifyListeners();

    //   currentPage++;
    //   setCurrentPage(currentPage);
    //   return true;
    // } else {
    //   //error fetching data
    //   if (countryDropdownList.isEmpty) {
    //     countryDropdownList.add(ConstString.selectCountry);
    //     countryDropdownIndexList.add(defaultId);
    //     selectedCountry = ConstString.selectCountry;
    //     selectedCountryId = defaultId;
    //     notifyListeners();
    //   }

    //   return false;
    // }
  }
}
