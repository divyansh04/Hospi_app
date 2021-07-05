import 'package:flutter/material.dart';

class GenderSelector extends StatefulWidget {
  final Function(String) onSelected;

  const GenderSelector({Key key, @required this.onSelected}) : super(key: key);
  @override
  _GenderSelectorState createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  List<Gender> genders = new List<Gender>();

  @override
  void initState() {
    super.initState();
    genders.add(new Gender("Male", Icons.male_outlined, false));
    genders.add(new Gender("Female", Icons.female_outlined, false));
    genders.add(new Gender("Others", Icons.transgender_outlined, false));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: genders.length,
        itemBuilder: (context, index) {
          return InkWell(
            splashColor: Colors.blue,
            onTap: () {
              setState(() {
                genders.forEach((gender) => gender.isSelected = false);
                genders[index].isSelected = true;
                this.widget.onSelected(genders[index].name);
              });
            },
            child: CustomRadio(genders[index]),
          );
        });
  }
}

class CustomRadio extends StatelessWidget {
  Gender _gender;

  CustomRadio(this._gender);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: _gender.isSelected ? Colors.blue : Colors.white,
        child: Container(
          height: 80,
          width: 80,
          alignment: Alignment.center,
          // margin: new EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                _gender.icon,
                color: _gender.isSelected ? Colors.white : Colors.grey,
                size: 30,
              ),
              SizedBox(height: 8),
              Text(
                _gender.name,
                style: TextStyle(
                    color: _gender.isSelected ? Colors.white : Colors.grey),
              )
            ],
          ),
        ));
  }
}

class Gender {
  String name;
  IconData icon;
  bool isSelected;

  Gender(this.name, this.icon, this.isSelected);
}
