import ChineseAstrologyCalendar
import MusicTheory
import Testing
@testable import ChineseTranditionalMusicCore

@Suite struct LocalizedNamesTests {

  @Test func lvlvZhHantMatchesCanonical() {
    for key in Key.shierLvLv {
      #expect(key.localizedLvlvName(in: .zhHant) == key.lvlvDescription)
    }
  }

  @Test func wuyinAndQishenZhHantMatchCanonical() {
    for key in Key.wuyin {
      #expect(key.localizedWuyinName(in: .zhHant) == key.wuyinChineseName)
    }
    for key in Key.qishen {
      #expect(key.localizedQiShenName(in: .zhHant) == key.qiShenChineseName)
    }
  }

  @Test func everyLanguageIsNonEmpty() {
    for language in DisplayLanguage.allCases {
      for key in Key.shierLvLv {
        #expect(!key.localizedLvlvName(in: language).isEmpty)
      }
      for key in Key.wuyin {
        #expect(!key.localizedWuyinName(in: language).isEmpty)
      }
      for key in Key.qishen {
        #expect(!key.localizedQiShenName(in: language).isEmpty)
      }
      #expect(!變.清.localizedName(in: language).isEmpty)
      #expect(!變.變.localizedName(in: language).isEmpty)
    }
  }

  @Test func spanishIsABuiltInLanguage() {
    #expect(DisplayLanguage.allCases.contains(.es))
    #expect(DisplayLanguage(identifier: "es-ES") == .es)
    #expect(DisplayLanguage(identifier: "es-MX") == .es)
  }

  @Test(arguments: DisplayLanguage.allCases.filter { $0 != .zhHant && $0 != .zhHans })
  func nonChineseLanguagesHaveNoHanCharacters(language: DisplayLanguage) {
    let names =
      Key.shierLvLv.map { $0.localizedLvlvName(in: language) }
      + Key.wuyin.map { $0.localizedWuyinName(in: language) }
      + Key.qishen.map { $0.localizedQiShenName(in: language) }
      + [變.清, 變.變].map { $0.localizedName(in: language) }

    for name in names {
      #expect(!name.unicodeScalars.contains { $0.properties.isIdeographic }, "\(language): \(name)")
    }
  }

  @Test func spanishLvlvNames() {
    #expect(
      Key.shierLvLv.map { $0.localizedLvlvName(in: .es) } == [
        "Huángzhōng", "Dàlǚ", "Tàicù", "Jiázhōng", "Gūxiǎn", "Zhònglǚ",
        "Ruíbīn", "Línzhōng", "Yízé", "Nánlǚ", "Wúyì", "Yìngzhōng",
      ])
  }

  @Test func spanishWuyinAndQishenNames() {
    #expect(Key.wuyin.map { $0.localizedWuyinName(in: .es) } == ["Gōng", "Shāng", "Jué", "Zhǐ", "Yǔ"])
    #expect(Key.gong.localizedQiShenName(in: .es) == "Gōng")
    #expect(Key.shang.localizedQiShenName(in: .es) == "Shāng")
    #expect(Key.jue.localizedQiShenName(in: .es) == "Jué")
    #expect(Key.wei.localizedQiShenName(in: .es) == "Zhǐ")
    #expect(Key.yu.localizedQiShenName(in: .es) == "Yǔ")
    #expect(Key.qingyu.localizedQiShenName(in: .es) == "Qīngyǔ")
    #expect(Key.biangong.localizedQiShenName(in: .es) == "Biàngōng")
    #expect(Key.qingjue.localizedQiShenName(in: .es) == "Qīngjué")
    #expect(Key.bianhui.localizedQiShenName(in: .es) == "Biànzhǐ")
    #expect(變.清.localizedName(in: .es) == "Qīng")
    #expect(變.變.localizedName(in: .es) == "Biàn")
  }

  /// The Spanish names the app shows next to these come from ChineseAstrologyCalendar.
  @Test func spanishWuxingOfWuyin() {
    #expect(Key.wuyin.map { $0.wuxing.localizedName(in: .es) } == ["Tierra", "Metal", "Madera", "Fuego", "Agua"])
  }

  @Test func simplifiedSpotChecks() {
    #expect(Key.huangzhong.localizedLvlvName(in: .zhHans) == "黄钟")
    #expect(Key.dalv.localizedLvlvName(in: .zhHans) == "大吕")
    #expect(Key.yinzhong.localizedLvlvName(in: .zhHans) == "应钟")
    #expect(Key.gong.localizedWuyinName(in: .zhHans) == "宫")
    #expect(Key.wei.localizedWuyinName(in: .zhHans) == "徵")
    #expect(Key.bianhui.localizedQiShenName(in: .zhHans) == "变徵")
    #expect(Key.biangong.localizedQiShenName(in: .zhHans) == "变宫")
  }

  @Test func englishSpotChecks() {
    #expect(Key.huangzhong.localizedLvlvName(in: .en) == "Huángzhōng")
    #expect(Key.wushe.localizedLvlvName(in: .en) == "Wúyì")
    #expect(Key.gong.localizedWuyinName(in: .en) == "Gōng")
    #expect(Key.wei.localizedWuyinName(in: .en) == "Zhǐ")
    #expect(Key.yu.localizedWuyinName(in: .ru) == "Yǔ")
    #expect(Key.qingjue.localizedQiShenName(in: .en) == "Qīngjué")
    #expect(變.變.localizedName(in: .zhHans) == "变")
  }
}
