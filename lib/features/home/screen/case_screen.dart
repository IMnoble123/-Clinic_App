import 'package:at_clinic/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class CasesScreen extends StatefulWidget {
    static const String routeName = "/casesScreen";
  const CasesScreen({super.key});

  @override
  State<CasesScreen> createState() => _CasesScreenState();
}

class _CasesScreenState extends State<CasesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cases',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Row(
              children: const [
                Text(
                  'View More',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
                Icon(
                  Icons.arrow_right_alt,
                  color: Colors.black,
                )
              ],
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            filterBar(['All', 'Today', 'Custom'], (index) {}),
            const SizedBox(height: 10),
            searchBar(),
            const SizedBox(height: 10),
            Expanded(
              child: Scrollbar(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return caseItemCard(isSelected: index == 0);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget searchBar() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: ColorName.colorTextFormField,
          borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.all(10),
      child: Center(
        child: TextFormField(
          decoration: const InputDecoration.collapsed(hintText: 'Search'),
        ),
      ),
    );
  }

  Widget caseItemCard({bool isSelected = false}) {
    return Container(
      decoration: BoxDecoration(
          color: isSelected
              ? ColorName.colorLoginButton
              : ColorName.colorTextFormField,
          borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQypyXYREmHRMPeQ1184ZNdkMTvPGazc3QmXjTNjxbh_fgIaBNPNnGleWWXFIGxAiD_zZs&usqp=CAU'),
        ),
        const SizedBox(width: 10),
        Column(
          children: const [
            Text("Rohit Batia"),
            SizedBox(height: 5),
            Text("30 Years"),
          ],
        )
      ]),
    );
  }

  Widget filterBar(List<String> items, Function(int) onItemSelected) {
    int selIndex = 0;
    return SizedBox(
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) => ChoiceChip(
          selectedColor: ColorName.colorLoginButton,
          backgroundColor: ColorName.colorTextFormField,
          padding: const EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          label: Text(items[index],
              style: TextStyle(
                  color: selIndex == index ? Colors.white : Colors.black)),
          selected: selIndex == index,
          onSelected: (value) {
            onItemSelected.call(index);
          },
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
      ),
    );
  }
}
