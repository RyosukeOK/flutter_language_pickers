import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

import 'package:language_pickers/languages.dart';
import 'package:language_pickers/language_pickers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'language_pickers Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'language_pickers Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Language _selectedDropdownLanguage =
  LanguagePickerUtils.getLanguageByIsoCode('ko',customLanguagesList);
  Language _selectedDialogLanguage =
  LanguagePickerUtils.getLanguageByIsoCode('ko',customLanguagesList);
  Language _selectedCupertinoLanguage =
  LanguagePickerUtils.getLanguageByIsoCode('ko',customLanguagesList);

  // It's sample code of Dropdown Item.
  Widget _buildDropdownItem(Language language) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 8.0,
        ),
        Text("${language.name} (${language.isoCode})"),
      ],
    );
  }

  // It's sample code of Dialog Item.
  Widget _buildDialogItem(Language language) => Row(
    children: <Widget>[
      Text(language.name),
      SizedBox(width: 8.0),
      Flexible(child: Text("(${language.isoCode})"))
    ],
  );

  void _openLanguagePickerDialog() => showDialog(
    context: context,
    builder: (context) => Theme(
        data: Theme.of(context).copyWith(primaryColor: Colors.pink),
        child: LanguagePickerDialog(
            titlePadding: EdgeInsets.all(8.0),
            searchCursorColor: Colors.pinkAccent,
            searchInputDecoration: InputDecoration(hintText: 'Search...'),
            isSearchable: true,
            title: Text('Select your language'),
            onValuePicked: (Language language) => setState(() {
              _selectedDialogLanguage = language;
              print(_selectedDialogLanguage.name);
              print(_selectedDialogLanguage.isoCode);
            }),
            itemBuilder: _buildDialogItem)),
  );

  // It's sample code of Cupertino Item.
  void _openCupertinoLanguagePicker() => showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return LanguagePickerCupertino(
          pickerSheetHeight: 200.0,
          onValuePicked: (Language language) => setState(() {
            _selectedCupertinoLanguage = language;
            print(_selectedCupertinoLanguage.name);
            print(_selectedCupertinoLanguage.isoCode);
          }),
        );
      });

  Widget _buildCupertinoItem(Language language) => Row(
    children: <Widget>[
      Text("+${language.name}"),
      SizedBox(width: 8.0),
      Flexible(child: Text(language.name))
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Center(
                  child: LanguagePickerDropdown(
                    initialValue: 'ko',
                    itemBuilder: _buildDropdownItem,
                    onValuePicked: (Language language) {
                      _selectedDropdownLanguage = language;
                      print(_selectedDropdownLanguage.name);
                      print(_selectedDropdownLanguage.isoCode);
                    },
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: MaterialButton(
                    child: Text("Push"),
                    onPressed: _openLanguagePickerDialog,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: ListTile(
                    title: _buildCupertinoItem(_selectedCupertinoLanguage),
                    onTap: _openCupertinoLanguagePicker,
                  ),
                ),
              ),
            ]),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

const List<Map<String, String>>
customLanguagesList = [
//  {'isoCode': 'ab', 'name': 'Abkhazian'},
//  {'isoCode': 'aa', 'name': 'Afar'},
//  {'isoCode': 'af', 'name': 'Afrikaans'},
//  {'isoCode': 'ak', 'name': 'Akan'},
//  {'isoCode': 'sq', 'name': 'Albanian'},
//  {'isoCode': 'am', 'name': 'Amharic'},
  {'isoCode': 'ar', 'name': 'Arabic'},
//  {'isoCode': 'an', 'name': 'Aragonese'},
//  {'isoCode': 'hy', 'name': 'Armenian'},
//  {'isoCode': 'as', 'name': 'Assamese'},
//  {'isoCode': 'av', 'name': 'Avaric'},
//  {'isoCode': 'ae', 'name': 'Avestan'},
//  {'isoCode': 'ay', 'name': 'Aymara'},
//  {'isoCode': 'az', 'name': 'Azerbaijani'},
//  {'isoCode': 'bm', 'name': 'Bambara'},
//  {'isoCode': 'ba', 'name': 'Bashkir'},
//  {'isoCode': 'eu', 'name': 'Basque'},
//  {'isoCode': 'be', 'name': 'Belarusian'},
//  {'isoCode': 'bn', 'name': 'Bengali'},
//  {'isoCode': 'bh', 'name': 'Bihari Languages'},
//  {'isoCode': 'bi', 'name': 'Bislama'},
//  {'isoCode': 'nb', 'name': 'Norwegian'},
//  {'isoCode': 'bs', 'name': 'Bosnian'},
//  {'isoCode': 'br', 'name': 'Breton'},
//  {'isoCode': 'bg', 'name': 'Bulgarian'},
//  {'isoCode': 'my', 'name': 'Burmese'},
//  {'isoCode': 'ca', 'name': 'Catalan'},
//  {'isoCode': 'km', 'name': 'Central Khmer'},
//  {'isoCode': 'ch', 'name': 'Chamorro'},
//  {'isoCode': 'ce', 'name': 'Chechen'},
//  {'isoCode': 'ny', 'name': 'Chewa (Nyanja)'},
//  {'isoCode': 'zh_Hans', 'name': 'Chinese (Simplified)'}, //WARNING
  {'isoCode': 'zh-TW', 'name': 'Chinese (Simplified)'}, //WARNING
  {'isoCode': 'zh_CN', 'name': 'Chinese (Traditional)'}, //WARNING
//  {'isoCode': 'cu', 'name': 'Church Slavonic'},
//  {'isoCode': 'cv', 'name': 'Chuvash'},
//  {'isoCode': 'kw', 'name': 'Cornish'},
//  {'isoCode': 'co', 'name': 'Corsican'},
//  {'isoCode': 'cr', 'name': 'Cree'},
//  {'isoCode': 'hr', 'name': 'Croatian'},
//  {'isoCode': 'cs', 'name': 'Czech'},
//  {'isoCode': 'da', 'name': 'Danish'},
//  {'isoCode': 'dv', 'name': 'Dhivehi'},
  {'isoCode': 'nl', 'name': 'Dutch'},
//  {'isoCode': 'dz', 'name': 'Dzongkha'},
//  {'isoCode': 'alpha2', 'name': 'English'},
  {'isoCode': 'en', 'name': 'English'},
//  {'isoCode': 'eo', 'name': 'Esperanto'},
//  {'isoCode': 'et', 'name': 'Estonian'},
//  {'isoCode': 'ee', 'name': 'Ewe'},
//  {'isoCode': 'fo', 'name': 'Faroese'},
//  {'isoCode': 'fj', 'name': 'Fijian'},
  {'isoCode': 'fi', 'name': 'Finnish'},
  {'isoCode': 'fr', 'name': 'French'},
//  {'isoCode': 'ff', 'name': 'Fulah'},
//  {'isoCode': 'gd', 'name': 'Gaelic'},
//  {'isoCode': 'gl', 'name': 'Galician'},
//  {'isoCode': 'lg', 'name': 'Ganda'},
//  {'isoCode': 'ka', 'name': 'Georgian'},
  {'isoCode': 'de', 'name': 'German'},
//  {'isoCode': 'el', 'name': 'Greek, Modern (1453-)'},
//  {'isoCode': 'gn', 'name': 'Guarani'},
//  {'isoCode': 'gu', 'name': 'Gujarati'},
//  {'isoCode': 'ht', 'name': 'Haitian'},
//  {'isoCode': 'ha', 'name': 'Hausa'},
  {'isoCode': 'he', 'name': 'Hebrew'},
//  {'isoCode': 'hz', 'name': 'Herero'},
//  {'isoCode': 'hi', 'name': 'Hindi'},
//  {'isoCode': 'ho', 'name': 'Hiri Motu'},
//  {'isoCode': 'hu', 'name': 'Hungarian'},
//  {'isoCode': 'is', 'name': 'Icelandic'},
//  {'isoCode': 'io', 'name': 'Ido'},
//  {'isoCode': 'ig', 'name': 'Igbo'},
  {'isoCode': 'id', 'name': 'Indonesian'},
//  {'isoCode': 'ia', 'name': 'Interlingua'},
//  {'isoCode': 'ie', 'name': 'Interlingue'},
//  {'isoCode': 'iu', 'name': 'Inuktitut'},
//  {'isoCode': 'ik', 'name': 'Inupiaq'},
//  {'isoCode': 'ga', 'name': 'Irish'},
  {'isoCode': 'it', 'name': 'Italian'},
  {'isoCode': 'ja', 'name': 'Japanese'},
//  {'isoCode': 'jv', 'name': 'Javanese'},
//  {'isoCode': 'kl', 'name': 'Kalaallisut'},
//  {'isoCode': 'kn', 'name': 'Kannada'},
//  {'isoCode': 'kr', 'name': 'Kanuri'},
//  {'isoCode': 'ks', 'name': 'Kashmiri'},
//  {'isoCode': 'kk', 'name': 'Kazakh'},
//  {'isoCode': 'ki', 'name': 'Kikuyu'},
//  {'isoCode': 'rw', 'name': 'Kinyarwanda'},
//  {'isoCode': 'ky', 'name': 'Kirghiz'},
//  {'isoCode': 'kv', 'name': 'Komi'},
//  {'isoCode': 'kg', 'name': 'Kongo'},
  {'isoCode': 'ko', 'name': 'Korean'},
//  {'isoCode': 'kj', 'name': 'Kuanyama'},
//  {'isoCode': 'ku', 'name': 'Kurdish'},
//  {'isoCode': 'lo', 'name': 'Lao'},
//  {'isoCode': 'la', 'name': 'Latin'},
//  {'isoCode': 'lv', 'name': 'Latvian'},
//  {'isoCode': 'li', 'name': 'Limburgan'},
//  {'isoCode': 'ln', 'name': 'Lingala'},
//  {'isoCode': 'lt', 'name': 'Lithuanian'},
//  {'isoCode': 'lu', 'name': 'Luba-Katanga'},
//  {'isoCode': 'lb', 'name': 'Luxembourgish'},
//  {'isoCode': 'mk', 'name': 'Macedonian'},
//  {'isoCode': 'mg', 'name': 'Malagasy'},
  {'isoCode': 'ms', 'name': 'Malay'},
//  {'isoCode': 'ml', 'name': 'Malayalam'},
//  {'isoCode': 'mt', 'name': 'Maltese'},
//  {'isoCode': 'gv', 'name': 'Manx'},
//  {'isoCode': 'mi', 'name': 'Maori'},
//  {'isoCode': 'mr', 'name': 'Marathi'},
//  {'isoCode': 'mh', 'name': 'Marshallese'},
//  {'isoCode': 'mn', 'name': 'Mongolian'},
//  {'isoCode': 'na', 'name': 'Nauru'},
//  {'isoCode': 'nv', 'name': 'Navajo'},
//  {'isoCode': 'nd', 'name': 'Ndebele, North'},
//  {'isoCode': 'nr', 'name': 'Ndebele, South'},
//  {'isoCode': 'ng', 'name': 'Ndonga'},
//  {'isoCode': 'ne', 'name': 'Nepali'},
//  {'isoCode': 'se', 'name': 'Northern Sami'},
//  {'isoCode': 'no', 'name': 'Norwegian'},
//  {'isoCode': 'nn', 'name': 'Norwegian Nynorsk'},
//  {'isoCode': 'oc', 'name': 'Occitan (post 1500)'},
//  {'isoCode': 'oj', 'name': 'Ojibwa'},
//  {'isoCode': 'or', 'name': 'Oriya'},
//  {'isoCode': 'om', 'name': 'Oromo'},
//  {'isoCode': 'os', 'name': 'Ossetian'},
//  {'isoCode': 'pi', 'name': 'Pali'},
//  {'isoCode': 'pa', 'name': 'Panjabi'},
//  {'isoCode': 'fa', 'name': 'Persian'},
  {'isoCode': 'pl', 'name': 'Polish'},
  {'isoCode': 'pt', 'name': 'Portuguese'},
//  {'isoCode': 'ps', 'name': 'Pushto'},
//  {'isoCode': 'qu', 'name': 'Quechua'},
//  {'isoCode': 'ro', 'name': 'Romanian'},
//  {'isoCode': 'rm', 'name': 'Romansh'},
//  {'isoCode': 'rn', 'name': 'Rundi'},
  {'isoCode': 'ru', 'name': 'Russian'},
//  {'isoCode': 'sm', 'name': 'Samoan'},
//  {'isoCode': 'sg', 'name': 'Sango'},
//  {'isoCode': 'sa', 'name': 'Sanskrit'},
//  {'isoCode': 'sc', 'name': 'Sardinian'},
//  {'isoCode': 'sr', 'name': 'Serbian'},
//  {'isoCode': 'sn', 'name': 'Shona'},
//  {'isoCode': 'ii', 'name': 'Sichuan Yi'},
//  {'isoCode': 'sd', 'name': 'Sindhi'},
//  {'isoCode': 'si', 'name': 'Sinhala'},
//  {'isoCode': 'sk', 'name': 'Slovak'},
//  {'isoCode': 'sl', 'name': 'Slovenian'},
//  {'isoCode': 'so', 'name': 'Somali'},
//  {'isoCode': 'st', 'name': 'Sotho, Southern'},
  {'isoCode': 'es', 'name': 'Spanish'},
//  {'isoCode': 'su', 'name': 'Sundanese'},
//  {'isoCode': 'sw', 'name': 'Swahili'},
//  {'isoCode': 'ss', 'name': 'Swati'},
//  {'isoCode': 'sv', 'name': 'Swedish'},
//  {'isoCode': 'tl', 'name': 'Tagalog'},
//  {'isoCode': 'ty', 'name': 'Tahitian'},
//  {'isoCode': 'tg', 'name': 'Tajik'},
//  {'isoCode': 'ta', 'name': 'Tamil'},
//  {'isoCode': 'tt', 'name': 'Tatar'},
//  {'isoCode': 'te', 'name': 'Telugu'},
  {'isoCode': 'th', 'name': 'Thai'},
//  {'isoCode': 'bo', 'name': 'Tibetan'},
//  {'isoCode': 'ti', 'name': 'Tigrinya'},
//  {'isoCode': 'to', 'name': 'Tonga (Tonga Islands)'},
//  {'isoCode': 'ts', 'name': 'Tsonga'},
//  {'isoCode': 'tn', 'name': 'Tswana'},
  {'isoCode': 'tr', 'name': 'Turkish'},
//  {'isoCode': 'tk', 'name': 'Turkmen'},
//  {'isoCode': 'tw', 'name': 'Twi'},
//  {'isoCode': 'ug', 'name': 'Uighur'},
//  {'isoCode': 'uk', 'name': 'Ukrainian'},
//  {'isoCode': 'ur', 'name': 'Urdu'},
//  {'isoCode': 'uz', 'name': 'Uzbek'},
//  {'isoCode': 've', 'name': 'Venda'},
  {'isoCode': 'vi', 'name': 'Vietnamese'},
//  {'isoCode': 'vo', 'name': 'Volapük'},
//  {'isoCode': 'wa', 'name': 'Walloon'},
//  {'isoCode': 'cy', 'name': 'Welsh'},
//  {'isoCode': 'fy', 'name': 'Western Frisian'},
//  {'isoCode': 'wo', 'name': 'Wolof'},
//  {'isoCode': 'xh', 'name': 'Xhosa'},
//  {'isoCode': 'yi', 'name': 'Yiddish'},
//  {'isoCode': 'yo', 'name': 'Yoruba'},
//  {'isoCode': 'za', 'name': 'Zhuang'},
//  {'isoCode': 'zu', 'name': 'Zulu'}
];
