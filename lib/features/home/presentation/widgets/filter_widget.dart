import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/features/home/presentation/blocs/filter_bloc/filter_bloc.dart';
import 'package:oru_mobiles/features/home/presentation/widgets/filter_check_list.dart';
import 'package:oru_mobiles/features/home/presentation/widgets/filter_label_widget.dart';
import 'package:oru_mobiles/themes/app_text_themes.dart';
import 'package:oru_mobiles/ui/custom_button.dart';
import 'package:oru_mobiles/utils/custom_spacers.dart';

class FilterWidget extends StatefulWidget {
  final FilterBloc filterBloc;
  const FilterWidget({super.key, required this.filterBloc});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  late FilterBloc _filterBloc;

  @override
  void initState() {
    _filterBloc = widget.filterBloc;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      buildWhen: (previous, current) => !_filterBloc.isProductsState,
      bloc: _filterBloc,
      builder: (context, state) {
        return Container(
          height: MediaQuery.of(context).size.height * .8,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          child: Stack(
            children: [
              _buildHeader(),
              if (state is FilterLoaded || _filterBloc.filters.isNotEmpty) ...[
                _buildLeftSide(),
                _buildRightSide(),
              ],
              if (state is FilterLoading) ...[
                const Center(child: CircularProgressIndicator())
              ],
              if (state is FilterError) ...[Center(child: Text(state.message))],
              _buildBottomContainer(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLeftSide() {
    return Positioned(
      top: 64.h,
      bottom: 64.h,
      child: Container(
        width: MediaQuery.of(context).size.width * .4,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            right: BorderSide(
              color: ColorPalette.lightGrey,
              width: 1,
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (int i = 0; i < _filterBloc.filters.length; i++)
                FilterLabelWidget(
                  onPressed: () {
                    _filterBloc.parentLabelChanged(i);
                  },
                  filter: _filterBloc.filters[i],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRightSide() {
    return Positioned(
      top: 64.h,
      bottom: 64.h,
      right: 0,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .6,
        child: SingleChildScrollView(
          child: FilterCheckList(
            filterLabelEntity:
                _filterBloc.filters[_filterBloc.parentIndex].options,
            onChanged: (p0, p1) {
              _filterBloc.childLabelChanged(_filterBloc.parentIndex, p0, p1);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBottomContainer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 64.h,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: ColorPalette.lightGrey,
              width: 1,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            CustomSpacers.width32,
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                _filterBloc.resetFilters(isReset: true);
              },
              child: Text(
                'Clear all',
                style: AppTextThemes.of(context).bodyMedium?.copyWith(
                      color: ColorPalette.action,
                    ),
              ),
            ),
            const Spacer(),
            CustomButton(
              dWidth: 140.w,
              dHeight: 40,
              strButtonText: 'Apply',
              buttonAction: () {
                Navigator.pop(context);
                _filterBloc.applyFilters();
              },
              buttonType: ButtonType.primary,
              borderColor: Colors.transparent,
              bgColor: ColorPalette.action,
              dCornerRadius: 8,
              textColor: ColorPalette.darktext,
              textStyle: AppTextThemes.of(context).bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        height: 64.h,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          border: Border(
            bottom: BorderSide(
              color: ColorPalette.lightGrey,
              width: 1,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Text(
              'Filters',
              style: AppTextThemes.of(context).titleLarge?.copyWith(
                    color: ColorPalette.darkestGrey,
                  ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                _filterBloc.resetFilters();
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.close,
                color: ColorPalette.darktext,
              ),
            )
          ],
        ),
      ),
    );
  }
}
