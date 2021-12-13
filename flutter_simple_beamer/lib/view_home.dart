import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewHome extends StatefulWidget {
  final String menuIndex;
  const ViewHome({
    Key? key,
    required this.menuIndex,
  }) : super(key: key);

  @override
  State<ViewHome> createState() => _ViewHomeState();
}

class _ViewHomeState extends State<ViewHome> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      builder: () => Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Simple Beamer'),
        ),
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return Row(
      children: [
        _menuSection(),
        _content(),
      ],
    );
  }

  Widget _menuSection() {
    return Container(
      width: 300.w,
      height: double.infinity,
      color: Colors.blue[700],
      child: Column(
        children: [
          _menuHeader(),
          SizedBox(height: 50.h),
          InkWell(
            onTap: () => context.beamToNamed('/0'),
            child: _menuItem('Menu 0'),
          ),
          InkWell(
            onTap: () => context.beamToNamed('/1'),
            child: _menuItem('Menu 1'),
          ),
          InkWell(
            onTap: () => context.beamToNamed('/2'),
            child: _menuItem('Menu 2'),
          ),
        ],
      ),
    );
  }

  Widget _menuHeader() {
    return Container(
      width: double.infinity,
      height: 300.h,
      color: Colors.blue,
      child: const Center(
          child: Text(
        'Header',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      )),
    );
  }

  Widget _menuItem(String menuName) {
    return Container(
      width: double.infinity,
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          menuName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _content() {
    return Expanded(child: Center(child: _board()));
  }

  Widget _board() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.sp)),
      elevation: 8.sp,
      child: SizedBox(
        width: 300.sp,
        height: 300.sp,
        child: Center(
          child: Text(
            'Widget ${widget.menuIndex}',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 25.sp,
            ),
          ),
        ),
      ),
    );
  }
}
