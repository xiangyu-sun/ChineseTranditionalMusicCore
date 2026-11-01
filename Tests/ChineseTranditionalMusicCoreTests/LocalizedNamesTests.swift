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
