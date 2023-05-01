import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_english/data/settings.dart';
import 'package:online_english/screens/shared_components/my_drop_down.dart';
import 'package:online_english/utils/global_constants/country_hashmap.dart';
import 'package:online_english/utils/theme/my_theme.dart';

import '../../services/profile_service.dart';
import 'package:intl/intl.dart';

import 'components/profile_header.dart';

class ProfileInfoView extends ConsumerStatefulWidget {
  const ProfileInfoView({super.key});

  @override
  ConsumerState<ProfileInfoView> createState() => _ProfileInfoViewState();
}

class _ProfileInfoViewState extends ConsumerState<ProfileInfoView> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  final String _email = '';
  String _country = '';
  final String _phoneNumber = '';
  DateTime? _birthday;
  String? _dropdownValue;
  final String _textAreaValue = '';
  late final UserProfileService _service;

  late final List<Country> countries;
  @override
  void initState() {
    super.initState();
    _service = ref.read(userProfileService);
    _service.getProfileInfo();
    countries = AppSetting.instance.countryHelper.coutryNames();
  }

  @override
  Widget build(BuildContext context) {
    final userProfile = ref.watch(userProfileService).data;
    if (userProfile == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileHeaderWidget(
            avatar: userProfile.avatar,
            id: userProfile.id,
            name: userProfile.name,
            service: _service,
          ),
          const Divider(
            height: 50,
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          Text(
            'Details',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontSize: 24),
          ),
          const SizedBox(
            height: 10,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  initialValue: userProfile.name,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    contentPadding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                  ),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) => _name = value ?? '',
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: userProfile.email,
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    contentPadding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyDropDownWidget<Country>(
                  minWidth: 350,
                  choosenIndex: countries
                      .indexWhere((x) => x.code == userProfile.country),
                  hint: 'Country',
                  onValueChanged: (int? index) {
                    _country = index == null
                        ? countries[0].code
                        : countries[index].code;
                  },
                  dataList: countries,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Phone',
                    contentPadding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  enabled: false,
                  initialValue: userProfile.phone,
                ),
                const SizedBox(height: 16.0),
                ListTile(
                  minVerticalPadding: 8,
                  title: const Text('Birthday'),
                  subtitle: TextButton.icon(
                    style: MyTheme.outlineButtonStyle,
                    icon: Text(_birthday == null
                        ? 'Select Date'
                        : DateFormat.yMMMd().format(_birthday!)),
                    onPressed: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (date != null) {
                        setState(() => _birthday = date);
                      }
                    },
                    label: const Icon(Icons.calendar_month_rounded),
                  ),
                ),
                const SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  value: _dropdownValue,
                  hint: const Text('Select an option'),
                  onChanged: (String? newValue) {
                    _dropdownValue = newValue;
                  },
                  items: <String>['Option 1', 'Option 2', 'Option 3']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Text Area',
                      alignLabelWithHint: true),
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                ),
                const SizedBox(height: 16.0),
                TextButton(
                  onPressed: () {
                    if (_formKey.currentState != null &&
                        _formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Save changes
                    }
                  },
                  child: const Text('Save Changes'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
