import 'package:capstone_alterra_flutter/screen/auth/login_page.dart';
import 'package:capstone_alterra_flutter/screen/membership/all_membership_screen.dart';
import 'package:capstone_alterra_flutter/screen/membership/my_membership_screen.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:capstone_alterra_flutter/util/membership.dart';
import 'package:capstone_alterra_flutter/util/user_token.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Membership? membership = Membership.platinum;

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: primaryBase,
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0,
        toolbarHeight: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _topWidget(membership: membership),
            _membershipWidget(context: context, membership: membership),
            _myAccountWidget(),
            _myAboutWidget(context),
          ],
        ),
      ),
    );
  }
}

///A Widget for top position of screen
Widget _topWidget({required Membership? membership}) {
  return Stack(
    children: [
      Container(
        color: Colors.white,
        alignment: Alignment.topCenter,
        height: 160 + 40,
        width: double.infinity,
        child: Container(
          height: 160,
          width: double.infinity,
          decoration: BoxDecoration(
              color: primaryBase,
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(10))),
          child: Column(
            children: [
              Expanded(
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),

                  ///Profile Picture, Name, Email, Member created date
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryDarker,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            UserToken.userProfileModel!.name!,
                            style: kSubtitle1.apply(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            UserToken.userProfileModel!.email!,
                            style: kBody2.apply(color: Colors.white),
                          ),
                          (membership != null)
                              ? Column(
                                  children: [
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      'Anggota sejak 11/2022',
                                      style: kBody2.apply(color: Colors.white),
                                    )
                                  ],
                                )
                              : const SizedBox()
                        ],
                      )
                    ],
                  ),
                )),
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
      Positioned.fill(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: 80,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(1, 2),
                      blurRadius: 6,
                      color: Color(0x1A000000))
                ]),

            ///Activity History Button & Order History Button
            child: Row(
              children: [
                ///Activity History
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage('assets/profile_page/history1.png'),
                        height: 30,
                        width: 30,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Riwayat Aktivitas',
                        style: kBody2,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage('assets/profile_page/history2.png'),
                        height: 30,
                        width: 30,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Riwayat Pemesanan',
                        style: kBody2,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )
    ],
  );
}

///A widget that contain Membership menu
Widget _membershipWidget(
    {required BuildContext context, required Membership? membership}) {
  ///Text for membership button
  late String membershipButtonText;

  switch (membership) {
    case Membership.bronze:
      {
        membershipButtonText = 'Member Bronze';
      }
      break;

    case Membership.silver:
      {
        membershipButtonText = 'Member Silver';
      }
      break;

    case Membership.gold:
      {
        membershipButtonText = 'Member Gold';
      }
      break;

    case Membership.platinum:
      {
        membershipButtonText = 'Member Platinum';
      }
      break;

    default:
      {
        membershipButtonText = 'Aktivasi Membership';
      }
      break;
  }

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16),
    width: double.infinity,
    child: Column(
      children: [
        const SizedBox(
          height: 32,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Membership',
              style: kSubtitle1,
            )),
        const SizedBox(
          height: 16,
        ),

        ///Show text when membership not activated
        (membership == null)
            ? Column(
                children: [
                  Text(
                    'Belum ada membership',
                    style: kBody2.apply(color: whiteDarkest),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              )
            : const SizedBox(),

        ///Membership Activation Button
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => (membership != null)
                        ? MyMembershipScreen(
                            membership: membership,
                          )
                        : const AllMembershipScreen(),
                  ));
            },
            style: ButtonStyle(
                elevation: const MaterialStatePropertyAll(0),
                backgroundColor: MaterialStatePropertyAll(primaryLightest),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    side: BorderSide(color: primaryBase)))),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  (membership != null)
                      ? Row(
                          children: const [
                            Image(
                                image: AssetImage(
                                    'assets/profile_page/crown.png')),
                            SizedBox(
                              width: 8,
                            )
                          ],
                        )
                      : const SizedBox(),
                  Expanded(
                    child: Text(
                      membershipButtonText, //"Aktivasi Membership"
                      style: kBody2.apply(color: primaryBase),
                    ),
                  ),
                  Icon(
                    Icons.navigate_next,
                    color: primaryBase,
                  )
                ],
              ),
            )),
        const SizedBox(
          height: 48,
        ),
      ],
    ),
  );
}

