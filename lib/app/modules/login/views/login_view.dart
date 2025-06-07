import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tenova/app/routes/app_pages.dart';


class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
width: MediaQuery.of(context).size.width * 1.0,
  height: MediaQuery.of(context).size.height * 0.5, 
            color: Color(0XFFC8D7D7),
            child: Image.asset('assets/logo/logo-p.png'),
          ),

          // FORM LOGIN
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height - 310,
              padding: const EdgeInsets.all(50.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40)), 
                            
              ),
              
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF143C3C),
                      ),
                    ),
                    SizedBox(height: 40),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Username", 
                        hintStyle: TextStyle(color: Color(0xFF143C3C)),
                        filled: true,
                        fillColor:
                            Color(0xFFC8D7D7), // boleh kamu ubah atau hapus
                        prefixIcon: Icon(Icons.person, color: Color(0xFF143C3C)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide
                              .none, // ← ini yang menghilangkan garis tepi
                        ),
                      ),
                    ),
                    SizedBox(height: 18),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "NISN",
                        hintStyle: TextStyle(color: Color(0xFF143C3C)),
                        filled: true,
                        fillColor:
                            Color(0xFFC8D7D7),
                        prefixIcon: Icon(Icons.credit_card, color: Color(0xFF143C3C)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 18),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(color: Color(0xFF143C3C)),
                        filled: true,
                        fillColor:
                            Color(0xFFC8D7D7),
                        prefixIcon: Icon(Icons.email, color: Color(0xFF143C3C)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    SizedBox(height: 34),
                    ElevatedButton(
                      onPressed: () {
                        Get.offNamed(Routes.HOME);

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF143C3C),// Warna tombol
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20), // <-- Radius sudut
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 80, vertical: 14),
                      ),
                          child: Text("Login", style: TextStyle(color: Colors.white)),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
