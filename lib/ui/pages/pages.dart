import 'dart:developer';
import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutix/bloc/blocs.dart';
import 'package:flutix/services/services.dart';
import 'package:flutix/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../shared/shared.dart';
import 'package:flutix/extensions/extensions.dart';
import 'package:flutix/models/models.dart';

part 'wrapper.dart';
part 'signin_page.dart';
part 'main_page.dart';
part 'splash_page.dart';
part 'new_movies_page.dart';
part 'signup_page.dart';
part 'preference_page.dart';
part 'account_confirm_page.dart';
