import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:s_rocks_music/home/details_screen.dart';
import 'package:s_rocks_music/home/service_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MusicTileWidget extends StatelessWidget {
  const MusicTileWidget({super.key, required this.service});
  final ServiceModel service;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      height: 80,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          Skeleton.ignore(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Opacity(
                opacity: 0.1,
                child:
                    service.backgroundImage.isNotEmpty
                        ? Image.asset(
                          service.backgroundImage,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        )
                        : const SizedBox.shrink(),
              ),
            ),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                // we can use the get.to() from the getx package... for easy understandig...
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailsScreen(serviceName: service.title),
                  ),
                );
              },

              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                leading:
                    Image.asset(service.leadingIcon),
                trailing:
                    Image.asset("assets/images/arrow_right.png"),
                title: Text(
                  service.title,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  service.subtitle,
                  maxLines: 1,
                  style: GoogleFonts.poppins(
                    color: Colors.white70,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
