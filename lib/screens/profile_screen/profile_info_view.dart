import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:online_english/data/setting/settings.dart';
import 'package:online_english/screens/shared_components/my_drop_down.dart';
import 'package:online_english/utils/global_constants/country_hashmap.dart';
import 'package:online_english/utils/theme/my_theme.dart';

import '../../data/model/user_data_source/user_enum.dart';
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
  String _country = '';
  String _phoneNumber = '';
  DateTime? _birthday;
  Level? _level;
  List<String>? _selectedTopics;
  String scheduleNote = '';

  late final UserProfileService _service;
  late final List<Country> countries;

  @override
  void initState() {
    super.initState();
    _service = ref.read(userProfileService);
    _service.getProfileInfo();
    _service.getMapSpecialties();
    countries = AppSetting.instance.countryHelper.coutryNames();
  }

  @override
  Widget build(BuildContext context) {
    final userProfile = ref.watch(userProfileService).data;
    final Map<String, String>? topics =
        ref.watch(userProfileService).specialities;
    if (userProfile == null || topics == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    _birthday = userProfile.birthday;
    _level = userProfile.level;
    _country = userProfile.country ?? '';
    _selectedTopics = [];
    for (var val in userProfile.learnTopics) {
      if (topics.containsKey(val.key)) {
        _selectedTopics!.add(val.key);
      }
    }
    for (var val in userProfile.testPreparations) {
      if (topics.containsKey(val.key)) {
        _selectedTopics!.add(val.key);
      }
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
                  choosenIndex: countries.indexWhere((x) => x.code == _country),
                  hint: 'Country',
                  onValueChanged: (int? index) {
                    _country = index == null || index < 0
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
                  onSaved: (newValue) => _phoneNumber = newValue!,
                ),
                const SizedBox(height: 10.0),
                TextButton.icon(
                  style: MyTheme.outlineButtonStyle.copyWith(
                      minimumSize:
                          const MaterialStatePropertyAll(Size.fromHeight(50))),
                  icon: Text(
                    _birthday == null
                        ? 'Select Date'
                        : 'Birthday: ${DateFormat.yMMMd().format(_birthday!)}',
                  ),
                  onPressed: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: _birthday ?? DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (date != null) {
                      setState(() => _birthday = date);
                    }
                  },
                  label: const Icon(Icons.calendar_month_rounded),
                ),
                const SizedBox(height: 10.0),
                SizedBox.fromSize(
                  size: const Size.fromHeight(50),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: MyDropDownWidget<Level>(
                      minWidth: 50,
                      choosenIndex: Level.values.indexOf(_level!),
                      hint: 'Select your level',
                      onValueChanged: (int? index) {
                        if (index == null) {
                          _level = null;
                          return;
                        }
                        _level = Level.values.elementAt(index);
                      },
                      dataList: Level.values,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                MultiSelectDialogField<String>(
                  initialValue: _selectedTopics!,
                  barrierColor: null,
                  selectedColor: MyTheme.colors.secondaryColor,
                  selectedItemsTextStyle:
                      TextStyle(color: MyTheme.colors.onSecondaryColor),
                  items: topics.keys
                      .map((key) => MultiSelectItem<String>(key, topics[key]!))
                      .toList(),
                  listType: MultiSelectListType.CHIP,
                  onConfirm: (values) {
                    _selectedTopics = values;
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Schedule note',
                      alignLabelWithHint: true,
                      hintText: 'Note the time you want to study on Lettutor'),
                  maxLines: 6,
                  keyboardType: TextInputType.multiline,
                  onSaved: (value) => scheduleNote = value ?? '',
                ),
                const SizedBox(height: 16.0),
                TextButton(
                  style: MyTheme.flatButtonStyle,
                  onPressed: () {
                    if (_formKey.currentState != null &&
                        _formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Save changes
                      _service.updateProfile(
                          _name,
                          _phoneNumber,
                          _country,
                          _birthday ?? DateTime.now(),
                          _selectedTopics ?? [],
                          scheduleNote,
                          _level ?? Level.BEGINNER);
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
