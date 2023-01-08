import 'package:appointments/features/profile/providers/user_provider.dart';
import 'package:appointments/features/profile/widgets/appointment_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmentsList extends StatefulWidget {
  const AppointmentsList({super.key});

  @override
  State<AppointmentsList> createState() => _AppointmentsListState();
}

class _AppointmentsListState extends State<AppointmentsList> {
  late final _future;
  @override
  void initState() {
    _future =
        Provider.of<UserProvider>(context, listen: false).getAppointments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: Provider.of<UserProvider>(context, listen: false)
                .appointments
                .length,
            itemBuilder: (context, index) {
              return AppointmentCard(
                  appointment: Provider.of<UserProvider>(context, listen: false)
                      .appointments[index]);
            });
      },
    );
  }
}
