import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:s_rocks_music/home/details_screen.dart';
import 'package:s_rocks_music/home/home_view_model.dart';
import 'package:s_rocks_music/home/widgets/music_tile_widget.dart';
import 'package:s_rocks_music/home/widgets/top_promo_section_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'service_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<HomeViewModel>(context, listen: false).fetchServices();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);
    final services = viewModel.services;
    final isLoading = viewModel.isLoading;

    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: SafeArea(
        child: Column(
          children: [
            TopPromoSectionWidget(),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Hire hand-picked Pros for popular music services",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Show loading or services list
            Expanded(
              child:
                 !isLoading && services.isEmpty ? Container() : Skeletonizer(
                        enabled: isLoading,
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: services.isEmpty ? 4 : services.length,
                          itemBuilder: (context, index) {
                            final ServiceModel service = services.isEmpty ? ServiceModel.mock() : services[index];
                            // DEBUG LOGGING
                            print("Item $index:");
                            print("Title: ${service.title}");
                            print("Subtitle: ${service.subtitle}");
                            print("Leading Icon: ${service.leadingIcon}");
                            print("Trailing Icon: ${service.trailingIcon}");
                            print("Background Image: ${service.backgroundImage}");
                        
                            return MusicTileWidget(service: service);
                          },
                        ),
                      ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF0F0F0F),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white54,
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset("assets/images/home2.png", width: 36, height: 36),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Image.asset("assets/images/news2.png", width: 36, height: 36),
          label: "News",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/trackbox2.png",
            width: 36,
            height: 36,
          ),
          label: "TrackBox",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/projects2.png",
            width: 36,
            height: 36,
          ),
          label: "Projects",
        ),
      ],
    );
  }
}
