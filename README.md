## UI Template Bloc

## UI Templates

> Pre Created BLoC Logic that can be reused on your projects


## Setup 

> call setup UITemplate service

```
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupUITemplateServices();
  runApp(const MyApp());
}
```

> next setup the dropdown bloc basically the setup is similar to other blocs you can use on this project
```
  UIDropDownBloc? dropDownBloc;
  MyHomePage({super.key, required this.title}){
    dropDownBloc = initDropDownBloc(dropDownItems: ["Test Item 1", "Test Item 2"]);
  }

  // call this in your widget

    const Text("DropDown Sample"),
    UITemplate1DropDownWidget(widget.dropDownBloc!)
```

> next step is if you want to access the value of the dropdown you need to call 
```
// this is located in di_service.dart
getService()

// methods under this service, your key here should be whatever you pass on the dropDownBloc localKey ex. CountryDropdown has its own unique key for accessing the local storage values on your repository or Region Dropdown has its own BloC and unique key for accessing its values based on the selected Region

getDropDownValue(localKey: "PROVIDE YOUR KEY")

```
