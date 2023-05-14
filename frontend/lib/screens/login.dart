import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/config/config.dart';
import 'package:frontend/config/metamask_handler.dart';
import 'package:frontend/config/state_handler.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  MetaMaskProvider? mmprovider;

  @override
  void didChangeDependencies() {
    mmprovider ??= MetaMaskProvider(Provider.of<StateHandler>(context))
      ..start();
    super.didChangeDependencies();
  }

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
              left: 200,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: SvgPicture.asset('assets/logo_bw.svg'),
                ),
                Container(
                  width: 670,
                  height: 520,
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
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'Login',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      height: 1.2,
                                      color: text,
                                      fontFamily: 'ClashDisplay',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 56,
                                    ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 32.0),
                          child: Text(
                            'Please connect your wallet to access your account.',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      height: 1.2,
                                      color: grey2,
                                      fontFamily: 'BasierCircle',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 35.0),
                          child: ChangeNotifierProvider.value(
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
                                          final accountData = await api.login(
                                              walletAddress:
                                                  mmprovider!.currentAddress);
                                          print(accountData);
                                          Provider.of<StateHandler>(context,
                                                  listen: false)
                                              .setuserdata(accountData);
                                          context.pushReplacement(
                                              "/dashboard/${accountData[0]['account_type']}");
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
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 32.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  width: 84,
                                  height: 1,
                                  color: grey2,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  'Or',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        height: 1.2,
                                        color: grey2,
                                        fontFamily: 'BasierCircle',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                      ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: grey2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'Register as:',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      height: 1.2,
                                      color: text,
                                      fontFamily: 'ClashDisplay',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 56,
                                    ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 32.0),
                          child: Text(
                            'Choose the type of account you need.',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      height: 1.2,
                                      color: grey2,
                                      fontFamily: 'BasierCircle',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CFButton(
                              icon: 'assets/next.svg',
                              label: 'Producer',
                              onTap: () async {
                                context.push('/register_producer');
                              },
                            ),
                            CFButton(
                              icon: 'assets/next.svg',
                              label: 'Certifier',
                              onTap: () async {
                                context.push('/register_certifier');
                              },
                            ),
                            CFButton(
                              icon: 'assets/next.svg',
                              label: 'Distributer',
                              onTap: () async {
                                context.push('/register_distributer');
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
