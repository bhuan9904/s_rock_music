import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopPromoSectionWidget extends StatelessWidget {
  const TopPromoSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight * 0.425,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        gradient: LinearGradient(
          colors: [Color(0xFFA90140), Color(0xFF550120)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Search Bar + User Avatar
          Row(
            children: [
              Expanded(
                child: Container(
                  height: screenHeight * 0.05,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2F2F39),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/Search.png",
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "Search 'Punjabi Lyrics' ",
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF61616B),
                            fontSize: screenHeight * 0.017,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Image.asset(
                        'assets/images/line.png',
                        color: Colors.white38,
                        height: screenHeight * 0.025,
                        width: screenHeight * 0.025,
                      ),
                      const SizedBox(width: 10),
                      Image.asset(
                        'assets/images/mic1.png',
                        color: Colors.white,
                        height: screenHeight * 0.025,
                        width: screenHeight * 0.025,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Image.asset(
                "assets/images/user.png",
                width: screenWidth * 0.08,
                height: screenWidth * 0.08,
              ),
            ],
          ),

          SizedBox(height: screenHeight * 0.02),

          // Text Section
          Text(
            "Claim your",
            style: GoogleFonts.syne(
              color: Colors.white,
              fontSize: screenHeight * 0.025,
            ),
          ),
          Text(
            "Free Demo",
            style: GoogleFonts.lobster(
              color: Colors.white,
              fontSize: screenHeight * 0.06,
            ),
          ),
          Text(
            "for custom Music Production",
            style: GoogleFonts.syne(
              color: Colors.white,
              fontSize: screenHeight * 0.022,
            ),
          ),

          SizedBox(height: screenHeight * 0.015),

          // Bottom Row with CD, Button, Piano
          SizedBox(
            height: screenHeight * 0.12,
            width: double.infinity,
            child: Stack(
              children: [
                // CD Image - Left
                Positioned(
                  left: -20,
                  bottom: 0,
                  child: Image.asset(
                    "assets/images/cd.png",
                    width: screenWidth * 0.22,
                  ),
                ),

                // Book Now Button - Center
                Align(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.06,
                        vertical: screenHeight * 0.012,
                      ),
                    ),
                    child: Text(
                      "Book Now",
                      style: GoogleFonts.syne(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: screenHeight * 0.018,
                      ),
                    ),
                  ),
                ),

                // Piano Image - Right
                Positioned(
                  right: -27,
                  bottom: 0,
                  child: Image.asset(
                    "assets/images/piono.png",
                    width: screenWidth * 0.22,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}