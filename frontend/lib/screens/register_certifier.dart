import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/config/config.dart';
import 'package:frontend/config/metamask_handler.dart';
import 'package:frontend/config/state_handler.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/inputs.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RegisterCertifier extends StatefulWidget {
  const RegisterCertifier({super.key});

  @override
  State<RegisterCertifier> createState() => _RegisterCertifierState();
}

class _RegisterCertifierState extends State<RegisterCertifier> {
  MetaMaskProvider? mmprovider;

  @override
  void didChangeDependencies() {
    mmprovider ??= MetaMaskProvider(Provider.of<StateHandler>(context))
      ..start();
    super.didChangeDependencies();
  }

  final organization = TextEditingController();
  final contract = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6E8685),
      body: Stack(
        children: [
          SvgPicture.asset('assets/Subtract.svg'),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset('assets/Subtract2.svg'),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 135.0,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: SvgPicture.asset('assets/logo_bw.svg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: Container(
                      width: 670,
                      height: 237,
                      decoration: BoxDecoration(
                        color: background3,
                        border: Border.all(color: text, width: 1.5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(28),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Register as',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    height: 1,
                                    color: primary,
                                    fontFamily: 'BasierCircle',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 24,
                                  ),
                            ),
                            Text(
                              'Certifier',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    height: 1.2,
                                    color: text,
                                    fontFamily: 'ClashDisplay',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 56,
                                  ),
                            ),
                            Expanded(child: Container()),
                            ChangeNotifierProvider.value(
                              value: mmprovider,
                              child: Consumer<MetaMaskProvider>(
                                builder: (context, metaMaskProvider, child) {
                                  return Row(
                                    children: [
                                      CFButton(
                                        icon: 'assets/Wallet.svg',
                                        label: 'Connect Wallet',
                                        onTap: () async {
                                          final metaMaskProvider =
                                              Provider.of<MetaMaskProvider>(
                                                  context,
                                                  listen: false);
                                          try {
                                            await metaMaskProvider.connect();

                                            if (!mounted) return;
                                            setState(() {});
                                          } catch (e) {
                                            print('User rejected.');
                                          }
                                        },
                                      ),
                                      if (metaMaskProvider.isConnected &&
                                          metaMaskProvider
                                              .isInOperatingChain) ...[
                                        Text('Wallet connected!'),
                                      ],
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 670,
                    height: 447,
                    decoration: BoxDecoration(
                      color: background3,
                      border: Border.all(color: text, width: 1.5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(28),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Register',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      height: 1,
                                      color: primary,
                                      fontFamily: 'BasierCircle',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 24,
                                    ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Text(
                              'Information',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    height: 1.2,
                                    color: text,
                                    fontFamily: 'ClashDisplay',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 56,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              'Organization',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    height: 1,
                                    color: text,
                                    fontFamily: 'BasierCircle',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 24.0),
                            child: CFTextField(
                              controller: organization,
                              label: 'Input data...',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              'Contract Address',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    height: 1,
                                    color: text,
                                    fontFamily: 'BasierCircle',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                  ),
                            ),
                          ),
                          CFTextField(
                            controller: contract,
                            label: 'Input data...',
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Row(
                            children: [
                              CFButton(
                                icon: 'assets/finish.svg',
                                label: 'Finish',
                                onTap: () async {
                                  try {
                                    final respose = await api.register(
                                      accountType: '1',
                                      walletAddress: mmprovider!.currentAddress,
                                      name: organization.text,
                                      contractAddress: contract.text,
                                    );
                                    print(respose);
                                    context.pushReplacement('/');
                                  } on Exception catch (e) {
                                    print(e);
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // ChangeNotifierProvider.value(
                  //   value: mmprovider,
                  //   child: Consumer<MetaMaskProvider>(
                  //     builder: (context, metaMaskProvider, child) {
                  //       if (metaMaskProvider.isConnected &&
                  //           metaMaskProvider.isInOperatingChain) {
                  //         return Text(
                  //             'wallet connected, ${metaMaskProvider.currentAddress}');
                  //       } else {
                  //         return Padding(
                  //           padding: const EdgeInsets.all(8.0),
                  //           child: Row(
                  //             children: [
                  //               CFButton(
                  //                 icon: 'assets/Wallet.svg',
                  //                 label: 'Connect Wallet',
                  //                 onTap: () async {
                  //                   final metaMaskProvider =
                  //                       Provider.of<MetaMaskProvider>(context,
                  //                           listen: false);
                  //                   try {
                  //                     await metaMaskProvider.connect();

                  //                     if (!mounted) return;
                  //                     setState(() {});
                  //                   } catch (e) {
                  //                     print('User rejected.');
                  //                   }
                  //                 },
                  //               ),
                  //               CFTextField(
                  //                 controller: TextEditingController(),
                  //                 label: 'Input text...',
                  //               ),
                  //             ],
                  //           ),
                  //         );
                  //       }
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
