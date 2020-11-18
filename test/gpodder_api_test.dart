import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'package:gpodder_api/gpodder_api.dart';
import 'package:gpodder_api/src/models/device.dart';
import 'package:gpodder_api/src/models/gpodder_user.dart';
import 'package:gpodder_api/src/models/subscription.dart';
import 'package:gpodder_api/src/models/tag.dart';

void main() {
  test('adds one to input values', () {
    /*final calculator = Calculator();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
    expect(() => calculator.addOne(null), throwsNoSuchMethodError);*/
  });

  group('Service Tests', () {
    //initialize the service

    test('Test reading the configuration api', () async {
      //sleep(Duration(seconds: 2));
      final configService = ClientConfigService();
      await configService.configIsFetched;
      expect(configService.config, isNotNull);
      //expect(configService?.config?.api?.baseUrl, "https://gpodder.net");
    });

    test('Directory Service Testing', () async {
      final configService = ClientConfigService();
      await configService.configIsFetched;
      final DirectoryService ds =
          DirectoryService(config: configService.config);
      final List<Tag> tags = await ds.getTopTags(1);
      expect(tags.length, isNotNull);
      expect(tags[0].tag, isNotNull);

      final List<Subscription> podcasts = await ds.getPodcastsByTag(1, tags[0]);

      expect(podcasts.length, 1);
      expect(podcasts[0].url, isNotNull);
      expect(podcasts[0].mygpoLink, isNotNull);

      final List<Subscription> search = await ds.findPodcast("twit");

      expect(search.length, isNotNull);
      expect(search[0].url, isNotNull);
    });

    test('subscription service testing', () async {
      final configService = ClientConfigService();
      await configService.configIsFetched;

      GpodderUser user = GpodderUser(userId: "harriseldon", password: "");
      Device device =
          Device(id: "kilgore", caption: "Laptop", type: "computer");
      final SubscriptionService subscriptionService =
          SubscriptionService(config: configService.config, user: user);

      final List<Subscription> deviceSubscriptions =
          await subscriptionService.getDeviceSubscriptions(device);

      expect(deviceSubscriptions.length, isNotNull);
    });
  });

  String fixture(String name) {
    var dir = Directory.current.path;
    if (dir.endsWith('/test')) {
      dir = dir.replaceAll('/test', '');
    }
    return File('$dir/test/fixtures/$name').readAsStringSync();
  }
}
