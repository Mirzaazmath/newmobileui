import 'dart:convert';
import 'dart:io';

import 'package:asws_mobile/utils/textfeildutils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/apiendpoint.dart';
import '../../utils/loader.dart';
import '../../utils/textutils.dart';
import '../../utils/toast.dart';
class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _zonecontroller = TextEditingController();
  TextEditingController _centercontroller = TextEditingController();
  TextEditingController _statecontroller = TextEditingController();
  TextEditingController _citycontroller = TextEditingController();
  TextEditingController _pincodecontroller = TextEditingController();
  TextEditingController _siblingfullnamecontroller = TextEditingController();
  TextEditingController _siblingagecontroller = TextEditingController();
  TextEditingController _siblingstandardcontroller = TextEditingController();
  TextEditingController _siblingschoolnamecontroller = TextEditingController();
  TextEditingController _gardianstatuscontroller = TextEditingController();
  TextEditingController _gardianfullnameontroller = TextEditingController();
  TextEditingController _gardianphonecontroller = TextEditingController();
  TextEditingController _gardianemailcontroller = TextEditingController();
  TextEditingController _gardianeducationcontroller = TextEditingController();
  TextEditingController _gardianocccupationcontroller = TextEditingController();
  TextEditingController _gendercontroller = TextEditingController();
  TextEditingController _dobcontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _addresscontroller = TextEditingController();
  TextEditingController _schoolcontroller = TextEditingController();
  TextEditingController _startdatecontroller = TextEditingController();
  TextEditingController _adhaarcontroller = TextEditingController();
  TextEditingController _phonecontroller = TextEditingController();
  int _index = 0;
  File? userimage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        title: const Text("Add Student"),
      ),
      body: Stepper(
        currentStep: _index,
        onStepCancel: () {
          if (_index > 0) {
            setState(() {
              _index -= 1;
            });
          }
        },

        onStepContinue: () {
          if (_index <= 1) {
            setState(() {
              _index += 1;
            });
          }else{
            var body={
              "address": "string",
              "adharNumber": 0,
              "brOrSis": "string",
              "centerName": "string",
              "city": "string",
              "dateOfBirth": "string",
              "email": "string",
              "firstName": "string",
              "id": "string",
              "lastName": "string",
              "parentEmail": "string",
              "parentFirstName": "string",
              "parentLastName": "string",
              "parentOccupation": "string",
              "parentPhone": 0,
              "parentalStatus": "string",
              "phone": 0,
              "photo": "string",
              "pinCode": 0,
              "placeOfBirth": "string",
              "schoolName": "string",
              "sibAge": 0,
              "sibStandard": "string",
              "siblingFullName": "string",
              "siblingSchool": "string",
              "siblingStuding": true,
              "state": "string",
              "zone": "string"
            };
            newpost(userimage,context);
          }
        },

        onStepTapped: (int index) {
          setState(() {
            _index = index;
          });
        },
        steps: <Step>[
          Step(
              isActive: _index == 0,
              title: Text('Student Details', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: _index == 0 ? Theme
                      .of(context)
                      .primaryColor : Colors.black),),
              content: Column(
                children: [
                  Stack(
                    children: [
                      userimage == null
                          ? const CircleAvatar(radius: 50,)
                          : CircleAvatar(radius: 50,
                        backgroundImage: FileImage(userimage!),

                      ),
                      GestureDetector(
                        onTap: () {
                          openphotooption(context);
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.shade300, radius: 15,
                          child: const Icon(
                            Icons.add_a_photo, color: Colors.black, size: 20,),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Feilds2(controller: _zonecontroller,
                      hinttext: "Select Zone",
                      title: "Select Zone"),
                  const SizedBox(height: 20,),
                  Feilds2(controller: _centercontroller,
                      hinttext: "Select Center",
                      title: "Select Center"),
                  const SizedBox(height: 20,),
                  Feilds2(controller: _namecontroller,
                      hinttext: "Full name",
                      title: "Full Name"),
                  const SizedBox(height: 20,),
                  Feilds2(controller: _schoolcontroller,
                      hinttext: "School name",
                      title: "School Name"),
                  const SizedBox(height: 20,),
                  Feilds2(controller: _gendercontroller,
                      hinttext: "gender",
                      title: "Gender"),
                  const SizedBox(height: 20,),
                  GestureDetector(
                      onTap: () {
                        _pickDateDialog();
                      },
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          normalgreytext("Date of Birth"),
                          const SizedBox(height: 5,),

                          TextFormField(

                            controller: _dobcontroller,
                            decoration:const  InputDecoration(
                              enabled: false,
                              hintText: "Birth date",

                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                  ),
                  const SizedBox(height: 20,),
                  Feilds2(controller: _adhaarcontroller,
                      hinttext: "xxxxxxxxxxxxx",
                      title: "Adhaar No."),
                  const SizedBox(height: 20,),
                  Feilds2(controller: _phonecontroller,
                      hinttext: "987665543211",
                      title: "Mobile No."),
                  const SizedBox(height: 20,),
                  Feilds2(controller: _emailcontroller,
                      hinttext: "Email",
                      title: "Email"),
                  const SizedBox(height: 20,),
                  Feilds2(controller: _addresscontroller,
                      hinttext: "address",
                      title: "Address"),
                  const SizedBox(height: 20,),
                  Feilds2(controller: _statecontroller,
                      hinttext: "State",
                      title: "State"),
                  const SizedBox(height: 20,),
                  Feilds2(controller: _citycontroller,
                      hinttext: "City",
                      title: "City"),
                  const SizedBox(height: 20,),
                  Feilds2(controller: _pincodecontroller,
                      hinttext: "",
                      title: "Pincode"),

                ],
              )
          ),
          Step(
              isActive: _index == 1,
              title: Text('Sibling Details', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: _index == 1 ? Theme
                      .of(context)
                      .primaryColor : Colors.black),),
              content: Column(
                children: [

                  Feilds2(controller: _siblingfullnamecontroller,
                      hinttext: "Name",
                      title: "Full Name"),
                  const SizedBox(height: 20,),
                  Feilds2(controller: _siblingagecontroller,
                      hinttext: "",
                      title: "Age"),
                  const SizedBox(height: 20,),
                  Feilds2(controller: _siblingstandardcontroller,
                      hinttext: "",
                      title: "Standard"),
                  const SizedBox(height: 20,),
                  Feilds2(controller: _siblingschoolnamecontroller,
                      hinttext: "",
                      title: "School Name"),
                ],
              )
          ),
          Step(
              isActive: _index == 2,
              title: Text('Family Details', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: _index == 2 ? Theme
                      .of(context)
                      .primaryColor : Colors.black),),
              content: Column(
                children: [

                  Feilds2(controller: _gardianstatuscontroller,
                      hinttext: "",
                      title: "Parental Status"),
                  const SizedBox(height: 20,),
                  Feilds2(controller: _gardianfullnameontroller,
                      hinttext: "",
                      title: "Full Name"),
                  const SizedBox(height: 20,),
                  Feilds2(controller: _gardianphonecontroller,
                      hinttext: "",
                      title: "Phone No."),
                  const SizedBox(height: 20,),
                  Feilds2(controller: _gardianemailcontroller,
                      hinttext: "",
                      title: "Email"),
                  const SizedBox(height: 20,),
                  Feilds2(controller: _gardianeducationcontroller,
                      hinttext: "",
                      title: "Educational Qualification"),
                  const SizedBox(height: 20,),
                  Feilds2(controller: _gardianocccupationcontroller,
                      hinttext: "",
                      title: "Occupation"),

                ],
              )
          ),
        ],
      ),
    );
  }

  void openphotooption(context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return
            Container(
              padding: const EdgeInsets.all(30),
              height: 180,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      pickimage(ImageSource.camera);
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: const [
                        CircleAvatar(
                          radius: 30,


                          child: Icon(Icons.camera, color: Colors.white,),),
                        SizedBox(height: 20,),
                        Text("Camara")
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      pickimage(ImageSource.gallery);
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: const [
                        CircleAvatar(
                          radius: 30,


                          child: Icon(Icons.image, color: Colors.white,),),
                        SizedBox(height: 20,),
                        Text("Gallery")
                      ],
                    ),
                  )
                ],
              ),

            );
        });
  }

  void pickimage(source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final temimage = File(image.path);

    setState(() {
      userimage = temimage;
    });
  }

  void _pickDateDialog() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        //which date will display when user open the picker
        firstDate: DateTime(1950),
        //what will be the previous supported year in picker
        lastDate: DateTime
            .now()) //what will be the up to supported date in picker
        .then((pickedDate) {
      //then usually do the future job
      if (pickedDate == null) {
        //if user tap cancel then this function will stop
        return;
      }
      setState(() {
        //for rebuilding the ui
        _dobcontroller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    });
  }
  void addstudent(ctx,var data) async{
    GlobalMethods().showLoader(ctx, true);
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    var result;

    var body= jsonEncode(data);
    final url = Uri.parse(ApiEndPoints.baseurl+ApiEndPoints.addnewstudent);


    try{

      var response= await post(url,

          headers: {"Content-Type": "application/json",
            "Authorization":"Bearer $token",},
          body: body);
      GlobalMethods().showLoader(ctx, false);
      print(response.statusCode);
      if(response.body.isNotEmpty) {
        result=   json.decode(response.body);
      }
      // var result=jsonDecode(response.body);
      debugPrint(result.toString());
      if(response.statusCode==200){

        debugPrint("Sucessfully Hit the Api");


        showToast("Event Uploaded Successfully");

      }else{
        showToast("Something went wrong");
        debugPrint("Something went wrong");

      }

    }catch(error){
      debugPrint(error.toString());
    }


  }
void newpost( File? imageFileList, context) async {
    SharedPreferences userdata = await SharedPreferences.getInstance();


    final token = userdata.getString("token");

    var body={
      "address": "string",
      "adharNumber": 0,
      "brOrSis": "string",
      "centerName": "string",
      "city": "string",
      "dateOfBirth": "string",
      "email": "string",
      "firstName": "string",
      "id": "string",
      "lastName": "string",
      "parentEmail": "string",
      "parentFirstName": "string",
      "parentLastName": "string",
      "parentOccupation": "string",
      "parentPhone": 0,
      "parentalStatus": "string",
      "phone": 0,
      "photo": "string",
      "pinCode": 0,
      "placeOfBirth": "string",
      "schoolName": "string",
      "sibAge": 0,
      "sibStandard": "string",
      "siblingFullName": "string",
      "siblingSchool": "string",
      "siblingStuding": true,
      "state": "string",
      "zone": "string"
    };
    String requestBody = json.encode(body);
    final url = Uri.parse(ApiEndPoints.baseurl+ApiEndPoints.addnewstudent);

      GlobalMethods().showLoader(context, true);
      var request = http.MultipartRequest("Post", url);
      request.files.add(await http.MultipartFile.fromPath(
              "file", imageFileList!.path));
      request.headers.addAll({
        "Content-type": "multipart/form-data",
        "Authorization": "Bearer $token"
      });
      request.fields.addAll({
        "student":"{}",


      });
      var response = await request.send();
    GlobalMethods().showLoader(context, false);
    print(response.statusCode);
      if (response.statusCode == 200) {

        showToast("Post Uploaded Sucessfully");

      } else {
        showToast("Something Went Wrong");
      }

    }
}