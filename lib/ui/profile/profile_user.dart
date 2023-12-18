import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:submission02/data/base/components/sliver_delegate.dart';
import 'package:submission02/data/const/constants.dart';
import 'package:submission02/ui/home/home_screen.dart';
import 'package:submission02/ui/profile/profile_user_controller.dart';
import 'package:submission02/ui/search/search_screen.dart';
import 'package:submission02/utils/resource_helper/assets.dart';
import 'package:submission02/utils/resource_helper/sizes.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/resource_helper/colors.dart';
import '../../utils/resource_helper/fonts.dart';


var profileUsers = Get.put(ProfileUserController());
class ProfileUserScreen extends GetView<ProfileUserController> {
  const ProfileUserScreen ({Key? key}) : super(key: key);
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Get.isDarkMode
              ? CustomColors.Jet
              : CustomColors.DarkOrange,
          elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(12),
          child: Image.asset(ImageAssets.imageLeading),),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Tooltip(
              message: Constants.search,
              child: Material(
                color: Get.isDarkMode
                    ? CustomColors.Jet
                    : CustomColors.DarkOrange,
                child: InkWell(
                  onTap: () => Get.to(
                    const SearchRestaurantScreen(),
                  ),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverAppBarDelegate(
                minHeight: 50,
                maxHeight: 50,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color:Get.isDarkMode
                      ? CustomColors.Jet
                      : CustomColors.OrangePeel,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(Constants.detailProfile, style: TextStyle( color: Get.isDarkMode
                      ? CustomColors.White
                      : CustomColors.White, fontFamily: Constants.helvetica,fontSize:displayWidth(context) * FontSize.s005),),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 24),
                child: Image(
                  image: AssetImage('assets/images/profile.png'), width: 150, height: 150),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            const SliverToBoxAdapter(
              child: Center(
                child: Text(
                  Constants.nameProfile,
                 style: TextStyle(
                  color:CustomColors.OrangePeel,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                    Constants.descriptionProfile,
                  maxLines: 10,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color:CustomColors.OrangePeel
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 8)),
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                height: 40,
                margin: EdgeInsets.all(8),
                child:  ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Get.isDarkMode
                      ? CustomColors.Jet
                      : CustomColors.DarkOrange),
                  onPressed: () {launchUrlStart(url: "https://www.linkedin.com/in/nandaadisaputra/"); },
                  child: Text(Constants.visitLinkedin, style: TextStyle(color: Get.isDarkMode
                      ? CustomColors.White
                      : CustomColors.White, fontFamily: Constants.helvetica, fontSize: displayWidth(context) * FontSize.s005),)
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Get.isDarkMode
              ? CustomColors.EerieBlack
              : CustomColors.DarkOrange,
          elevation: 20.0,
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 60.0,
                  child: InkWell(
                    onTap: () => Get.to(
                      const HomeScreen(),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.home, color: Colors.white),
                        Text(Constants.home, style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 60.0,
                  child: InkWell(
                    onTap: () => Get.to(
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Under Development"),
                      )),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite, color: Colors.white),
                        Text(Constants.addFavorite, style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 60.0,
                  child: InkWell(
                    onTap: () => Get.to(
                      const ProfileUserScreen(),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person, color: Colors.white),
                        Text(Constants.profileUsers, style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
    Future<void> launchUrlStart({required String url}) async {
      if (!await launchUrl(Uri.parse(url))) {
        throw 'Could not launch $url';
      }
    }
  }