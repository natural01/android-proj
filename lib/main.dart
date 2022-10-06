import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text(
            'Place of interests',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 35, 48, 65),
          child: ListView(
            children: <Widget>[
              Container(
                height: 70,
                child: const Center(
                  child: DrawerHeader(
                    child: Text('Categories',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20)),
                  ),
                ),
              ),
              ListTile(
                  title: const Text(
                    "Places of interests",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  leading: const Icon(Icons.photo, color: Colors.white),
                  onTap: () {}),
              const Divider(
                color: Colors.grey,
                indent: 20,
                endIndent: 20,
                thickness: 2,
              ),
              ListTile(
                  title: const Text(
                    "Hotels",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  leading: const Icon(Icons.hotel, color: Colors.white),
                  onTap: () {}),
              const Divider(
                color: Colors.grey,
                indent: 20,
                endIndent: 20,
                thickness: 2,
              ),
              ListTile(
                  title: const Text(
                    "Restaurants",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  leading: const Icon(Icons.restaurant, color: Colors.white),
                  onTap: () {}),
              const Divider(
                color: Colors.grey,
                indent: 20,
                endIndent: 20,
                thickness: 2,
              ),
              ListTile(
                  title: const Text(
                    "Night scene",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  leading: const Icon(Icons.nightlife, color: Colors.white),
                  onTap: () {}),
              const Divider(
                color: Colors.grey,
                indent: 20,
                endIndent: 20,
                thickness: 2,
              ),
              ListTile(
                  title: const Text(
                    "Shopping",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  leading: const Icon(Icons.shopping_bag, color: Colors.white),
                  onTap: () {}),
              const Divider(
                color: Colors.grey,
                indent: 20,
                endIndent: 20,
                thickness: 2,
              ),
              ListTile(
                  title: const Text(
                    "Parking",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  leading: const Icon(Icons.local_parking, color: Colors.white),
                  onTap: () {}),
              const Divider(
                color: Colors.grey,
                indent: 20,
                endIndent: 20,
                thickness: 2,
              ),
              ListTile(
                  title: const Text(
                    "Beaches",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  leading: const Icon(Icons.beach_access, color: Colors.white),
                  onTap: () {}),
              const Divider(
                color: Colors.grey,
                indent: 20,
                endIndent: 20,
                thickness: 2,
              ),
              ListTile(
                  title: const Text(
                    "Recreation",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  leading: const Icon(Icons.sunny, color: Colors.white),
                  onTap: () {}),
              const Divider(
                color: Colors.grey,
                indent: 20,
                endIndent: 20,
                thickness: 2,
              ),
              ListTile(
                  title: const Text(
                    "Transportation",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  leading: const Icon(Icons.emoji_transportation,
                      color: Colors.white),
                  onTap: () {}),
              const Divider(
                color: Colors.grey,
                indent: 20,
                endIndent: 20,
                thickness: 2,
              )
            ],
          ),
        ),
        body: Column(
          children: const [
            SizedBox(
              height: 10,
            ),
            CardWidget(
              Text1: 'Museo de Arte',
              Text2: 'The Museo de Arte de Ponce houses the most',
              imageURL:
                  'https://thumbs.dreamstime.com/b/%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D1%8C%D0%B5%D1%80-museo-nacional-de-arte-munal-%D0%B2-%D0%BC%D0%B5%D1%85%D0%B8%D0%BA%D0%BE-%D0%B4%D0%B2%D0%BE%D1%80%D1%86%D0%B0-%D1%81%D1%82%D0%B0%D1%80%D0%BE%D0%B3%D0%BE-%D1%81%D0%BE%D0%BE%D0%B1%D1%89%D0%B5%D0%BD%D0%B8%D0%B9-144069612.jpg',
            ),
            SizedBox(
              height: 5,
            ),
            CardWidget(
                Text1: 'El Tuque Beach',
                Text2: 'As the mame suggests, El Tuque Beach is',
                imageURL:
                    'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBUVFRgSFRUYGBgYGBkaGBgYGBgYGBgYGBkZGhgYGRgcIS4lHB4rIRgYJjgmKy8xNTU1GiQ7QDs0Py40NTEBDAwMEA8QGBISHzEhISExNDQ0NDQ0NDQ0NDE0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDE0NDQ0NDQ0NDQ0NDQxPzQ0NP/AABEIAMMBAwMBIgACEQEDEQH/xAAbAAACAwEBAQAAAAAAAAAAAAAABAEDBQIGB//EAEAQAAEDAgMFBAYHBwUBAQAAAAEAAhESIQMEMQUTQVFhInGBkQYykqGx8EJSU2LB0dIUI3KiwuHxFRZDguLTM//EABoBAQEBAQEBAQAAAAAAAAAAAAEAAgMEBQb/xAAmEQACAgEEAgIDAAMAAAAAAAAAARESAgMTMVEEISNBFGGRIkJx/9oADAMBAAIRAxEAPwDw4auqVYGqaV+lqfCsUUopV0KC1FSsUwilW0oLVQMlUIhWUqKUQUlVKilW0opVA2Ky1RSrKVFKIGxXSopVkIhEDJUWqKVdCilEDYphRCupUUqgbFVKilXUqKVQNiqEQraVFKoKxVCmF3SilUFJXCmld0opVBScQiF3CiEwUnEIhdwppRBSVwphdQiFQUnNKldQhMFJpUohW0opXog8UlNKktVtKKUQVimlRSrqUUqgbFFKKVcWqKUQNiqlRCtpRSiBsVQoLVdSopRUrFNKilXUqKVVGxTSopVxailEDYopRSroUUogbFNKiFfSopVA2KKUQrqVFKIGxTSilW0opVBWK4UUqylFKoGSulRSraVFKoKxXSiFZSilUFYrhELuEQqBk4hC7hCoKTXoRQrqEUL0nz7FNCgtV8KKVQViilRSr6UUqgbFFKIV9KKVQVhalFKYoRQqBsL0ooV9KKUQVhelBYr6UUqgbC9CihMUKKFQNxelQWpgsXJaiBsL0oLUxQopWYGwvSilX0qKVQNigtUQr6FFCIGxTCIVtKilFRsVwgsVtKKVVKxTSilXUoLFVKxTSuaVfSoLUwNimlCtpQqBsbVCKEwMNTQukniFqEFiY3aN2qSFqVFKZ3aN2qSFqUUpndo3aZIWpRSmd2o3aZAWoUUpksUUJAWpRSmSxQWKKRYsUUJmhRu1DYWLFFKZOGjdqgrCtCgsTJYoLEVGwtSuSxMligsRUbCxYooTNCihFRuLUIoTNCilUDYXpRSmKUUIgbi1KKUzQihQyLUoLUzQoLFFYWpUJqhCPQ2ZuBimhNjDRu1ixiomWKKE7u1G7VYKie7UbtO7tG7TJVEt2jdp3do3abBAlu0btObtG7TYoEt2jdp3do3abBUR3aN2nd0jdKsVRE4ajdp/cjmoOEE2KohulG7T9CgsVJVEDhqDgp44a5OGqSqInCXJw08cJcnDVJQI7tRu06cNc7tFhgT3aN2nN2uThosUCu7Ru0zQo3aLDAucNc0posUUIk1AvSilMUKYVYUhWjopTFKESJ6MYSndJoMRSvLuHbbFN0jdJyhFCtwNsT3SndJuhTQncLbE90jdJyhFKtwNsT3SjdJ7do3adwNsR3SN0nt2jdp3C2xHdI3Kd3aN2tbg7YicFRuk/u1G6VuFtmfulBwlo7tcnDVuFQzzhKDhLQOGuThq3A2zOOEuDhLROGuThK3EW2zOOEoOGtA4a4OGjcQbbEDhrndp44aN2jcFabEDhqN0nixcliNwdsROCoOGnThqN2rcHbEt2g4ac3ag4aNwttiW7QnN0hW4h22KN9Lx9l/P/Zdf7ut/+QPdifm1Z1OX+o72x+lWB+CNGvHSsAeQbC+dXX6Pozo9jw9Lh9ifb/8AKh3pgB/wmP4//KUbjYQmGuE8nN/RZBxsK1n2+82/f2LqjX6KdDseHpgz7F3fWB8Qo/3i2/7o2+//AOVnE4PJ/tM+NCmrA+o7zYf6LLUa/QTodmm30vZacJ3g8H4gLv8A3azhhP8AFzQscfs9v3bjHNwv3wFLf2YX3A9oqjX6D4OzYHpazjhPHi34KH+l+HYDCeSecBYzjgaDCjoHW5cVAGB9kPaI+Co1+g+Hs2H+mDOGC7xeAPcCuWembDrguBHCsflossjA+xHi9/5qAzL6jLs9t/6kpa3Q/B2bLvTDDjs4TyepDRPfdcs9MmfTwXg/dc13xhY9GD9gy338T9SksweOAz28Qf1rSWt0Xwdm2PTDB+o8d9A/FSPS/A4sxPZYf6lhHCwfsWRyrxD/AFrprMEf8LPbxf1pjW6L4Ozad6YYH1MSeUM/Uod6YZeJoxPZZ+v5lYpZhfYs9vFP9ah2HhfYs9rF/WqNXop0ezdHpZlj9fh9H3a/MqxvpNlj9MjpSfwXngzC+wZ54v4vUFmD9gz28X9avl6CdHs9A70my31z7DvyUM9Jcqf+SO9rviAvPOZg/YsH/bF90vVW4w7wwX6vPxcr5eg+Ls9R/r+W+2b5OH4Lo7Yy/wBszzXlf2DDb9Fk2MG9j0cVH7GyLNYfARHnquW77iV/TW1j0/4eldtzLa70W1gOOmo0VDvSPK/afyP/AErGZs8a0M9gaTy0myh+zWPBIDCBwDA0+7jCnrpOJX9FaKamGbTfSDLH/lA/ia9vxCvbtXLkSMbD9tv5rxOeyTwew1tAgEiQ4HjIIjqpw9nP3QxGUYpOraWyet9f7Lm/LSNrxke5Gawzo9h7nNP4qd63mPML5piZw4LqX4QYTqCwtMAgg6aSAfBJ5naAf2qWg3+iIPfIUvK/QfjH1ffDSr3rkYwIkOkcwZC+RDNPI9adbaCCIIjut3FDczaIi/hKvyP0P4/7Pq52gz67PaahfLW4g5n3IWPyX0a2F2eyDR08lMDp5Kd0eR8lyWr68nzqk2+Qpt8gLmk9VEIkqlo7/wCUKPH+VcKbpkqnXj7gpA6ri/JRJRJVLaeqmjr7lTUVNR5Kkqlow+pRR1PmqqipBKpGpZR1Knd9VXfmieqZGpYGfe+CN3974LgKxrFSVUQGjmoIHX3qygcSuMTHY0TM+H5rLZpYkR3+9Ru+MGBqdAEtltrh72sa0C4mO0QOMxbkvQuY0zLQ630R2eA4+K+fl56UqD1LxH69mEM1hOhrC5zuIDTTx0dpwWhhZAvYXGGzf7wF/I6Lt+Wax9TGil57TeAMRPTRWZRjmMpxCbyDPDW68OflamX2enHQwx+jNdlWPAuWkN7JN+E3HNJZNgcQQ4lwJ7UQCOBvf5K1GtaHNxA4aaTxuRfzVWfxGNeHmBVyiLSD7yuCaOkuC7Bxyx1JuQQL9Ov4pRmM9+JiMFhVLTekjW3SxWjgva83FrjqCvPbW2lusUhjYAgGQRfrwPepJ5FKg1HYYLXYeIwOvobibQVQNg4mG5r8N8sJkt9Ut48TEdZSOHt6e0BM6+DZmVqZTaJLQ4GZulzioZSWYuew8acHFbNJA6hw9ak9LXXndq7Dax1wC0mzhMgdY8Vt7TwXY4biAEPZB7LZc9tpa6L/AB06rrKuc9pD22ECCPo/MKWTxUomeSxMphN7Qe2dI+HcksxhiRRB5mfhP4L2zdlZdwhzByMayD8Lrze1dlnCcRSafoutcWgf5XTHNMzEGPSeJ+KE7S/g4+yVC3Int/2kqP2pJjERK+zc+bT9DpzHRAxhySUorTczQd/aByUnHCRrRWq7GiHd8FIeOSSGIF2CeSrPoKIarbyU1hKCeS7DHclXKheXBBc1VjBd8wFazJuPA+9D1cFyza0snwiN4OSN4OQ8k3hbKeeHz4J7A2A88PdHvK5ZeXgjovGyf6MUunQK3AwHv0HffRegOxmMFT3AAcysnP55rMN+IPUvB5iwB8x71w1POhf4o64+Iv8AZgNnsbd5nTTrolttZJj8IswyWudAMT6pN58krldvVhsQQQAZvEC4PkfJd5fHOI5o0N+UWcAR5/ivFl5Grk/bO+OlhjwhduwHYDQWGsPsTobaH4eaafmnYLHB5EGloJNrka9ZB8loNa5stk0iS0nny8BfyWX6QbGzGO2rDYSLOiQOABiVwm2STOsQO5DP1GDyvzE6+M/BJbZzZDKe0e0ZNyZGknuKwcu3Gy72h7XN/vwsvQZLMBzyDxAOnQzfrbyVljVmGJ5LL8C7smHA95M2OgkDzVm0sDeMpPrtf2e4mY8U9m8p6pZYQQY4GQfeqcmwmHAgn1XB2hIi893FZmXJLGTNyO03McGnXr1FTfAg+5elyT2YrW1sbUSb0tJFp4juSb/R4PIxAHhzbANh7HN6kSRYRrzWr/p27gh9ja9iBoTBsRANpT9po0sYEs3sCTUx0ch6ovzhuiRy+Q3Vnh4E2pbLfMcFzn/SZ7Kg0t1cBUWiKZvrqZsOQ715jMbexsQ9p3lp1HxXZ4PLH2DaT9HqcHPAucCIadBAPOdVZlcVvqt+b/2968ZjZ97byeHkQPyTGW2s0S6bx4nqubwcAmerzWE1s4gHG/x+e9JPzDHuGG8AwfIx7kthbdYaZ8dL3hW5/AaP37HgTciLOMWki/j0WEofs2aTdl4P1QhebZt7EaAC0SNYIQtVyL0a7ci83iO+B8VUzCq0M8LEapXPY2Jiw2QQ2SAATfTh36pFlQPXoTr8JiePBe5edl0jxvx0bn7KfkodgRqRbqpyOaD2nDLg00imxJJtqeDba9Vm5lj2kBzybmLGCdeKn5z+kP4+MTJpjKz17gVazIdD5AfFO+i794d0/g2QY63Bk9fcvVMyTBwlH5Wb4Nrx8TyDNnH6vv8AyCawtlOOgHkSvVsw2DRrfirK0PX1H9mlo4L6PO4WxHHgfIBOYewhxjxJK1q1FSw883yzaxxXCFcLZTG/2ACZZlWD6I8bqHPCrdjQswMjNbRyA8AkM1thjASKn/wCoGPveqPErK2jt7LM9fEYSPoiHkf9WzC8ntn0jdjsLGNc0EQS6LyToOFo1W6uJa9A8l2dbc29iZnEDWS1jYkTqbGD1v7tV0WnEwdyXdl1p5EGYNtDovPbPljjJgze/wCHj71u5YvxXFrBDbkH6Pn5ea8+cz6LFyc5jZAy+EXhwqtPLWI9496s2LlHYjS/RsOcDcTFyB4EXTmHhl7O324dEHSW0meuq08F9gdLuZI6PIBjhZoUpfPJrHH3IPeyilxgFkDneZ/lAU5jOl4lriCBAgx3cei8/wCkO0y0MbAJDovY21bIiLx5KnIZ3tcgY/x88kZYtL0Lf0K7fz7w5jRiPgtu2t8SDF28bqvBzdDwdZifHj8fJO+kOU3jW4zATTZwE8dDCw2MBEw7UAjXXWPyWlGWKMRB7HZ+bJhoOpEHlNim37Hxd4MUmWPFpPabeG9kW5acFjbI7Mg3LeXIyQfKF6bI7VrBsKQCSbyANJHmuWPLRvHGDCyGNm8B9Lw6KtQRRAmwdpTEwDETwstraWaD8Op0tNgRBfTNwCWAyOq7djF/aIqtwDCJAuPW7Q4ea8ptzfNMNY8QAWlkgRc6C0LtipfocvSMLaeXcBvAWOa4mC10mxjQ3/ysprzwTjcDHfIDXm8kXAnQW4mFLtk4sE06CYm8fJXpUJQ2cP8AgliZhxsbjloqg7pC7xGEGHCFxRKK9CmW4B1vYwfL/K9FkM0SCxxBFoP1eBXmsDDLnBuq9BkstQ9prhw1aTqOfX/C4aiR1xNDD2a2NGnrIv7kLdyYwqG9nhwAjwULhZnWEefbmHmpzHADj9E9y7wt5ifuy2RwgjUCYnhr701k9hY5fFBMO9cy1oM6Be8wdnYdAw6YpBBpsJIlxbx14rRxxTfJ87c9+FRhwQ4h13AGS0waQJmJ5q4ZLEzLDiMqe9hBIiZF7Acxay9jjejOXcwtAdaIMyWkTJbINzJCZ2PslmWqLHvNWrXxHW0C/VMC8f4eW2fs/MspcMN7Q65cAbD7wGgsvXbOLyzti86gyCOB5jxWjvLQB+Xkqbch3Rp3clrFQEBCIUF64c/55rcsoO3FcOf8+66iD8/nwXBP+EpE2Y23dq4uE393hl7uBpc4DvAF14Pae1cy8/vXvH3bsHsiPevqOMARFvkSsnF2ThntFrZsZIHEArthqY48o55YvL7PmeHgPdZoJ106X1Wvldhudd7iBBPZBMho+setl7XCymEy9NThYExAlsmBpNvirHntTwm4Gmn9yjPWeX0WOklyeXyeRw2GCyaAKnETU8ktA8jMdWp7AZTS3iSSe+oGPIEeC0X5MlxmBD57yWYfLW8+Sty2V7Ti5uhPDURJhcMsjrjjB1lWMILtO0491/7LpjRDwAIDyI4XAdA81ScPdghtgXzBFQBv4q/LYDiAXEFpc8mDOsRIjhELBsx8bZLMV9T5mG2EGRpURPGy7w/R5gh3G30p004cbq9mXAkm7mkNIqAkuHad3CbnyTuXyjCWBriHNPa7bnC4MgklGTZlKWU5XY7GNhpdBMERx4aqvMbEY8uLmUXqJEO7UGIAHAE3W3nmPA7BbAEXkQRpe405pXLZtxDw9hY9ramyTeQ71XcTbTqiIYmL/pxwmksElwABM6EyTHcT7u5NMyoDQADLAAQ2ZJAETxBp4dVp4WI10PPWxA466pPEfBIBABAk2Dqo9YA8Ii600SFwAwta11TQILDNTQQCJtOlr8QUvmMVpHqHW4FyBIJbeBeo8bT0MsY7J7RvDfWaWyRMk3i5gRJ4d8rPypPbdS0NbSTcdkXa0XMmp7yTOpFzBKVAOTBxMVwe4VNm8AuHZEdkQDrpJmTfhATjM0R69MnkCauFuHPnwSuZ2Lu6sVz2Q4EiWEG+l79epXlXYz2vPa4R0jkOi6RJng9VjYzC5rHtisxIYZaJ4mb93vVTdisxWuaSGPbMQ+bTDZBBJm3wUYD24oZW2DB7V7RfWxJWlkcItbLXCSTTeRLZkO48vCFzyza4N44zyeYfsbGy+IK2gCXMqkcQ4SOIsDHctLHyhJ3gu0iOzMglzZnwn5C0s3m3YzBh2a4TUHFsNNiQL3m+t/NZL88/BeCxzXCzXAEFtRAkh2rRbp3qs8mKSxR6HZ+K3dsmmaRNwhIVzcyCdQWOJHi0we8KFyqa9H0YREcOSJXNa5c+F2g5Fgch2IAlnPc6w7PXj+QUkgapgpGHYire52gt1P4BUvzQGmvv1A/EJbGznWJFp7tPiqAka01e53QQB7hPvUOxuQ59dAf0rNOciCLmNdBoBI4nQ6BcDNOPEAacrmQJM2N9DcpSKR/ExXCZOgPTSv8ASFVi5kA2JMHTh9L/AM+SRe+xcSSI1MTcmJPjOncOKsYJJEGeNp0jUfRPaFj3pkoOxjONtBEW7gPwQ0DxMa2PnqrsDKOMTAHmdPm/fbSXcLJMESKtNb6aWQ8igTw8s59gDB1dpqIkdfA8E0zZh1L7xFm2HW5unwoLkcjwLs2a2SS+Z17MHQAXk8lb+wMGrifEC6mpV4rGuguaCRoTw7kPFFYnMZVhBEGDwFh5ju9yWGC1tmtAH4zOvGeqb3qh9JvxGnf3oqNhA4DSQaBI6d44K/DcA5ojhAtP1dSONh5KMR9NqHRwIBcI8LqvL7Sw3yGuEgwWnsmZjQ3+Qhih7EbAI146375+dAkHNuCeESSbSYEDlwHcr6ibHW1xxXLsO4de1tLTOvhASBkZthqbIBANmzAiJMt5Xjz6LNwWS99TnVuIm57R0cY+joAByA6r0T8v2YMn4gHuVRy8OqPICeNiY6cSojLGA9tpLRPC1qZmSdL8D06pnByAzDHOd6gBa0EdoviC6fuyI7kyMEvbDwGmSYGguQ3xiFq5ZsCiJAgGIkAmA7hbUmEcDyJv2ex+DunsmGhjh9IiLX1nWDzXk8T0WZgvBqradKxHC4I0niveU6u52njANktm2Ai/HmiWJ892jlqGNqYaKq2uGk2jQWN78CNOnWQL2mZqY+ogyHAHVzXBpkSDwHHmF6XGwGlj8u8FzCBTPCARFiDYtB8Fm5fYrmYhdl3Na3UsdLiZ6uN/7oYe5M3HyTmvloJAJLxq6jgWiZ4crxqvLtxBL2EWcdf4Zie+V9KeSHNJYYi8XdhvtDgOLToYn6NrlYu0fR/CxicTDcGPkzxZUDBEcNP8reLS5DKWeQbtPFZ2A9wAsBMwhauJ6PZtpIoBjk8R4TCFv0Zln048AumoQomDzB8EnmfwPwQhC5Ji2MYk9P8A5pBrpAcbmRr1HLRCFpAMFsPcP4u+xPHVIZzELcTCc0wSHDpBotGnFCEoh/C0a3hT4+qDrqtrDwwBYfN0IXM0WHUeKsb8+QQhRHYQ5CEoGclVu4d4QhQkdPnh+ah6EJBgw6LsNDrOAIjQgH4oQhiuTvHww1zGtECTYaaKX6KELCNMqZoqsRShIHWHqmxoe9CEMUQ/SEnmrSeilCyJlRME3lzv6ghtnWtf8/yQhIFr9KuIOqx9stjBc4WNIfIt2xiNh1uKEKRM06zz4D4IQhBo/9k=')
          ],
        ));
  }
}

class CardWidget extends StatelessWidget {
  final Text1;
  final Text2;
  final imageURL;

  const CardWidget(
      {Key? key,
      required this.Text1,
      required this.Text2,
      required this.imageURL})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: NetworkImage(imageURL),
              fit: BoxFit.cover,
            )),
        width: double.infinity,
        height: 200,
        child: Container(
          margin: const EdgeInsets.only(top: 111),
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Text1,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  )),
              Text(Text2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ))
            ],
          ),
        ));
  }
}
