import 'package:covid_tracker/Services/states_services.dart';
import 'package:covid_tracker/Veiw/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController serachcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: serachcontroller,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                hintText: 'Search With Country name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
          Expanded(
              child: FutureBuilder<List<dynamic>>(
            future: statesServices.countriesListApi(),
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (!snapshot.hasData ||
                  snapshot.data == null ||
                  snapshot.data!.isEmpty) {
                return Center(child: Text("No countries found"));
              }

              var countryList = snapshot.data ?? []; // ✅ Ensuring no null

              return ListView.builder(
                itemCount: countryList.length,
                itemBuilder: (context, index) {
                  var country = countryList[index];

                  // ✅ Null safety applied to prevent crashes
                  String name = country['country'] ?? "Unknown";
                  String cases = country['cases']?.toString() ?? "0";
                  String flagUrl = country['countryInfo']?['flag'] ?? '';

                  if (serachcontroller.text.isEmpty) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                          name: name,
                                          image: flagUrl,
                                          totalcases: country['cases'] ?? 0,
                                          totalRecovered:
                                              country['recovered'] ?? 0,
                                          totalDeaths: country['deaths'] ?? 0,
                                          active: country['active'] ?? 0,
                                          test: country['tests'] ?? 0,
                                          todayRecovered:
                                              country['todayRecovered'] ?? 0,
                                        )));
                          },
                          child: ListTile(
                            title: Text(name),
                            subtitle: Text(cases),
                            leading: flagUrl.isNotEmpty
                                ? Image(
                                    height: 50,
                                    width: 50,
                                    image: NetworkImage(flagUrl))
                                : Icon(Icons.flag),
                          ),
                        )
                      ],
                    );
                  } else if (name
                      .toLowerCase()
                      .contains(serachcontroller.text.toLowerCase())) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                          name: name,
                                          image: flagUrl,
                                          totalcases: country['cases'] ?? 0,
                                          totalRecovered:
                                              country['recovered'] ?? 0,
                                          totalDeaths: country['deaths'] ?? 0,
                                          active: country['active'] ?? 0,
                                          test: country['tests'] ?? 0,
                                          todayRecovered:
                                              country['todayRecovered'] ?? 0,
                                        )));
                          },
                          child: ListTile(
                            title: Text(name),
                            subtitle: Text(cases),
                            leading: flagUrl.isNotEmpty
                                ? Image(
                                    height: 50,
                                    width: 50,
                                    image: NetworkImage(flagUrl))
                                : Icon(Icons.flag),
                          ),
                        )
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              );
            },
          )),
        ],
      )),
    );
  }
}
