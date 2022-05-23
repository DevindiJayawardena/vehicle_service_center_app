import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../const/constants.dart';
import '../../../const/widget_size.dart';
import '../../../screens/main/home_screen.dart';
import '../../molecules/buttons/filled_rounded_button.dart';
import '../../molecules/containers/app_dropdown_menu.dart';
import '../../molecules/containers/drawer.dart';
import '../../molecules/input_fields/app_input_field.dart';

class UserRegistrationTemplate extends StatefulWidget {
  const UserRegistrationTemplate({Key? key}) : super(key: key);

  @override
  _UserRegistrationTemplateState createState() => _UserRegistrationTemplateState();
}

class _UserRegistrationTemplateState extends State<UserRegistrationTemplate> {

  GlobalKey<FormState> _firstNameKey = GlobalKey<FormState>();

  TextEditingController _firstNameController = TextEditingController();

  GlobalKey<FormState> _lastNameKey = GlobalKey<FormState>();

  TextEditingController _lastNameController = TextEditingController();

  GlobalKey<FormState> _contactNoKey = GlobalKey<FormState>();

  TextEditingController _contactNoController = TextEditingController();

  GlobalKey<FormState> _nicNoKey = GlobalKey<FormState>();

  TextEditingController _nicNoController = TextEditingController();

  GlobalKey<FormState> _vehicleTypeKey = GlobalKey<FormState>();

  TextEditingController _vehicleTypeController = TextEditingController();

  GlobalKey<FormState> _vehicleNoKey = GlobalKey<FormState>();

  TextEditingController _vehicleNoController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register New User"),
        backgroundColor: Constants.appColorAmber,
      ),

      drawer: DrawerWidget(),

      body: SingleChildScrollView(
        child: Column(
          children : [
            SizedBox(height: 30,),

            AppInputField(
                formKey: _firstNameKey,
                controller: _firstNameController,
                inputType: TextInputType.name,
                validator: MultiValidator([
                  RequiredValidator(errorText: "First Name is Required"),
                  EmailValidator(errorText: "Enter a Valid Name")
                ]),
                iconData: Icons.person_add_alt_1,
                hintText: "First Name"
            ),

            SizedBox(height: 20,),

            AppInputField(
                formKey: _lastNameKey,
                controller: _lastNameController,
                inputType: TextInputType.name,
                validator: MultiValidator([
                  RequiredValidator(errorText: "Last Name is Required"),
                  EmailValidator(errorText: "Enter a Valid Name")
                ]),
                iconData: Icons.person_add_alt_1,
                hintText: "Last Name"
            ),

            SizedBox(height: 20,),

            AppInputField(
                formKey: _contactNoKey,
                controller: _contactNoController,
                inputType: TextInputType.number,
                validator: MultiValidator([
                  RequiredValidator(errorText: "Contact No. is Required"),
                  EmailValidator(errorText: "Enter a Valid Number")
                ]),
                iconData: Icons.phone_callback,
                hintText: "Contact Number"
            ),

            SizedBox(height: 20,),

            AppInputField(
                formKey: _nicNoKey,
                controller: _nicNoController,
                inputType: TextInputType.text,
                validator: MultiValidator([
                  RequiredValidator(errorText: "NIC is Required"),
                  EmailValidator(errorText: "Enter a Valid NIC Number")
                ]),
                iconData: Icons.perm_identity_outlined,
                hintText: "NIC"
            ),

            SizedBox(height: 20,),

            Container(
              width: 360,
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: AppDropDownMenu(
                locationList: Constants().vehicleTypeList,
                label: "",
                hintText: "Select Your Vehicle",
                onSelected: (vehicle) {
                  //selectedVehicle = vehicle;
                  //print(selectedVehicle);
                },
              ),
            ),

            SizedBox(height: 20,),

            AppInputField(
                formKey: _vehicleNoKey,
                controller: _vehicleNoController,
                inputType: TextInputType.text,
                validator: MultiValidator([
                  RequiredValidator(errorText: "Vehicle No. is Required"),
                  EmailValidator(errorText: "Enter a Valid Number")
                ]),
                iconData: Icons.numbers,
                hintText: "Vehicle No"
            ),


            SizedBox(height: 50,),

            Center(
              child: FilledRoundedButton(
                color: Constants.appColorAmberMoreDark,
                text: 'Register',
                clickEvent: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                widgetSize: WidgetSize.large,

              ),
            ),

            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
