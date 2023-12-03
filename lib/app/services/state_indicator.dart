import 'package:flutter/material.dart';
import 'package:robot_controller/app/src/constants/colors.dart';

enum StateIndicatorState { loading, failed, connectivity, success }

class StateIndicator extends StatelessWidget {
  const StateIndicator({
    super.key,
    required this.stateIndicatorState,
    this.message,
    this.showMessage = false,
    this.onTap,
  });
  final StateIndicatorState stateIndicatorState;
  final String? message;
  final bool showMessage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    switch (stateIndicatorState) {
      case StateIndicatorState.success:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(
                  Icons.check,
                  size: 50,
                  color: AppColor.green,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const SizedBox(
                height: 11,
              ),
              if (message != null)
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * .7,
                  ),
                  child: Text(
                    message!,
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ),
              const SizedBox(
                height: 30,
              ),
              // BigButton(
              //   extraPadding: 50,
              //   text: l10n.close,
              //   onTap: () => Navigator.of(context).pop(),
              // )
            ],
          ),
        );
      case StateIndicatorState.failed:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: onTap,
                child: const Icon(
                  Icons.replay_rounded,
                  size: 50,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Wystąpił błąd',
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 11,
              ),
              if (showMessage)
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * .7,
                  ),
                  child: Text(
                    message ?? '',
                    style: theme.textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                )
            ],
          ),
        );
      case StateIndicatorState.loading:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Ładowanie',
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 11,
              ),
              if (showMessage)
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * .7,
                  ),
                  child: Text(
                    message ?? '',
                    style: theme.textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                )
            ],
          ),
        );
      case StateIndicatorState.connectivity:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: onTap,
                child: const Icon(
                  Icons.signal_wifi_connected_no_internet_4_sharp,
                  size: 50,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Brak połączenia z internetem',
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 11,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * .7,
                ),
                child: Text(
                  message ?? '',
                  style: theme.textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        );
    }
  }
}
