import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ta', 'hi'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? taText = '',
    String? hiText = '',
  }) =>
      [enText, taText, hiText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // auth_2_Create
  {
    'npxna3t3': {
      'en': 'Grands',
      'hi': 'ग्रैंड',
      'ta': 'கிராண்ட்ஸ்',
    },
    'w3gg7oqw': {
      'en': 'Get Started',
      'hi': 'शुरू हो जाओ',
      'ta': 'தொடங்குங்கள்',
    },
    'itnxshjo': {
      'en': 'Create an account by using the form below.',
      'hi': 'नीचे दिए गए फॉर्म का उपयोग करके एक खाता बनाएं।',
      'ta': 'கீழே உள்ள படிவத்தைப் பயன்படுத்தி கணக்கை உருவாக்கவும்.',
    },
    'x9riubb3': {
      'en': 'Email',
      'hi': 'ईमेल',
      'ta': 'மின்னஞ்சல்',
    },
    'm3n5xv18': {
      'en': 'Password',
      'hi': 'पासवर्ड',
      'ta': 'கடவுச்சொல்',
    },
    'w1vs2wwz': {
      'en': 'Create Account',
      'hi': 'खाता बनाएं',
      'ta': 'உங்கள் கணக்கை துவங்குங்கள்',
    },
    '4bpjxvf8': {
      'en': 'Or sign up with',
      'hi': 'या इसके साथ साइन अप करें',
      'ta': 'அல்லது உடன் பதிவு செய்யவும்',
    },
    'ofobz7lh': {
      'en': 'Continue with Google',
      'hi': 'Google के साथ जारी रखें',
      'ta': 'Google உடன் தொடரவும்',
    },
    'uhkott2r': {
      'en': 'Already have an account? ',
      'hi': 'क्या आपके पास पहले से एक खाता मौजूद है?',
      'ta': 'ஏற்கனவே ஒரு கணக்கு உள்ளதா?',
    },
    'ykztdr05': {
      'en': 'Sign in here',
      'hi': 'यहां साइन इन करो',
      'ta': 'இங்கே உள்நுழையவும்',
    },
    'fi5eg0pi': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
    },
  },
  // auth_2_Login
  {
    'g274so02': {
      'en': 'Grands',
      'hi': 'ग्रैंड',
      'ta': 'கிராண்ட்ஸ்',
    },
    'ldn7fpre': {
      'en': 'Welcome Back',
      'hi': 'वापसी पर स्वागत है',
      'ta': 'மீண்டும் வருக',
    },
    'j4vmgr8h': {
      'en': 'Fill out the information below in order to access your account.',
      'hi': 'अपने खाते तक पहुंचने के लिए नीचे दी गई जानकारी भरें।',
      'ta': 'உங்கள் கணக்கை அணுக, கீழே உள்ள தகவலை நிரப்பவும்.',
    },
    '10g1kv7e': {
      'en': 'Email',
      'hi': 'ईमेल',
      'ta': 'மின்னஞ்சல்',
    },
    'hdcn4hld': {
      'en': 'Password',
      'hi': 'पासवर्ड',
      'ta': 'கடவுச்சொல்',
    },
    '3kvj6o2y': {
      'en': 'Sign In',
      'hi': 'दाखिल करना',
      'ta': 'உள்நுழையவும்',
    },
    'uodv4os7': {
      'en': 'Or sign in with',
      'hi': 'या इसके साथ साइन इन करें',
      'ta': 'அல்லது உடன் உள்நுழையவும்',
    },
    'j5vxmcsz': {
      'en': 'Continue with Google',
      'hi': 'Google के साथ जारी रखें',
      'ta': 'Google உடன் தொடரவும்',
    },
    '8qxq6kem': {
      'en': 'Don\'t have an account?  ',
      'hi': 'कोई खाता नहीं है?',
      'ta': 'கணக்கு இல்லையா?',
    },
    'hiy1a98p': {
      'en': 'Create Account',
      'hi': 'खाता बनाएं',
      'ta': 'உங்கள் கணக்கை துவங்குங்கள்',
    },
    '4bz5vier': {
      'en': 'Forgot password?',
      'hi': 'पासवर्ड भूल गए?',
      'ta': 'கடவுச்சொல்லை மறந்துவிட்டீர்களா?',
    },
    'f1cnlw63': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
    },
  },
  // auth_2_ForgotPassword
  {
    '5jnpuemr': {
      'en': 'Grands',
      'hi': 'ग्रैंड',
      'ta': 'கிராண்ட்ஸ்',
    },
    'qn7zep60': {
      'en': 'Forgot Password',
      'hi': 'पासवर्ड भूल गए',
      'ta': 'கடவுச்சொல்லை மறந்துவிட்டீர்களா',
    },
    'tl4l9vu1': {
      'en':
          'Please fill out your email below in order to recieve a reset password link.',
      'hi': 'रीसेट पासवर्ड लिंक प्राप्त करने के लिए कृपया नीचे अपना ईमेल भरें।',
      'ta':
          'கடவுச்சொல்லை மீட்டமைக்கும் இணைப்பைப் பெற, கீழே உங்கள் மின்னஞ்சலை நிரப்பவும்.',
    },
    'jnqqqnw8': {
      'en': 'Email',
      'hi': 'ईमेल',
      'ta': 'மின்னஞ்சல்',
    },
    'jrcfc5ms': {
      'en': 'Send Reset Link',
      'hi': 'रीसेट लिंक भेजें',
      'ta': 'மீட்டமை இணைப்பை அனுப்பவும்',
    },
    '134cbpjt': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
    },
  },
  // auth_2_createProfile
  {
    '5ozzoofl': {
      'en': 'Grands',
      'hi': 'ग्रैंड',
      'ta': 'கிராண்ட்ஸ்',
    },
    'klkmmrbo': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
    },
  },
  // auth_2_Profile
  {
    '53cjgd7h': {
      'en': 'Your Account',
      'hi': 'आपका खाता',
      'ta': 'உங்கள் கணக்கு',
    },
    'mcvm74cz': {
      'en': 'Edit Profile',
      'hi': 'प्रोफ़ाइल संपादित करें',
      'ta': 'சுயவிவரத்தைத் திருத்து',
    },
    'rv29wgjb': {
      'en': 'App Settings',
      'hi': 'एप्लिकेशन सेटिंग',
      'ta': 'பயன்பாட்டு அமைப்புகள்',
    },
    'adibe51k': {
      'en': 'Settings',
      'hi': 'समायोजन',
      'ta': 'அமைப்புகள்',
    },
    'bj7swrsd': {
      'en': 'Support',
      'hi': 'सहायता',
      'ta': 'ஆதரவு',
    },
    'eqpqmb4e': {
      'en': 'Terms of Service',
      'hi': 'सेवा की शर्तें',
      'ta': 'சேவை விதிமுறைகள்',
    },
    '7h4qndwt': {
      'en': 'Log Out',
      'hi': 'लॉग आउट',
      'ta': 'வெளியேறு',
    },
    '2d8ujs2k': {
      'en': 'profile',
      'hi': 'प्रोफ़ाइल',
      'ta': 'சுயவிவரம்',
    },
  },
  // auth_2_EditProfile
  {
    'bnk93488': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
    },
  },
  // homepage
  {
    '1bfpfphd': {
      'en': 'Grands',
      'hi': 'ग्रैंड',
      'ta': 'கிராண்ட்ஸ்',
    },
    'ipb8ltbw': {
      'en': 'Siddarth',
      'hi': 'सिद्धार्थ',
      'ta': 'சித்தார்த்',
    },
    'a8a5ok8x': {
      'en': 'Kannal',
      'hi': 'कनाल',
      'ta': 'கன்னல்',
    },
    'emvpn2ss': {
      'en': 'Anmol',
      'hi': 'अनमोल',
      'ta': 'அன்மோல்',
    },
    '32jj8gu0': {
      'en': 'Daniel',
      'hi': 'डैनियल',
      'ta': 'டேனியல்',
    },
    'lqiea0mh': {
      'en': 'Hursun',
      'hi': 'हुरसुन',
      'ta': 'ஹர்சுன்',
    },
    '0bxnhdon': {
      'en': 'Following',
      'hi': 'अगले',
      'ta': 'தொடர்ந்து',
    },
    'c3v3hv0l': {
      'en': 'The Walking Buddies',
      'hi': 'चलने वाले दोस्त',
      'ta': 'நடைபயிற்சி நண்பர்கள்',
    },
    'fq6z2gob': {
      'en': '1d ago',
      'hi': '1 दिन पहले',
      'ta': '1நா முன்பு',
    },
    '1ecyx7yx': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud ',
      'hi':
          'लोरेम इप्सम डोलोर सिट अमेट, कंसेक्टेचर एडिपिसिंग एलीट, सेड डू ईयसमॉड टेम्पोर इंसिडिडंट यूट लेबोर एट डोलोर मैग्ना अलिका। यूट एनिम एड मिनिम वेनियम, क्विस नॉस्ट्रुड',
      'ta':
          'லோரெம் இப்சம் டோலர் சிட் அமெட், கன்செக்டெர் அடிபிஸ்சிங் எலிட், செட் டூ ஈயுஸ்மோட் டெம்போர் இன்சிடிடுண்ட் யுட் லேபர் மற்றும் டோலோர் மேக்னா அலிகா. உட் எனிம் அட் மினிம் வெனியம், க்விஸ் நாஸ்ட்ரட்',
    },
    '9lwbhdoi': {
      'en': 'Chester chess team',
      'hi': 'चेस्टर शतरंज टीम',
      'ta': 'செஸ்டர் செஸ் அணி',
    },
    'j3mhypht': {
      'en': '1w ago',
      'hi': '1 सप्ताह पहले',
      'ta': '1வா முன்பு',
    },
    'mcjld67v': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud ',
      'hi':
          'लोरेम इप्सम डोलोर सिट अमेट, कंसेक्टेचर एडिपिसिंग एलीट, सेड डू ईयसमॉड टेम्पोर इंसिडिडंट यूट लेबोर एट डोलोर मैग्ना अलिका। यूट एनिम एड मिनिम वेनियम, क्विस नॉस्ट्रुड',
      'ta':
          'லோரெம் இப்சம் டோலர் சிட் அமெட், கன்செக்டெர் அடிபிஸ்சிங் எலிட், செட் டூ ஈயுஸ்மோட் டெம்போர் இன்சிடிடுண்ட் யுட் லேபர் மற்றும் டோலோர் மேக்னா அலிகா. உட் எனிம் அட் மினிம் வெனியம், க்விஸ் நாஸ்ட்ரட்',
    },
    'j3gww7m8': {
      'en': 'TN Golf Club',
      'hi': 'टीएन गोल्फ क्लब',
      'ta': 'TN கோல்ஃப் கிளப்',
    },
    '8k9j35zm': {
      'en': '1d ago',
      'hi': '1 दिन पहले',
      'ta': '1நா முன்பு',
    },
    'sgqow02e': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud ',
      'hi':
          'लोरेम इप्सम डोलोर सिट अमेट, कंसेक्टेचर एडिपिसिंग एलीट, सेड डू ईयसमॉड टेम्पोर इंसिडिडंट यूट लेबोर एट डोलोर मैग्ना अलिका। यूट एनिम एड मिनिम वेनियम, क्विस नॉस्ट्रुड',
      'ta':
          'லோரெம் இப்சம் டோலர் சிட் அமெட், கன்செக்டெர் அடிபிஸ்சிங் எலிட், செட் டூ ஈயுஸ்மோட் டெம்போர் இன்சிடிடுண்ட் யுட் லேபர் மற்றும் டோலோர் மேக்னா அலிகா. உட் எனிம் அட் மினிம் வெனியம், க்விஸ் நாஸ்ட்ரட்',
    },
    'y4foy4s9': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
    },
  },
  // Health
  {
    'xzacihak': {
      'en': 'Health',
      'hi': 'स्वास्थ्य',
      'ta': 'ஆரோக்கியம்',
    },
    '5bwnc6u1': {
      'en': '2543',
      'hi': '2543',
      'ta': '2543',
    },
    'cfy0f1p7': {
      'en': 'Steps',
      'hi': 'कदम',
      'ta': 'படிகள்',
    },
    'a2xy5wlr': {
      'en': '3220k',
      'hi': '3220k',
      'ta': '3220k',
    },
    '47ciqufe': {
      'en': 'Calories',
      'hi': 'कैलोरी',
      'ta': 'கலோரிகள்',
    },
    'v1n87axe': {
      'en': '6.8 km',
      'hi': '6.8 किमी',
      'ta': '6.8 கி.மீ',
    },
    'y45f777o': {
      'en': 'Distance',
      'hi': 'दूरी',
      'ta': 'தூரம்',
    },
    'vbioeosv': {
      'en': '6.8 h',
      'hi': '6.8 घंटे',
      'ta': '6.8 மணி',
    },
    'osmqjhwb': {
      'en': 'Sleep',
      'hi': 'नींद',
      'ta': 'தூங்கு',
    },
    '0j33pl3h': {
      'en': 'Heart Rate',
      'hi': 'हृदय दर',
      'ta': 'இதய துடிப்பு',
    },
    'jrwh8rxs': {
      'en': '76',
      'hi': '76',
      'ta': '76',
    },
    '9zwtnkkd': {
      'en': 'Medication Reminder',
      'hi': 'दवा अनुस्मारक',
      'ta': 'மருந்து நினைவூட்டல்',
    },
    'tun05a5i': {
      'en': 'parecetemol',
      'hi': 'पैरेसिटेमोल',
      'ta': 'பாரிசெட்டமால்',
    },
    'jb0l4kno': {
      'en': 'health',
      'hi': 'स्वास्थ्य',
      'ta': 'ஆரோக்கியம்',
    },
  },
  // Messages
  {
    'qc509nga': {
      'en': 'Messages',
      'hi': 'संदेशों',
      'ta': 'செய்திகள்',
    },
    '46q0xu3l': {
      'en': 'Search contact',
      'hi': 'संपर्क खोजें',
      'ta': 'தேடு தொடர்பு',
    },
    'fvd44e5t': {
      'en': '__',
      'hi': '__',
      'ta': '__',
    },
  },
  // Discover
  {
    'qx9lpmrk': {
      'en': 'Discover',
      'hi': 'खोज करना',
      'ta': 'கண்டறியவும்',
    },
    'w4grnzem': {
      'en': 'Search...',
      'hi': 'खोज...',
      'ta': 'தேடு...',
    },
    'yfo3e8j8': {
      'en': 'Filter One',
      'hi': 'फ़िल्टर एक',
      'ta': 'வடிகட்டி ஒன்று',
    },
    'sm5qvm6r': {
      'en': 'Filter Two',
      'hi': 'फ़िल्टर दो',
      'ta': 'வடிகட்டி இரண்டு',
    },
    'bhove96v': {
      'en': 'Filter Three',
      'hi': 'तीन फ़िल्टर करें',
      'ta': 'வடிகட்டி மூன்று',
    },
    'kfj6hjs5': {
      'en': 'Filter Four',
      'hi': 'फ़िल्टर चार',
      'ta': 'வடிகட்டி நான்கு',
    },
    'by9ni75x': {
      'en': 'Filter One',
      'hi': 'फ़िल्टर एक',
      'ta': 'வடிகட்டி ஒன்று',
    },
    'gdg8co39': {
      'en': 'Location, Address',
      'hi': 'स्थान का पता',
      'ta': 'இடம், முகவரி',
    },
    'draub3ze': {
      'en': 'Card Title',
      'hi': 'कार्ड शीर्षक',
      'ta': 'அட்டை தலைப்பு',
    },
    'm8xr8it4': {
      'en': 'Location, Address',
      'hi': 'स्थान का पता',
      'ta': 'இடம், முகவரி',
    },
    'o5cytu3r': {
      'en': 'Card Title',
      'hi': 'कार्ड शीर्षक',
      'ta': 'அட்டை தலைப்பு',
    },
    'ssolmky1': {
      'en': 'Location, Address',
      'hi': 'स्थान का पता',
      'ta': 'இடம், முகவரி',
    },
    'fhsrrj5q': {
      'en': 'Card Title',
      'hi': 'कार्ड शीर्षक',
      'ta': 'அட்டை தலைப்பு',
    },
    'kb8ibmpx': {
      'en': 'Top Regions',
      'hi': 'शीर्ष क्षेत्र',
      'ta': 'சிறந்த பகுதிகள்',
    },
    'qj5sdlvh': {
      'en': 'South America',
      'hi': 'दक्षिण अमेरिका',
      'ta': 'தென் அமெரிக்கா',
    },
    'j1fflema': {
      'en':
          'This region is known for it\'s high altitude growing, fruitful environment and robust farms.',
      'hi':
          'यह क्षेत्र अपनी उच्च ऊंचाई वाली खेती, उपजाऊ वातावरण और मजबूत खेतों के लिए जाना जाता है।',
      'ta':
          'இந்த பகுதி அதிக உயரத்தில் வளரும், பலனளிக்கும் சூழல் மற்றும் வலுவான பண்ணைகளுக்கு பெயர் பெற்றது.',
    },
    'qoju7xgq': {
      'en': 'Category Title',
      'hi': 'श्रेणी शीर्षक',
      'ta': 'வகை தலைப்பு',
    },
    '3l0wdgbv': {
      'en': 'Location, Address',
      'hi': 'स्थान का पता',
      'ta': 'இடம், முகவரி',
    },
    'xtghdoap': {
      'en': 'Card Title',
      'hi': 'कार्ड शीर्षक',
      'ta': 'அட்டை தலைப்பு',
    },
    'jcnuv4fl': {
      'en':
          'A small description about this card that helps users understand the importance of what makes this so special.',
      'hi':
          'इस कार्ड के बारे में एक छोटा सा विवरण जो उपयोगकर्ताओं को इसके महत्व को समझने में मदद करता है कि यह इतना खास क्यों है।',
      'ta':
          'இந்தக் கார்டைப் பற்றிய ஒரு சிறிய விளக்கம், இதன் முக்கியத்துவத்தைப் பயனர்கள் புரிந்துகொள்ள உதவுகிறது.',
    },
    'qcxnonnt': {
      'en': 'Location, Address',
      'hi': 'स्थान का पता',
      'ta': 'இடம், முகவரி',
    },
    'umkvr7wq': {
      'en': 'Card Title',
      'hi': 'कार्ड शीर्षक',
      'ta': 'அட்டை தலைப்பு',
    },
    '1ijazbmz': {
      'en':
          'A small description about this card that helps users understand the importance of what makes this so special.',
      'hi':
          'इस कार्ड के बारे में एक छोटा सा विवरण जो उपयोगकर्ताओं को इसके महत्व को समझने में मदद करता है कि यह इतना खास क्यों है।',
      'ta':
          'இந்தக் கார்டைப் பற்றிய ஒரு சிறிய விளக்கம், இதன் முக்கியத்துவத்தைப் பயனர்கள் புரிந்துகொள்ள உதவுகிறது.',
    },
    'swn4toqq': {
      'en': 'discover',
      'hi': 'खोज करना',
      'ta': 'கண்டுபிடிக்க',
    },
  },
  // chat_2_Details
  {
    'rifu73j9': {
      'en': 'Group Chat',
      'hi': 'समूह बातचीत',
      'ta': 'குழு அரட்டை',
    },
    'r2941cz3': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
    },
  },
  // chat_2_main
  {
    'edk7md0q': {
      'en': 'Below are your chats and group chats',
      'hi': 'नीचे आपकी चैट और समूह चैट हैं',
      'ta': 'உங்கள் அரட்டைகள் மற்றும் குழு அரட்டைகள் கீழே உள்ளன',
    },
    '5g7r7ebb': {
      'en': 'Group Chat',
      'hi': 'समूह बातचीत',
      'ta': 'குழு அரட்டை',
    },
    'ja6krd4t': {
      'en': 'My Chats',
      'hi': 'मेरी चैट',
      'ta': 'எனது அரட்டைகள்',
    },
    'qojc7syd': {
      'en': '__',
      'hi': '__',
      'ta': '__',
    },
  },
  // chat_2_InviteUsers
  {
    'ws5h0z22': {
      'en': 'Invite Friends',
      'hi': 'मित्रों को आमंत्रित करें',
      'ta': 'நண்பர்களை அழைக்க',
    },
    '2ia111td': {
      'en': 'Selected',
      'hi': 'चयनित',
      'ta': 'தேர்ந்தெடுக்கப்பட்டது',
    },
    '18z7el69': {
      'en': 'Invite Friends',
      'hi': 'मित्रों को आमंत्रित करें',
      'ta': 'நண்பர்களை அழைக்க',
    },
    'hpfyqful': {
      'en': 'Select users from below to start a chat.',
      'hi': 'चैट शुरू करने के लिए नीचे से उपयोगकर्ताओं का चयन करें।',
      'ta': 'அரட்டையைத் தொடங்க கீழே உள்ள பயனர்களைத் தேர்ந்தெடுக்கவும்.',
    },
    'wtvck6m6': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
    },
  },
  // image_Details
  {
    'drb8ynvs': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
    },
  },
  // ai_chatbot
  {
    'd60fo253': {
      'en': 'Avi',
      'hi': 'एवी',
      'ta': 'அவி',
    },
    '3od19r3p': {
      'en':
          'Hello Vikram, how can I assist you today? You can ask me questions, request for help or just chat with me.',
      'hi':
          'नमस्ते विक्रम, आज मैं आपकी कैसे सहायता कर सकता हूँ? आप मुझसे प्रश्न पूछ सकते हैं, सहायता के लिए अनुरोध कर सकते हैं या बस मुझसे चैट कर सकते हैं।',
      'ta':
          'ஹலோ விக்ரம், இன்று நான் உங்களுக்கு எப்படி உதவ முடியும்? நீங்கள் என்னிடம் கேள்விகளைக் கேட்கலாம், உதவி கோரலாம் அல்லது என்னுடன் அரட்டையடிக்கலாம்.',
    },
    'ovzgwasm': {
      'en': 'Ask me anything...',
      'hi': 'मुझसे कुछ भी पूछें...',
      'ta': 'என்ன வேண்டுமானாலும் கேள்...',
    },
    '8p8oagy0': {
      'en': 'Type your message here...',
      'hi': 'यहाँ आपके संदेश लिखें...',
      'ta': 'இங்கே உங்களது செய்தியை தட்டச்சு செய்யுங்கள்...',
    },
    '93rbugow': {
      'en': 'Select voice ',
      'hi': 'आवाज चुनें',
      'ta': 'குரலைத் தேர்ந்தெடுக்கவும்',
    },
    '8g5bqlxx': {
      'en': 'Send',
      'hi': 'भेजना',
      'ta': 'அனுப்பு',
    },
    'xeycs42z': {
      'en': 'Avi',
      'hi': 'एवी',
      'ta': 'அவி',
    },
  },
  // landingpage
  {
    '8y123o75': {
      'en': 'Welcome to Grands',
      'hi': 'ग्रैंड्स में आपका स्वागत है',
      'ta': 'கிராண்ட்ஸுக்கு வரவேற்கிறோம்',
    },
    '4le05bcz': {
      'en':
          'we designed this app for people who are 60 and older. it\'s easy to use and it\'s a great way to stay connected with freinds and family.',
      'hi':
          'हमने यह ऐप 60 वर्ष और उससे अधिक उम्र के लोगों के लिए डिज़ाइन किया है। इसका उपयोग करना आसान है और यह दोस्तों और परिवार के साथ जुड़े रहने का एक शानदार तरीका है।',
      'ta':
          '60 வயது மற்றும் அதற்கு மேற்பட்டவர்களுக்காக இந்தப் பயன்பாட்டை வடிவமைத்துள்ளோம். இது பயன்படுத்த எளிதானது மற்றும் நண்பர்கள் மற்றும் குடும்பத்துடன் இணைந்திருக்க இது ஒரு சிறந்த வழியாகும்.',
    },
    'a7jz1dbq': {
      'en': 'Join the community of people who are 60 and older.',
      'hi': '60 और उससे अधिक उम्र के लोगों के समुदाय में शामिल हों।',
      'ta': '60 வயது மற்றும் அதற்கு மேற்பட்டவர்களின் சமூகத்தில் சேரவும்.',
    },
    'msq5pse5': {
      'en': 'Sign Up',
      'hi': 'साइन अप करें',
      'ta': 'பதிவு செய்யவும்',
    },
    'x04y5dc5': {
      'en': 'Log in',
      'hi': 'लॉग इन करें',
      'ta': 'உள்நுழைய',
    },
    'z2kh0u4w': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
    },
  },
  // ai_chatbotCopy
  {
    'pxs1tpiy': {
      'en': 'Avi',
      'hi': 'एवी',
      'ta': 'அவி',
    },
    'l6y2pe5b': {
      'en':
          'Hello Vikram, how can I assist you today? You can ask me questions, request for help or just chat with me.',
      'hi':
          'नमस्ते विक्रम, आज मैं आपकी कैसे सहायता कर सकता हूँ? आप मुझसे प्रश्न पूछ सकते हैं, सहायता के लिए अनुरोध कर सकते हैं या बस मुझसे चैट कर सकते हैं।',
      'ta':
          'ஹலோ விக்ரம், இன்று நான் உங்களுக்கு எப்படி உதவ முடியும்? நீங்கள் என்னிடம் கேள்விகளைக் கேட்கலாம், உதவி கோரலாம் அல்லது என்னுடன் அரட்டையடிக்கலாம்.',
    },
    'nh933203': {
      'en': 'Ask me anything...',
      'hi': 'मुझसे कुछ भी पूछें...',
      'ta': 'என்ன வேண்டுமானாலும் கேள்...',
    },
    'i987pzlu': {
      'en': 'Type your message here...',
      'hi': 'यहाँ आपके संदेश लिखें...',
      'ta': 'இங்கே உங்களது செய்தியை தட்டச்சு செய்யுங்கள்...',
    },
    'j0m5ojiy': {
      'en': 'Irrfan Khan',
      'hi': 'इरफ़ान खान',
      'ta': 'இர்ஃபான் கான்',
    },
    'nxnigoml': {
      'en': 'Send',
      'hi': 'भेजना',
      'ta': 'அனுப்பு',
    },
    'g5ku34gi': {
      'en': 'Avi',
      'hi': 'एवी',
      'ta': 'அவி',
    },
  },
  // editProfile_auth_2
  {
    'w6wa17pz': {
      'en': 'Adjust the content below to update your profile.',
      'hi':
          'अपनी प्रोफ़ाइल अपडेट करने के लिए नीचे दी गई सामग्री को समायोजित करें।',
      'ta':
          'உங்கள் சுயவிவரத்தைப் புதுப்பிக்க கீழே உள்ள உள்ளடக்கத்தைச் சரிசெய்யவும்.',
    },
    '47ogqllu': {
      'en': 'Change Photo',
      'hi': 'छवि बदलो',
      'ta': 'புகைப்படத்தை மாற்று',
    },
    'fv08rll7': {
      'en': 'Full Name',
      'hi': 'पूरा नाम',
      'ta': 'முழு பெயர்',
    },
    'edrndv4w': {
      'en': 'Your full name...',
      'hi': 'आपका पूरा नाम...',
      'ta': 'உன் முழு பெயர்...',
    },
    'rkya03bi': {
      'en': 'Owner/Founder',
      'hi': 'मालिक/संस्थापक',
      'ta': 'உரிமையாளர்/நிறுவனர்',
    },
    'sdyr2kkf': {
      'en': 'Director',
      'hi': 'निदेशक',
      'ta': 'இயக்குனர்',
    },
    'sne4wv6p': {
      'en': 'Manager',
      'hi': 'प्रबंधक',
      'ta': 'மேலாளர்',
    },
    'n6fu1nu7': {
      'en': 'Mid-Manager',
      'hi': 'मध्य प्रबंधक',
      'ta': 'மத்திய மேலாளர்',
    },
    't0r8avqj': {
      'en': 'Employee',
      'hi': 'कर्मचारी',
      'ta': 'பணியாளர்',
    },
    'qjkw358n': {
      'en': 'Your Role',
      'hi': 'आपकी भूमिका',
      'ta': 'உங்கள் பங்கு',
    },
    'pvlacflv': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
      'ta': 'ஒரு பொருளைத் தேடு...',
    },
    'mjc7c65i': {
      'en': 'Short Description',
      'hi': 'संक्षिप्त वर्णन',
      'ta': 'குறுகிய விளக்கம்',
    },
    'ezcb9wms': {
      'en': 'A little about you...',
      'hi': 'आपके बारे में थोड़ा...',
      'ta': 'உன்னை பற்றி கொஞ்சம்...',
    },
    '4zz6cscq': {
      'en': '[bio]',
      'hi': '[जैव]',
      'ta': '[உயிர்]',
    },
  },
  // chat_DetailsOverlay
  {
    'jlwl6udb': {
      'en': 'Group Chat ID: ',
      'hi': 'समूह चैट आईडी:',
      'ta': 'குழு அரட்டை ஐடி:',
    },
    '73rz354q': {
      'en': 'In this chat',
      'hi': 'इस चैट में',
      'ta': 'இந்த அரட்டையில்',
    },
    'q7koxf4k': {
      'en': 'Close',
      'hi': 'बंद करना',
      'ta': 'நெருக்கமான',
    },
  },
  // chat_ThreadComponent
  {
    'vbunqmx7': {
      'en': 'Start typing here...',
      'hi': 'यहां टाइप करना प्रारंभ करें...',
      'ta': 'இங்கே தட்டச்சு செய்யத் தொடங்கு...',
    },
    '90i845le': {
      'en': 'You must enter a message...',
      'hi': 'आपको एक संदेश दर्ज करना होगा...',
      'ta': 'நீங்கள் ஒரு செய்தியை உள்ளிட வேண்டும்...',
    },
    'kysol6sg': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
      'ta': 'கீழ்தோன்றலில் இருந்து ஒரு விருப்பத்தைத் தேர்ந்தெடுக்கவும்',
    },
  },
  // user_ListSmall
  {
    'z1l83mc4': {
      'en': 'ME',
      'hi': 'मुझे',
      'ta': 'ME',
    },
  },
  // deleteDialog
  {
    'uo80w2l2': {
      'en': 'Options',
      'hi': 'विकल्प',
      'ta': 'விருப்பங்கள்',
    },
    'zflbl2em': {
      'en': 'Invite Users',
      'hi': 'उपयोगकर्ताओं को आमंत्रित करें',
      'ta': 'பயனர்களை அழைக்கவும்',
    },
    'a33exzmb': {
      'en': 'Delete Chat',
      'hi': 'चैट हटाएँ',
      'ta': 'அரட்டையை நீக்கு',
    },
    'epkydpx3': {
      'en': 'Confirm Delete',
      'hi': 'हटाने की पुष्टि करें',
      'ta': 'நீக்குவதை உறுதிப்படுத்தவும்',
    },
    'itcueqxz': {
      'en': 'You can\'t undo this action.',
      'hi': 'आप इस क्रिया को पूर्ववत नहीं कर सकते.',
      'ta': 'இந்தச் செயலைச் செயல்தவிர்க்க முடியாது.',
    },
    '2oo2z5pv': {
      'en': 'Delete',
      'hi': 'मिटाना',
      'ta': 'அழி',
    },
  },
  // Miscellaneous
  {
    'ahez7d6f': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    's0998dfl': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'bzbej6av': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'yfto0mx2': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'q4cmz143': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    '06ei4hhs': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'd5oyst5e': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'o3x7dwoa': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'ikn7ojed': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'px380jm2': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    '3p7czo29': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'g4rc88zf': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'wo5czhb6': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'zzlupxy9': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    '2d9n8ply': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'c44052d1': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'jjyjsg07': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'zupd6ubw': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    '0iw3pjw8': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'oxkjtdz3': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    '5b7qau9n': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'ptghovtd': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'begvl29q': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'fbryu9y1': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    '8l8gvr8e': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'bt0hxdu2': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'nqmr4lep': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    '3q2xak4k': {
      'en': '',
      'hi': '',
      'ta': '',
    },
  },
].reduce((a, b) => a..addAll(b));
