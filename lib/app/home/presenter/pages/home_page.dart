import 'package:cached_network_image/cached_network_image.dart';
import 'package:dev_authentication/app/home/presenter/stores/home_store.dart';
import 'package:dev_authentication/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeStore store = Modular.get<HomeStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(16),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 200,
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://d3ebnpochj0915.cloudfront.net/dev_logo.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Observer(builder: (_) {
                    if (store.hasError) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              S.of(context).textErrorHome,
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.red)),
                              child: Text(
                                  S
                                      .of(context)
                                      .textSubErrorHome('', store.error!),
                                  style: TextStyle(color: Colors.red)),
                            ),
                          ],
                        ),
                      );
                    }
                    if (store.user == null) {
                      return Container();
                    }
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ElevatedButton(
                              onPressed: store.signIn,
                              child: Text(
                                  '${S.of(context).buttonLogin} ${store.user!.email}')),
                          const SizedBox(
                            height: 8,
                          ),
                          TextButton(
                              onPressed: store.signInDiffUser,
                              child: Text(S.of(context).buttonLoginDiffUser))
                        ],
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
