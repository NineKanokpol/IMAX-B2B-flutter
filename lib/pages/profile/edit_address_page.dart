import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:imaxb2bflutter/appManager/color_manager.dart';

import '../../api/model/addressmodel/amphure_thai_model.dart';
import '../../api/model/addressmodel/province_thai_model.dart';
import '../../api/model/addressmodel/thumbon_thai_model.dart';
import '../../api/service/address_service.dart';

class EditAddressPage extends StatefulWidget {
  const EditAddressPage({super.key});

  @override
  State<EditAddressPage> createState() => _EditAddressPageState();
}

class _EditAddressPageState extends State<EditAddressPage> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController roomController = TextEditingController();
  TextEditingController floorController = TextEditingController();
  TextEditingController buildingController = TextEditingController();
  TextEditingController villageController = TextEditingController();
  TextEditingController villageGroupController = TextEditingController();
  TextEditingController alleyController = TextEditingController();
  TextEditingController separateController = TextEditingController();
  TextEditingController roadController = TextEditingController();
  TextEditingController provinceController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController parishController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController noteAddressController = TextEditingController();

  final FocusNode _focusFirstName = FocusNode();
  final FocusNode _focusLastName = FocusNode();
  final FocusNode _focusPhone = FocusNode();
  final FocusNode _focusNumber = FocusNode();
  final FocusNode _focusRoom = FocusNode();
  final FocusNode _focusFloor = FocusNode();
  final FocusNode _focusBuilding = FocusNode();
  final FocusNode _focusVillage = FocusNode();
  final FocusNode _focusVillageGroup = FocusNode();
  final FocusNode _focusAlley = FocusNode();
  final FocusNode _focusSeparate = FocusNode();
  final FocusNode _focusRoad = FocusNode();
  final FocusNode _focusProvince = FocusNode();
  final FocusNode _focusDistrict = FocusNode();
  final FocusNode _focusParish = FocusNode();
  final FocusNode _focusZipCode = FocusNode();

  final _formKeyFirstName = GlobalKey<FormState>();
  final _formKeyLastName = GlobalKey<FormState>();
  final _formKeyPhone = GlobalKey<FormState>();
  final _formKeyNumber = GlobalKey<FormState>();
  final _formKeyRoom = GlobalKey<FormState>();
  final _formKeyFloor = GlobalKey<FormState>();
  final _formKeyBuilding = GlobalKey<FormState>();
  final _formKeyVillage = GlobalKey<FormState>();
  final _formKeyVillageGroup = GlobalKey<FormState>();
  final _formKeyAlley = GlobalKey<FormState>();
  final _formKeySeparate = GlobalKey<FormState>();
  final _formKeyRoad = GlobalKey<FormState>();
  final _formKeyProvince = GlobalKey<FormState>();
  final _formKeyDistrict = GlobalKey<FormState>();
  final _formKeyParish = GlobalKey<FormState>();
  final _formKeyZipCode = GlobalKey<FormState>();

  List<ProvinceThaiRegisModel> listProvinceData = [];
  List<AmphureThaiRegisModel> listAmphureData = [];
  List<AmphureThaiRegisModel> listAmphureDataQuery = [];
  List<ThumbonThaiRegisModel> listThumbonData = [];
  List<ThumbonThaiRegisModel> thumbonDataQuery = [];

  String? selectValueProvince; // Holds the selected province
  AmphureThaiRegisModel? selectValueAmphure =
      AmphureThaiRegisModel(); // Holds the selected province
  ThumbonThaiRegisModel selectValueThumbon = ThumbonThaiRegisModel();

  bool checkRoom = false;
  bool checkNumber = false;
  bool checkFirstName = false;
  bool checkLastName = false;
  bool checkPhone = false;
  bool checkFloor = false;
  bool checkBuilding = false;
  bool checkVillage = false;
  bool checkVillageGroup = false;
  bool checkAlley = false;
  bool checkSeparate = false;
  bool checkRoad = false;
  bool checkProvince = false;
  bool checkDistrict = false;
  bool checkParish = false;
  bool checkZipCode = false;

  int? selectedProvinceId = 0;

  @override
  void initState() {
    getProvinceThaiData();
    super.initState();
  }

  getAmphureThaiData(int? provinceId) async {
    await AddressService.getAmphureThai().then((value) {
      setState(() {
        // listAmphureData = value.amphureData;
        value.amphureData.forEach((element) {
          if (element.provinceId == provinceId) {
            listAmphureDataQuery.add(element);
          }
        });
      });
    });
  }

  Future<void> getThumbonThaiData() async {
    await AddressService.getThumbonThai().then((value) {
      setState(() {
        listThumbonData = value.thumbonData;
      });
    });
  }

  getProvinceThaiData() async {
    await AddressService.getProvinceThai().then((value) {
      setState(() {
        listProvinceData = value.provinceData;
        listProvinceData.sort((a, b) => a.nameTh!.compareTo(b.nameTh ?? ''));
        value.provinceData.forEach((action) {
          if (action.nameTh == selectValueProvince) {
            selectedProvinceId = action.id;
            selectValueProvince = action.nameTh;
          }
        });
        int index = listProvinceData.indexWhere(
            (element) => element.nameTh?.trim() == selectValueProvince);
        if (index >= 0) {
          getAmphureThaiData(listProvinceData[index].id ?? 0);
        }
        print('Selected Province ID: $selectedProvinceId');
      });
    });
  }

  // bool checkAllFieldsCompleted() {
  //   if(widget.isEdit == true &&
  //       firstnameController.text.isNotEmpty &&
  //       lastnameController.text.isNotEmpty &&
  //       phoneNumberController.text.isNotEmpty &&
  //       numberController.text.isNotEmpty &&
  //       selectValueProvince.toString().isNotEmpty  &&
  //       (selectValueAmphure?.nameTh??'').isNotEmpty &&
  //       (selectValueThumbon.nameTh??'').isNotEmpty &&
  //       zipCodeController.text.isNotEmpty){
  //     return true;
  //   } else if (checkNumber &&
  //       checkFirstName &&
  //       checkLastName &&
  //       checkPhone &&
  //       checkNumber &&
  //       checkProvince &&
  //       checkDistrict &&
  //       checkParish &&
  //       checkZipCode && phoneNumberController.text.length == 10) {
  //     return true;
  //   }
  //   return false;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.colorBg,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.orange,
          title: Text('แก้ไขที่อยู่การจัดส่งสินค้า'),
          elevation: 0,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios_new_outlined)),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [informationPeopleView(), dataAddress()],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 8,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24)),
            child: BottomAppBar(
              height: 64,
              color: Colors.white,
              surfaceTintColor: Colors.white,
              padding: EdgeInsets.zero,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(12, 10, 12, 8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.orange),
                          borderRadius: BorderRadius.circular(32)),
                      height: double.infinity,
                      child: InkWell(
                        onTap: () {},
                        child: Center(
                          child: Text(
                            'ยกเลิก',
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(12, 10, 12, 8),
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(32)),
                      height: double.infinity,
                      child: Center(
                        child: Text(
                          'บันทึก',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget informationPeopleView() {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                'ข้อมูลที่อยู่',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          inputDataValidator(
            important: true,
            title: 'ชื่อ',
            key: _formKeyFirstName,
            focus: _focusFirstName,
            controller: firstnameController,
            type: 'text',
            onChanged: (text) {},
            formValidator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอกชื่อ';
              }
              return null;
            },
          ),
          inputDataValidator(
            important: true,
            title: 'นามสกุล',
            controller: lastnameController,
            type: 'text',
            key: _formKeyLastName,
            focus: _focusLastName,
            onChanged: (text) {},
            formValidator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอกนามสกุล';
              }
              return null;
            },
          ),
          inputDataValidator(
            maxLength: 10,
            important: true,
            title: 'เบอร์โทรศัพท์',
            controller: phoneNumberController,
            type: 'number',
            key: _formKeyPhone,
            focus: _focusPhone,
            formValidator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอกเบอร์โทรศัพท์';
              }
              return null;
            },
            onChanged: (text) {},
          ),
        ],
      ),
    );
  }

  Widget dataAddress() {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                'ข้อมูลที่อยู่',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: _formKeyNumber.currentState?.validate() == true
                      ? null
                      : 115,
                  padding: EdgeInsets.only(right: 8),
                  child: inputDataValidator(
                    important: true,
                    title: 'เลขที่',
                    controller: numberController,
                    type: 'text',
                    key: _formKeyNumber,
                    focus: _focusNumber,
                    formValidator: (value) {
                      return null;
                    },
                    onChanged: (text) {
                      // setState(() {
                      //   numberController.text = text!;
                      //   if (numberController.text.isNotEmpty) {
                      //     checkNumber = true;
                      //   } else {
                      //     checkNumber = false;
                      //   }
                      // });
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: _formKeyNumber.currentState?.validate() == true
                      ? null
                      : 115,
                  padding: EdgeInsets.only(left: 8),
                  child: inputDataValidator(
                    important: false,
                    title: 'ห้องเลขที่',
                    controller: roomController,
                    type: 'text',
                    key: _formKeyRoom,
                    focus: _focusRoom,
                    formValidator: (value) {
                      return null;
                    },
                    onChanged: (text) {
                      setState(() {
                        roomController.text = text!;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(right: 8),
                width: MediaQuery.of(context).size.width * 0.24,
                child: inputDataValidator(
                  important: false,
                  title: 'ชั้น',
                  controller: floorController,
                  type: 'text',
                  key: _formKeyFloor,
                  focus: _focusFloor,
                  formValidator: (value) {
                    return null;
                  },
                  onChanged: (text) {
                    setState(() {
                      floorController.text = text!;
                    });
                  },
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 8),
                  child: inputDataValidator(
                    important: false,
                    title: 'อาคาร',
                    controller: buildingController,
                    type: 'text',
                    key: _formKeyBuilding,
                    focus: _focusBuilding,
                    formValidator: (value) {
                      return null;
                    },
                    onChanged: (text) {
                      setState(() {
                        buildingController.text = text!;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(right: 8),
                width: MediaQuery.of(context).size.width * 0.6,
                child: inputDataValidator(
                  important: false,
                  title: 'หมู่บ้าน',
                  controller: villageController,
                  type: 'text',
                  key: _formKeyVillage,
                  focus: _focusVillage,
                  formValidator: (value) {
                    return null;
                  },
                  onChanged: (text) {
                    setState(() {
                      villageController.text = text!;
                    });
                  },
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 8),
                  child: inputDataValidator(
                    important: false,
                    title: 'หมู่ที่',
                    controller: villageGroupController,
                    type: 'text',
                    key: _formKeyVillageGroup,
                    focus: _focusVillageGroup,
                    formValidator: (value) {
                      return null;
                    },
                    onChanged: (text) {
                      setState(() {
                        villageGroupController.text = text!;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          inputDataValidator(
            important: false,
            title: 'ตรอก/ซอย',
            controller: alleyController,
            type: 'text',
            key: _formKeyAlley,
            focus: _focusAlley,
            formValidator: (value) {
              return null;
            },
            onChanged: (text) {
              setState(() {
                alleyController.text = text!;
              });
            },
          ),
          inputDataValidator(
            important: false,
            title: 'แยก',
            controller: separateController,
            type: 'text',
            key: _formKeySeparate,
            focus: _focusSeparate,
            formValidator: (value) {
              return null;
            },
            onChanged: (text) {
              setState(() {
                separateController.text = text!;
              });
            },
          ),
          inputDataValidator(
            important: false,
            title: 'ถนน',
            controller: roadController,
            type: 'text',
            key: _formKeyRoad,
            focus: _focusRoad,
            formValidator: (value) {
              return null;
            },
            onChanged: (text) {
              setState(() {
                roadController.text = text!;
              });
            },
          ),
          dropDownProvince(),
          dropDownDistrict(),
          dropDownLocaly(),
          inputDataValidator(
            enabled: false,
            important: true,
            title: 'รหัสไปรษณีย์',
            controller: zipCodeController,
            type: 'text',
            key: _formKeyZipCode,
            focus: _focusZipCode,
            formValidator: (value) {
              if (value!.isEmpty) {
                return null;
              }
              return null;
            },
            onChanged: (text) {
              setState(() {});
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  child: Text("หมายเหตุ")),
              Container(
                height: 80,
                child: TextFormField(
                  maxLines: 80 ~/ 20,
                  // focusNode: loginProviderModel.focusIdCard,
                  controller: noteAddressController,
                  // validator: loginProviderModel.validateIdCard,
                  onChanged: (value) {
                    setState(() {
                      // checkButton(pointUserController);
                      // print('pointUserController.text : ${pointUserController.text}');
                    });
                  },
                  keyboardType: TextInputType.text,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.only(top: 10, bottom: 8, left: 8),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget dropDownProvince() {
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8, top: 8),
            child: inputImportantText('จังหวัด'),
          ),
          DropdownButtonFormField(
            value: selectValueProvince,
            // validator: doubleFieldValidator.validate,
            key: Key('provinceDropDown'),
            // icon: Icon(
            //   Icons.keyboard_arrow_down_rounded,
            //   color: ColorManager().textProgressColor,
            // ),
            isExpanded: true,
            onTap: () {
              // unFocusTextController();
            },
            onChanged: (String? value) {
              setState(() {
                // unFocusTextController();
                selectValueAmphure?.nameTh = "";
                listAmphureDataQuery.clear();
                selectValueThumbon = ThumbonThaiRegisModel();
                zipCodeController.text = "";
                thumbonDataQuery.clear();
                selectValueProvince = value;
                print('selectValueProvince : ${selectValueProvince}');
                if (selectValueProvince!.isNotEmpty) {
                  checkProvince = true;
                } else {
                  checkProvince = false;
                }
                int index = listProvinceData.indexWhere(
                    (element) => element.nameTh?.trim() == value?.trim());
                if (index >= 0) {
                  getAmphureThaiData(listProvinceData[index].id ?? 0);
                }
              });
            },
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: "เลือกจังหวัด",
              // hintStyle: TextStyle(fontSize: FontSizeManager().textMSize),
              contentPadding:
                  EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 12),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.red, width: 1),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.red, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.blue, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey, width: 1),
              ),
            ),
            items: listProvinceData
                .map((ProvinceThaiRegisModel val) => DropdownMenuItem<String>(
                      value: val.nameTh,
                      child: Text(val.nameTh ?? ""),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget dropDownDistrict() {
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: inputImportantText('อำเภอ/เขต'),
          ),
          DropdownButtonFormField<AmphureThaiRegisModel>(
            value: selectValueAmphure != null &&
                    listAmphureDataQuery.contains(selectValueAmphure)
                ? selectValueAmphure
                : null,
            key: Key("districtDropDown"),
            isExpanded: true,
            onTap: () {
              // unFocusTextController();
            },
            onChanged: (AmphureThaiRegisModel? value) {
              setState(() {
                selectValueThumbon = ThumbonThaiRegisModel();
                thumbonDataQuery.clear();
                selectValueAmphure = value;
                zipCodeController.text = "";
                checkDistrict = selectValueAmphure?.nameTh?.isNotEmpty ?? false;

                getThumbonThaiData().then((valueThumbon) async {
                  thumbonDataQuery.addAll(listThumbonData.where(
                    (element) => element.amphureId == value?.id,
                  ));
                });
              });
            },
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              contentPadding:
                  EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 12),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.red, width: 1),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.red, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.blue, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey, width: 1),
              ),
            ),
            hint: Text("เลือกอำเภอ/เขต"),
            items: listAmphureDataQuery.map((AmphureThaiRegisModel val) {
              return DropdownMenuItem<AmphureThaiRegisModel>(
                value: val,
                child: Text(val.nameTh ?? ""),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget dropDownLocaly() {
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: inputImportantText('ตำบล/แขวง'),
          ),
          DropdownButtonFormField(
            value: (selectValueThumbon.nameTh?.isNotEmpty ?? false)
                ? selectValueThumbon
                : null,
            key: Key("thumbon"),
            // validator: doubleFieldValidator.validateThumbon,
            // icon: Icon(
            //   Icons.keyboard_arrow_down_rounded,
            //   color: ColorManager().textProgressColor,
            // ),
            isExpanded: true,
            onTap: () {
              // unFocusTextController();
            },
            onChanged: (Object? value) {
              setState(() {
                value as ThumbonThaiRegisModel;
                // unFocusTextController();
                selectValueThumbon = value;
                zipCodeController.text = value.zipCode.toString();
                if (selectValueThumbon.nameTh!.isNotEmpty &&
                    zipCodeController.text.isNotEmpty) {
                  checkZipCode = true;
                  checkParish = true;
                } else {
                  checkZipCode = false;
                  checkParish = false;
                }
              });
            },
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              contentPadding:
                  EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 12),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.red, width: 1),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.red, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.blue, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey, width: 1),
              ),
            ),
            hint: Text(
              "เลือกตำบล/แขวง",
              // style: TextStyle(fontSize: FontSizeManager().textMSize)
            ),
            items: thumbonDataQuery
                .map((val) => DropdownMenuItem(
                      value: val,
                      child: Text(val.nameTh ?? ""),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget inputDataValidator({
    int? maxLength,
    bool? enabled,
    required bool important,
    required String title,
    required GlobalKey<FormState> key,
    required TextEditingController controller,
    required String type,
    required FocusNode focus,
    required Function(String?) formValidator,
    required Function(String?) onChanged,
  }) {
    TextInputType inputType;
    List<TextInputFormatter>? inputFormatters;
    if (type == 'email') {
      inputType = TextInputType.emailAddress;
      inputFormatters = [];
    } else if (type == 'number') {
      inputType = TextInputType.number;
      inputFormatters = [FilteringTextInputFormatter.digitsOnly];
    } else if (type == 'phone') {
      inputType = TextInputType.number;
      inputFormatters = [MaskedInputFormatter('000-000-0000')];
    } else if (type == 'telephone') {
      inputType = TextInputType.number;

      inputFormatters = [MaskedInputFormatter('000-000-0000')];
    } else if (type == 'idcard') {
      inputType = TextInputType.number;
      inputFormatters = [MaskedInputFormatter('0-0000-000000-00')];
    } else {
      inputType = TextInputType.text;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: 8),
          child: important
              ? inputImportantText(title)
              : Text(
                  title,
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                ),
        ),
        const SizedBox(height: 8),
        Form(
          key: key,
          child: TextFormField(
            enabled: enabled,
            maxLength: maxLength,
            focusNode: focus,
            style: const TextStyle(fontSize: 14),
            controller: controller,
            cursorColor: Colors.black,
            keyboardType: inputType,
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              counterText: "",
              alignLabelWithHint: true,
              fillColor: Colors.white,
              filled: false,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              contentPadding: const EdgeInsets.fromLTRB(8, 5, 10, 5),
              labelText: title,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.withOpacity(0.8),
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              labelStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            validator: (value) => formValidator(value),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget inputImportantText(String title) {
    return Row(
      children: [
        Text(title,
            style: TextStyle(
                // color: ColorManager().textColor,
                fontWeight: FontWeight.w500)),
        Text(
          ' *',
          style: TextStyle(color: Colors.red),
        )
      ],
    );
  }
}
