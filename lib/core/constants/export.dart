/// Flutter Imports
library;

export 'dart:io';
export 'dart:convert';
export 'dart:async';
export 'dart:math';

export 'package:flutter/material.dart';
export 'package:flutter/services.dart';
export 'package:flutter/foundation.dart';

/// Lib Imports

/// Packages Imports
export 'package:size_adapter/size_adapter.dart';
export 'package:google_fonts/google_fonts.dart';
export 'package:go_router/go_router.dart';

/// App
///-- Models
///---- Custom

///---- Request
///---- Response

///-- Services
///---- Remote

///---- Repository

///-- provider

///-- Views
export 'package:login_screen_task/app/view/splash/splash_view.dart';
export 'package:login_screen_task/app/view/login/login_view.dart';
export 'package:login_screen_task/app/view/home/home_view.dart';

///---- Components

///-- Widgets
export 'package:login_screen_task/app/widget/text_form_field_widget.dart';
export 'package:login_screen_task/app/widget/text_view_widget.dart';
export 'package:login_screen_task/app/widget/sizedBox_widget.dart';
export 'package:login_screen_task/app/widget/button_widget.dart';
export 'package:login_screen_task/app/widget/app_bar_widget.dart';

/// Config
///-- Router
export 'package:login_screen_task/config/router/route_names.dart';
export 'package:login_screen_task/config/router/app_router.dart';

///-- Theme
export 'package:login_screen_task/config/theme/text_styles.dart';
export 'package:login_screen_task/config/theme/app_theme.dart';

/// Core
///-- Constants
export 'package:login_screen_task/core/constants/app_colors.dart';
export 'package:login_screen_task/core/constants/strings_resource.dart';
export 'package:login_screen_task/core/extensions/widget_ext.dart';
export 'package:login_screen_task/core/constants/images_resource.dart';

///-- Enums

///-- Extensions

///-- Services
export 'package:login_screen_task/core/Services/registerall_provider.dart';

///-- Utils
export 'package:login_screen_task/core/utils/validation.dart';

///---- Api Utils
export 'package:login_screen_task/core/Services/api_endpoints.dart';
