# Soluevo Challenge - iOS
Detran challenge app for control and registration of vehicles, contracts and creditors.

## Requirements

What you need to run this project:

* Xcode 10.1
* [CocoaPods - Installation Guide](https://guides.cocoapods.org/using/getting-started.html)

## Libraries used

* [IQKeyboardManagerSwift] -> For keyboard handling.
* [Alamofire] -> For API consumption.
* [SwiftKeychainWrapper] -> For Keychain handling.
* [YangMingShan] -> For access photo gallery and camera.

### Installing instructions
First of all, download this project. Then:

```bash
sudo gem install cocoapods
cd detran-ios-challenge
pod install
open detran-ios-challenge.xcworkspace
```

Note that you have to go to develop branch, because master just have initial configuration.

```bash
git checkout develop
```

## Running instructions

CMD + R to run the project.

CMD + U to run tests.

