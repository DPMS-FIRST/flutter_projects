import 'package:first_app/UI/cricketers_data/notifer_list.dart';
import 'package:flutter/material.dart';

class DropDownComponent extends StatelessWidget {
  const DropDownComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Country",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
        ),
        ValueListenableBuilder(
          valueListenable: selectedCountry,
          builder: (context, value, child) {
            return DropdownButton(
              hint: value == null
                  ? Text('Please Select Country')
                  : Text(
                      value,
                      style: TextStyle(color: Colors.blue),
                    ),
              isExpanded: true,
              iconSize: 30.0,
              style: TextStyle(color: Colors.blue),
              items: ["Afghanistan", "Albania", "Algeria", "American Samoa", "Andorra", "Angola", "Anguilla",

        "Antarctica", "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria",

        "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium",

        "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia and Herzegovina"].map(
                (val) {
                  return DropdownMenuItem<String>(
                    value: val,
                    child: Text(val),
                  );
                },
              ).toList(),
              onChanged: (val) {
                print(val);
                selectedCountry.value = val;
              },
            );
          },
        ),
      ],
    );
  }
}
