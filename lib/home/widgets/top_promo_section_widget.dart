import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TopPromoSectionWidget extends StatelessWidget {
  const TopPromoSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.r),
          bottomRight: Radius.circular(25.r),
        ),
        gradient: const LinearGradient(
          colors: [Color(0xFFA90140), Color(0xFF550120)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: EdgeInsets.fromLTRB(0, 22.h, 0, 14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Search Bar + User Avatar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                // Custom Styled Search Container
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2F2F39),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/Search.png",
                          color: Colors.white,
                          height: 20.h,
                          width: 20.h,
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            "Search 'Punjabi Lyrics'",
                            style: GoogleFonts.poppins(
                              color: const Color(0xFF61616B),
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        Image.asset(
                          'assets/images/line.png',
                          color: Colors.white38,
                          height: 20.h,
                          width: 20.h,
                        ),
                        SizedBox(width: 10.w),
                        Image.asset(
                          'assets/images/mic1.png',
                          color: Colors.white,
                          height: 20.h,
                          width: 20.h,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Image.asset(
                  "assets/images/user.png",
                  width: 32.w,
                  height: 32.w,
                ),
              ],
            ),
          ),

          SizedBox(height: 16.h),

          // Text Section
          Text(
            "Claim your",
            style: GoogleFonts.syne(color: Colors.white, fontSize: 18.sp),
          ),
          Text(
            "Free Demo",
            style: GoogleFonts.lobster(color: Colors.white, fontSize: 38.sp),
          ),
          Text(
            "for custom Music Production",
            style: GoogleFonts.syne(color: Colors.white, fontSize: 16.sp),
          ),

          SizedBox(height: 14.h),

          // CD + Button + Piano
          SizedBox(
            height: 90.h,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  left: -20.w,
                  bottom: 0,
                  child: Image.asset("assets/images/cd.png", width: 80.w),
                ),
                Align(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 18.w,
                        vertical: 10.h,
                      ),
                    ),
                    child: Text(
                      "Book Now",
                      style: GoogleFonts.syne(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: -27.w,
                  bottom: 0,
                  child: Image.asset("assets/images/piono.png", width: 80.w),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
