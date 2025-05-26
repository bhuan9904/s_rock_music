import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:s_rocks_music/home/home_view_model.dart';
import 'package:s_rocks_music/home/widgets/music_tile_widget.dart';
import 'package:s_rocks_music/home/widgets/navigation_bar_widget.dart';
import 'package:s_rocks_music/home/widgets/top_promo_section_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:s_rocks_music/home/service_model.dart';
import 'package:s_rocks_music/locator.dart'; // import locator

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    // fetch data after widget builds
    Future.microtask(() {
      locator<HomeViewModel>().fetchServices();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>.value(
      value: locator<HomeViewModel>(),
      child: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          final services = viewModel.services;
          final isLoading = viewModel.isLoading;

          return Scaffold(
            backgroundColor: const Color(0xFF0F0F0F),
            body: SafeArea(
              child: Column(
                children: [
                  const TopPromoSectionWidget(),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Hire hand-picked Pros for popular music services",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.syne(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: !isLoading && services.isEmpty
                        ? const Center(
                            child: Text(
                              "No services found.",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        : Skeletonizer(
                            enabled: isLoading,
                            child: ListView.builder(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              itemCount: services.isEmpty ? 4 : services.length,
                              itemBuilder: (context, index) {
                                final service = services.isEmpty
                                    ? ServiceModel.mock()
                                    : services[index];
                                return MusicTileWidget(service: service);
                              },
                            ),
                          ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: const NavigationBarWidget(),
          );
        },
      ),
    );
  }
}