///A Widget that contain My Account menu
Widget _myAccountWidget() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    width: double.infinity,
    child: Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Akun Saya',
            style: kSubtitle1,
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        _profileItemButton(
            icon: SvgPicture.asset('assets/profile_page/note_pencil.svg'),
            title: 'Edit Profile'),
        _profileItemButton(
            icon: SvgPicture.asset('assets/profile_page/lock_password.svg'),
            title: 'Ganti Password'),
        _profileItemButton(
            icon: SvgPicture.asset('assets/profile_page/user_block.svg'),
            title: 'Cuti/Freeze Membership'),
        _profileItemButton(
            icon: SvgPicture.asset('assets/profile_page/delete_dismiss.svg'),
            title: 'Hapus Akun'),
        const SizedBox(
          height: 48,
        ),
      ],
    ),
  );
}

///A Widget that contain About menu
Widget _myAboutWidget(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    width: double.infinity,
    child: Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Tentang',
            style: kSubtitle1,
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        _profileItemButton(
            icon: SvgPicture.asset('assets/profile_page/note_text.svg'),
            title: 'Syarat & Ketentuan'),
        _profileItemButton(
            icon: Icon(
              Icons.privacy_tip_outlined,
              color: primaryBase,
            ),
            title: 'Kebijakan Privasi'),
        _profileItemButton(
            icon: SvgPicture.asset('assets/profile_page/star_settings.svg'),
            title: 'Beri Kami Penilaian'),
        _profileItemButton(
            icon: SvgPicture.asset('assets/profile_page/logout.svg'),
            title: 'Keluar',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  actionsPadding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/profile_page/logout_dialog.svg'),
                      Text(
                        'Keluar',
                        style: kSubtitle1,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Kamu yakin ingin keluar?',
                        style: kBody1.apply(color: const Color(0xFF9F9696)),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                  actions: [
                    Row(
                      children: [
                        ///Cancel button
                        Expanded(
                          child: SizedBox(
                            height: 48,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  fixedSize: const MaterialStatePropertyAll(
                                      Size(double.infinity, double.infinity)),
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                          Colors.white),
                                  elevation: const MaterialStatePropertyAll(0),
                                  side: MaterialStatePropertyAll(
                                      BorderSide(color: primaryBase)),
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)))),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'BATAL',
                                style: kButton.apply(color: primaryBase),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(
                          width: 16,
                        ),

                        ///Yes button
                        Expanded(
                          child: SizedBox(
                            height: 48,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  fixedSize: const MaterialStatePropertyAll(
                                      Size(double.infinity, double.infinity)),
                                  backgroundColor:
                                      MaterialStatePropertyAll(primaryBase),
                                  elevation: const MaterialStatePropertyAll(0),
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)))),
                              onPressed: () async {
                                UserToken.accessToken = UserToken().toString();
                                UserToken.deleteRefreshToken();
                                // await SystemNavigator.pop();
                                Navigator.pushAndRemoveUntil(
                                  context, 
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  ), 
                                  (route) => false
                                );
                              },
                              child: Text(
                                'YA',
                                style: kButton.apply(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }),
      ],
    ),
  );
}

///A Widget that contain profile item button
Widget _profileItemButton({
  required Widget icon,
  required String title,
  void Function()? onPressed,
}) {
  return Container(
    decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(color: whiteDark),
            top: BorderSide(color: whiteDark))),
    width: double.infinity,
    child: ElevatedButton(
      style: const ButtonStyle(
          elevation: MaterialStatePropertyAll(0),
          backgroundColor: MaterialStatePropertyAll(Colors.white),
          fixedSize: MaterialStatePropertyAll(Size(double.infinity, 50)),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ))),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icon,
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: Text(
            title,
            style: kBody2.apply(color: blackLighter),
          )),
          Icon(
            Icons.navigate_next,
            color: primaryBase,
          )
        ],
      ),
    ),
  );
}
