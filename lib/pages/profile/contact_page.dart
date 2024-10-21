import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';

import '../../appManager/color_manager.dart';

class ContactPage extends StatefulWidget {
  final String typePage;

  const ContactPage({super.key, required this.typePage});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  TextEditingController controllerTitleContact = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPhoneNo = TextEditingController();

  FocusNode focusTitleContact = FocusNode();
  FocusNode focusDescription = FocusNode();
  FocusNode focusName = FocusNode();
  FocusNode focusPhoneNo = FocusNode();

  int lengthText = 0;

  @override
  void initState() {
    controllerDescription.addListener(_descriptionListener);
    super.initState();
  }

  _descriptionListener() {
    setState(() {
      lengthText = controllerDescription.text.length;
    });
  }

  @override
  void dispose() {
    controllerDescription.dispose();
    controllerTitleContact.dispose();
    controllerName.dispose();
    super.dispose();
  }

  unFocusKeyBoard() {
    focusTitleContact.unfocus();
    focusDescription.unfocus();
    focusName.unfocus();
    focusPhoneNo.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.colorBg,
      appBar: AppBar(
        elevation: 0,
        // toolbarHeight: 100,
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: Text(
          'ติดต่อ/แจ้งปัญหา',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          unFocusKeyBoard();
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              margin: EdgeInsets.only(left: 8, right: 8, top: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.35),
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      widget.typePage == 'problem'
                          ? 'แจ้งปัญหา'
                          : 'สอบถาม/เรื่องทั่วไป',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                    child: fillTextWithTitleView(
                        'เรื่องที่ติดต่อ',
                        controllerTitleContact,
                        focusTitleContact,
                        '',
                        'กรุณาระบุเรื่องที่ต้องการแจ้ง',
                        TextInputType.text),
                  ),
                  Container(
                    child: fillTextWithTitleView(
                        'รายละเอียด',
                        controllerDescription,
                        focusDescription,
                        'description',
                        'กรุณาระบุรายละเอียด...',
                        TextInputType.multiline),
                  ),
                  Container(
                    child: fillTextWithTitleView(
                        'ชื่อผู้ติดต่อ',
                        controllerName,
                        focusName,
                        '',
                        'กรุณาระบุชื่อ',
                        TextInputType.multiline),
                  ),
                  Container(
                    child: fillTextWithTitleView(
                        'หมายเลขติดต่อกลับ',
                        controllerPhoneNo,
                        focusPhoneNo,
                        'number',
                        'กรุณาระบุเบอร์โทรศัพท์',
                        TextInputType.number),
                  ),
                  btn()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget btn() {
    return Container(
      margin: EdgeInsets.only(top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 40,
            width: 150,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  elevation: 0,
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.all(8)),
              onPressed: () {},
              child: Text('ยกเลิก'),
            ),
          ),
          Container(
            height: 40,
            width: 150,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  elevation: 0,
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.all(8)),
              onPressed: () {},
              child: Text('ส่ง'),
            ),
          ),
        ],
      ),
    );
  }

  Widget fillTextWithTitleView(
      String title,
      TextEditingController controller,
      FocusNode focusNode,
      String type,
      String hint,
      TextInputType textInputType) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Text(
              title,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
            ),
          ),
          Container(
            child: TextFormField(
              controller: controller,
              focusNode: focusNode,
              inputFormatters: type == 'number'
                  ? [MaskedInputFormatter('000-000-0000')]
                  : [],
              cursorColor: Colors.orange,
              validator: type == 'number' ? textValidator.validateNumber : null,
              cursorHeight: 30,
              decoration: InputDecoration(
                hintText: hint,
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(8),
                counterText:
                    type == 'description' ? '${lengthText}/250 ตัวอักษร' : '',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white, width: 1),
                ),
              ),
              keyboardType: textInputType,
              maxLength: type == 'description' ? 250 : null,
              maxLines: null,
            ),
          )
        ],
      ),
    );
  }
}

class textValidator {
  static String? validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "กรุณกรอกข้อมูล";
    } else if (value.replaceAll("-", "").length < 10) {
      return "กรุณากรอกเบอร์โทรศัพท์ให้ครบ";
    } else {
      return null;
    }
  }
}
