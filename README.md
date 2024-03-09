<h3 align="center">Learn бэлтгэл бүлэг 1 ангийн хүүхдүүдэл зориулсан апп</h3>

---

<p align="center">Ашигласан технологи бизнес логик<br></p>

## 📝 Агуулга

- [Систем](#about)
- [Шаардлага](#getting_started)
- [Логик](#logic)
- [Ажиллуулах](#run)

## 🧐 Систем <a name = "about"></a>

Kid learn app систем

Хүүхдийн өөрөө сурах апп 1-ээс 6 насныханд зориулсан

## 🏁 Шаардлага <a name = "getting_started"></a>

#### Flutter

Flutter бол Google-ийн бүтээсэн нээлттэй эхийн UI програм хангамж хөгжүүлэх хэрэгсэл юм. Энэ нь ямар ч вэб хөтчөөс, Fuchsia, Android, iOS, Linux, macOS болон Windows зориулсан нэг кодын баазаас хөндлөн платформ програмуудыг боловсруулахад ашиглагддаг. Анх 2015 онд тайлбарласан  Flutter 2017 оны тавдугаар сард гарсан.


<details>
<summary>Flutter суулгах</summary>

Хамгийн эхлээд dart-sdk суулгах ёстойг анхаарна уу.

#### Macos

Macos дээр суулгаж байгаа тохиолдолд xcode болон pod-ийг заавал түрүүлж суулгасан байх шаардлагатай

```sh
brew install dart-sdk
```

```sh
 sudo softwareupdate --install-rosetta --agree-to-license
```

```sh
https://docs.flutter.dev/get-started/install/macos/desktop?tab=download

unzip ~/development/flutter_sdk_v1.0.0.zip -d ~/development/

export PATH=$HOME/development/flutter/bin:$PATH

 sudo sh -c 'xcode-select -s /Applications/Xcode.app/Contents/Developer && xcodebuild -runFirstLaunch'

 sudo xcodebuild -license

 sudo gem install cocoapods
```


#### Windows

```sh
choco install dart-sdk

scoop install dart-sdk
```

```sh
google chrome android studio болон visual studio community-г суулгаж C++ болон Android sdk CmdTools-ийш татаж авна
```

#### Debain based linux and Arch linux

```sh
sudo apt install dart-sdk

android studio татна google-chrome татна
```

```sh
yay -S dart-sdk

android studio татна google-chrome татна
```

```sh
yay -Sy android-sdk android-sdk-build-tools android-sdk-cmdline-tools-latest android-platform android-sdk-platform-tools

sudo cp -R /opt/android-sdk ~

cd ~
sudo chown -R yourusername:yourgroupname android-sdk

### set Envoirment

export ANDROID_HOME=$HOME/android-sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk

yes | flutter doctor --android-licenses
```

</details>


## 🚀 Логик <a name = "logiv"></a>

- Бусад апп хүүхдийг ганцааранг сурах зориулалтай байсан бөгөөд үнэ төлбөртэй байсан уг апп нь хүүхдийг эцэг эхтэй хамтад нь сууж гэр бүлийн харилцааг илүү дэмжих зориулалтай бөгөөд бага насны хүүхдэд өөрт таарсан контент болон хэрэгцээтэй зүйлээ сурж боловсроход нь туслах юм



## 🔧 Ажлуулах <a name = "run"></a>

#### 1. flutter-ийг ажилуулахад command нь flutter run гэсэн коммандыг directory доторх terminal дээрээ бичиж өгнө


```
flutter run
```

```
эсхүл vsCode дээрээ extensions суулгад шууд F5-ийг дарна ажилуулна.
```