# MVVM-Sample-Combine-SwiftUI

[![Github issues](https://img.shields.io/github/issues/Kyome22/MVVM-Sample-Combine-SwiftUI)](https://github.com/Kyome22/MVVM-Sample-Combine-SwiftUI/issues)
[![Github forks](https://img.shields.io/github/forks/Kyome22/MVVM-Sample-Combine-SwiftUI)](https://github.com/Kyome22/MVVM-Sample-Combine-SwiftUI/network/members)
[![Github stars](https://img.shields.io/github/stars/Kyome22/MVVM-Sample-Combine-SwiftUI)](https://github.com/Kyome22/MVVM-Sample-Combine-SwiftUI/stargazers)
[![Github top language](https://img.shields.io/github/languages/top/Kyome22/MVVM-Sample-Combine-SwiftUI)](https://github.com/Kyome22/MVVM-Sample-Combine-SwiftUI/)
[![Github license](https://img.shields.io/github/license/Kyome22/MVVM-Sample-Combine-SwiftUI)](https://github.com/Kyome22/MVVM-Sample-Combine-SwiftUI/)

MVVM の練習に Combine と SwiftUI でシンプルなサンプルを作ってみたものです。<br/>
[iOS アプリ設計パターン入門の MVVM サンプル](https://github.com/peaks-cc/iOS_architecture_samplecode/tree/master/07)と同様のものを Combine で再現しています。

```plain:構造
┬─ Model
│   ├─ SampleModel (SampleModelProtocol)
│   └─ SampleModelError
│
├─ ViewModel
│   ├─ SampleViewModel
│   └─ Extension+SampleModelError
│
└─ View
    ├─ MVVM_Sample_Combine_SwiftUIApp
    └─ SampleView
```

## スクリーンショット

<img src="./screenshots/screenshot_standby.png" alt="standby" width="300px" />

<img src="./screenshots/screenshot_ok.png" alt="ok" width="300px" />

## テスト

- UnitTest
  - SampleModelTests
  - SampleViewModelTests
- UITest
  - MVVMSampleUITests
