import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oru_mobiles/core/constants/app_assets.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/core/helpers/scaffold_helper.dart';
import 'package:oru_mobiles/core/helpers/user_helper.dart';
import 'package:oru_mobiles/features/home/presentation/bloc/home_bloc.dart';
import 'package:oru_mobiles/features/home/presentation/widgets/best_deals_widget.dart';
import 'package:oru_mobiles/features/home/presentation/widgets/carousel_slider.dart';
import 'package:oru_mobiles/features/home/presentation/widgets/custom_side_bar.dart';
import 'package:oru_mobiles/features/home/presentation/widgets/faq_widget.dart';
import 'package:oru_mobiles/features/home/presentation/widgets/persistent_header.dart';
import 'package:oru_mobiles/features/home/presentation/widgets/product_grid.dart';
import 'package:oru_mobiles/features/home/presentation/widgets/top_brands_widget.dart';
import 'package:oru_mobiles/features/home/presentation/widgets/what_on_your_mind_widget.dart';
import 'package:oru_mobiles/injection_container/injection_container.dart';
import 'package:oru_mobiles/routes/app_routes.dart';
import 'package:oru_mobiles/routes/custom_navigator.dart';
import 'package:oru_mobiles/themes/app_text_themes.dart';
import 'package:oru_mobiles/ui/app_logo.dart';
import 'package:oru_mobiles/ui/custom_button.dart';
import 'package:oru_mobiles/ui/shimmer_container.dart';
import 'package:oru_mobiles/utils/custom_spacers.dart';

var scaffoldKey = GlobalKey<ScaffoldState>();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _searchTC;
  late HomeBloc _bloc;

  @override
  void initState() {
    _searchTC = TextEditingController();
    _bloc = sl<HomeBloc>();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        _bloc.getMobileBrands().then((value) => _bloc.getFaqs());
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const CustomSideBar(),
        key: scaffoldKey,
        body: BlocConsumer<HomeBloc, HomeState>(
          bloc: _bloc,
          listener: (context, state) {
            if (state is HomeErrorState) {
              ScaffoldHelper.showSnackBar(
                context: context,
                message: state.message,
                type: SnakBarType.error,
              );
            }
          },
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                _buildSliverAppBar(),
                PersistentHeader(
                  searchController: _searchTC,
                ),
                _buildAdaptorBox(const CustomCarouselSlider()),
                _buildAdaptorBox(CustomSpacers.height20),
                _buildAdaptorBox(const WhatsOnYourMindWidget()),
                if (state is HomeLoadingState) ...[
                  _buildAdaptorBox(
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomSpacers.height20,
                        Row(
                          children: [
                            Text(
                              'Top Brands',
                              style: AppTextThemes.of(context)
                                  .titleLarge
                                  ?.copyWith(
                                    color: ColorPalette.darkestGrey,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: ColorPalette.darktext,
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .15,
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) =>
                                CustomSpacers.width16,
                            itemBuilder: (context, index) =>
                                const ShimmerContainer(
                              height: 72,
                              width: 72,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorPalette.borderColorLight,
                              ),
                            ),
                            itemCount: 6,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                if (state is! HomeLoadingState &&
                    _bloc.mobileBrands.isNotEmpty) ...[
                  _buildAdaptorBox(CustomSpacers.height20),
                  _buildAdaptorBox(TopBrandsWidget(brands: _bloc.mobileBrands)),
                ],
                _buildAdaptorBox(CustomSpacers.height20),
                _buildAdaptorBox(
                  const BestDealsWidget(),
                ),
                const SliverToBoxAdapter(child: ProductGrid()),
                _buildAdaptorBox(CustomSpacers.height20),
                if (state is GetFaqLoadingState) ...[
                  _buildAdaptorBox(const FaqSkelTon()),
                ],
                if (_bloc.faqs.isNotEmpty) ...[
                  _buildAdaptorBox(CustomSpacers.height20),
                  _buildAdaptorBox(
                    FAQWidget(
                      faqs: _bloc.faqs,
                    ),
                  ),
                ],
                _buildAdaptorBox(CustomSpacers.height120),
              ],
            );
          },
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildAdaptorBox(Widget child) {
    return SliverToBoxAdapter(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 16), // Apply 16px padding
        child: child,
      ),
    );
  }

  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
      floating: false,
      snap: false,
      elevation: 0,
      leading: const SizedBox.shrink(),
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 5),
        child: FlexibleSpaceBar(
          titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
          title: Row(
            children: [
              GestureDetector(
                onTap: () => ScaffoldHelper.toggleDrawer(),
                child: SvgPicture.asset(AppAssets.hamBurgerIcon),
              ),
              CustomSpacers.width10,
              const AppLogo(width: 50, height: 25),
              const Spacer(),
              const Text(
                'India',
                style: TextStyle(
                  color: ColorPalette.darktext,
                  fontSize: 12,
                ),
              ),
              CustomSpacers.width8,
              const Icon(Icons.location_on_outlined,
                  color: ColorPalette.darktext),
              CustomSpacers.width12,
              if (UserHelper.getIsloggedIn() == false) ...[
                CustomButton(
                  strButtonText: 'Login',
                  buttonAction: () => CustomNavigator.pushAndRemoveUntil(
                    context,
                    AppRouter.login,
                  ),
                  bgColor: ColorPalette.action,
                  borderColor: ColorPalette.action,
                  dHeight: 30,
                  textStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: ColorPalette.darktext,
                  ),
                  dWidth: 66,
                ),
              ],
              if (UserHelper.getIsloggedIn() == true) ...[
                const Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.black,
                ),
              ],
              CustomSpacers.width10,
            ],
          ),
        ),
      ),
    );
  }
}
