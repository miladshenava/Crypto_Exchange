
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
class signUpScreen extends StatefulWidget {
  const signUpScreen({Key? key}) : super(key: key);

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _FormKey = GlobalKey<FormState>();
  bool isObsure = true;
 // late UserDataProvider userProvider;
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // userProvider = Provider.of<UserDataProvider>(context);
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Lottie.asset('images/waveloop.json',height: height * 0.2,width: double.infinity,fit: BoxFit.fill),
          SizedBox(height: height* 0.01,),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text('SignUp',style: GoogleFonts.ubuntu(fontSize: height*0.05,color: Theme.of(context).unselectedWidgetColor),),
          ),
          SizedBox(height: height* 0.01,),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text('Create Acount',style: GoogleFonts.ubuntu(fontSize: height*0.05,color: Theme.of(context).unselectedWidgetColor),),
          ),
          SizedBox(height: height* 0.03,),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Form(
              key: _FormKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'User Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      )
                    ),
                    controller: nameController,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'please inter user name';
                      }
                      else {
                        if(value.length < 4){
                        return 'at lastes 4 character';
                      }
                      else if(value.length > 10){
                        return ' maximum characters is 13';
                      }
                      }
                        return null;
                    }

                  ),
                  SizedBox(height: height* 0.01,),

                  TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: 'Gmail',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          )
                      ),
                      controller: emailController,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'please inter user name';
                        }
                        else {
                          if(value.length < 4){
                            return 'at lastes 4 character';
                          }
                          else if(value.length > 10){
                            return ' maximum characters is 13';
                          }
                        }
                        return null;
                      }

                  ),
                  SizedBox(height: height* 0.01,),
                  TextFormField(
                      obscureText: isObsure,
                      controller: passwordController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock_open),
                          hintText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          )
                      ),

                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'please inter user name';
                        }
                        else {
                          if(value.length < 4){
                            return 'at lastes 4 character';
                          }
                          else if(value.length > 10){
                            return ' maximum characters is 13';
                          }
                        }
                        return null;
                      }

                  ),
                  SizedBox(height: height* 0.02,),
                  // Consumer<UserDataProvider>(
                  //     builder: (context, userDataProvider, child){
                  //       switch(userDataProvider.registerStatus?.status){
                  //         case Status.LOADING:
                  //           return const CircularProgressIndicator();
                  //         case Status.COMPLETED:
                  //           // savedLogin(userDataProvider.registerStatus?.data);
                  //           WidgetsBinding.instance!.addPostFrameCallback((timeStamp) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const mainWrapper())));
                  //           return signupBtn();
                  //         case Status.ERROR:
                  //           return Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               signupBtn(),
                  //               const SizedBox(height: 5,),
                  //               Row(
                  //                 children: [
                  //                   const Icon(Icons.error,color: Colors.redAccent,),
                  //                   const SizedBox(width: 6,),
                  //                   Text(userDataProvider.registerStatus!.message,style: GoogleFonts.ubuntu(color: Colors.redAccent, fontSize: 15),),
                  //                 ],
                  //               ),
                  //             ],
                  //           );
                  //         default:
                  //           return signupBtn();
                  //       }
                  //     }
                  // ),
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
  Widget signupBtn(){
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        onPressed: () {
          // Validate returns true if the form is valid, or false otherwise.
          if (_FormKey.currentState!.validate()) {
            // userProvider.callRegisterApi(nameController.text, emailController.text, passwordController.text);
          }
        },
        child: const Text('Sign Up'),
      ),
    );
}

}
