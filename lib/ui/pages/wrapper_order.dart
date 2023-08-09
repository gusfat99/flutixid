part of 'pages.dart';

class WrapperOrder extends StatefulWidget {
  const WrapperOrder({super.key});

  @override
  State<WrapperOrder> createState() => _WrapperOrderState();
}

class _WrapperOrderState extends State<WrapperOrder> {
  @override
  Widget build(BuildContext context) {
    auth.User? firebaseUser = Provider.of<auth.User?>(context);

    if (firebaseUser == null) {
      if (prevPageEvent is! GoToSplashPage) {
        prevPageEvent = GoToSplashPage();
        context.read<PageBloc>().add(prevPageEvent!);
      }
    } else {
      if (prevPageEvent is! GoMainPage) {
        prevPageEvent = GoMainPage();

        context.read<UserBloc>().add(LoadUser(id: firebaseUser.uid));
        context.read<PageBloc>().add(prevPageEvent!);
      }
    }

    return BlocBuilder<OrderStepBloc, OrderStepState>(
        builder: (context, orderState) {
      if (orderState is OnSeatOrder) {
        return SelectSeatPage(
          ticket: orderState.ticket,
        );
      }
      if (orderState is OnCheckoutOrder) {
        return CheckoutOrderPage(ticket: orderState.ticket);
      }
      return const SelectSchedulePage();
    });
  }
}
