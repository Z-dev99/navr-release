import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:navr_app/features/dashboard/screens/dashboard_screen.dart';
import 'package:navr_app/features/main/data/main_data_api_client.dart';

class MainScreenHeader extends StatelessWidget {
  final List<CategoryModel> categories;
  final String? selectedCategoryId;
  final Function(String?) onCategorySelected;
  final TextEditingController controller;

  const MainScreenHeader({
    super.key,
    required this.categories,
    required this.selectedCategoryId,
    required this.onCategorySelected,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: <Widget>[
          DashboardScreenSearchBarInput(controller: controller),
          SizedBox(height: 12),
          DashboardScreenSearchBarCategories(
            categories: categories,
            selectedCategoryId: selectedCategoryId,
            onCategorySelected: onCategorySelected,
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}

class DashboardScreenSearchBarCategories extends StatelessWidget {
  final List<CategoryModel> categories;
  final String? selectedCategoryId;
  final Function(String?) onCategorySelected;

  const DashboardScreenSearchBarCategories({
    super.key,
    required this.categories,
    required this.selectedCategoryId,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    final gradient = LinearGradient(
      colors: [Color(0xffEA4747), Color(0xff4D0808)],
    );
    context.locale;
    return SizedBox(
      height: 32,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
         physics: ClampingScrollPhysics(),
        itemBuilder: (context, i) {
          final category = categories[i];
          final isSelected = category.id.toString() == selectedCategoryId;
          return GestureDetector(
            onTap: () => onCategorySelected(category.id.toString()),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: isSelected ? Colors.red.shade100 : Color(0xfffff7f7),
                border: GradientBoxBorder(gradient: gradient),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              alignment: Alignment.center,
              child: Text(
                context.locale.languageCode == 'ru'
                    ? category.name ?? 'Error'
                    : category.nameUz ?? 'Error',
                style: TextStyle(
                  fontSize: 14,
                  color: isSelected ? Color(0xff661212) : Colors.grey.shade700,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (_, __) => SizedBox(width: 10),
        itemCount: categories.length,
      ),
    );
  }
}

class DashboardScreenSearchBarInput extends StatefulWidget {
  final TextEditingController controller;
  const DashboardScreenSearchBarInput({super.key, required this.controller});

  @override
  State<DashboardScreenSearchBarInput> createState() =>
      _DashboardScreenSearchBarInputState();
}

class _DashboardScreenSearchBarInputState
    extends State<DashboardScreenSearchBarInput> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.locale;
    return Container(
      height: 52,
      margin: const EdgeInsets.only(left: 16, right: 16, top: 12),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                InnerShadow(
                  blur: 8,
                  color: const Color.fromRGBO(56, 0, 0, .08),
                  offset: const Offset(0, 2),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      ),
                    ),
                  ),
                ),
                if (widget.controller.text.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      tr('main.search'),
                      style: const TextStyle(
                        color: Color.fromRGBO(129, 0, 0, .2),
                        fontSize: 12,
                      ),
                    ),
                  ),
                TextField(
                  controller: widget.controller,
                  style: const TextStyle(
                    color: Color.fromRGBO(129, 0, 0, 1),
                    fontSize: 12,
                  ),
                  cursorColor: const Color.fromRGBO(129, 0, 0, .8),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    isCollapsed: true,
                  ),
                  maxLines: 1,
                ),
              ],
            ),
          ),
          Container(
            width: 44,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[Color(0xffea4747), Color(0xff4d0808)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                topLeft: Radius.circular(2),
                bottomRight: Radius.circular(8),
                bottomLeft: Radius.circular(2),
              ),
            ),
            child: IconButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
              },
              color: Colors.white,
              style: const ButtonStyle(
                overlayColor: WidgetStatePropertyAll(Colors.transparent),
              ),
              iconSize: 18,
              icon: SvgPicture.asset('assets/icons/search.svg', width: 16),
            ),
          ),
        ],
      ),
    );
  }
}
