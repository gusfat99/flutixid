import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutix/bloc/blocs.dart';
import 'package:flutix/bloc/ticket_bloc.dart';
import 'package:flutix/services/services.dart';
import 'package:flutix/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../shared/shared.dart';
import 'package:flutix/extensions/extensions.dart';
import 'package:flutix/models/models.dart';
import 'package:random_string/random_string.dart';
import 'package:qr_flutter/qr_flutter.dart';

part 'wrapper.dart';
part 'wrapper_order.dart';
part 'signin_page.dart';
part 'main_page.dart';
part 'tickets_page.dart';
part 'splash_page.dart';
part 'new_movies_page.dart';
part 'signup_page.dart';
part 'preference_page.dart';
part 'account_confirm_page.dart';
part 'detail_movie_page.dart';
part 'select_schedule_page.dart';
part 'select_seat_page.dart';
part 'checkout_order_page.dart';
part 'topup_page.dart';
part 'successfull_page.dart';
part 'ticket_details_page.dart';
