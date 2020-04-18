# No Save Chat
A simple that makes it easy to use Whatsapp Public API to open a chat with any phone number registered on whatsapp.

## Build and Use
```bash
git clone https://github.com/Arnab771/No-Save-Chat.git
cd No-Save-Chat
flutter pub get
flutter build apk
```
**Note** : It is recommend to split the apk. `flutter build apk` creates a fat apk. Instead run `flutter build apk --target-platform android-arm,android-arm64,android-x64 --split-per-abi`.
