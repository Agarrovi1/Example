//
//  WordData.swift
//  TextTwist
//
//  Created by Angela Garrovillas on 8/6/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation

class WordData {
    static let allInfo: [TestTwistInfo] = [
        TestTwistInfo(wordCount: 26,
                      letters: "cdenno",
                      words: ["conned", "coden","coned", "donne", "nonce","code","coed","cone","conn","deco","done","neon","node","none","once", "cod","con","den","doc","doe","don","end","eon","nod","ode","one"]),
        TestTwistInfo(wordCount: 17,
                      letters: "ehhssu",
                      words: ["hushes", "shush", "hehs","hues","hush","shes","sues","uses", "ess","heh","hes","hue","huh","she","shh","sue","use"]),
        TestTwistInfo(wordCount: 13,
                      letters: "hisswy",
                      words: ["swishy", "hissy","swish", "hiss","whys","wish","wiss","ywis", "his","shy","sis","why","wis"])
    ]
    static func pickRandomTextTwistInfo() -> TestTwistInfo {
        if let unwrap = self.allInfo.randomElement() {
            return unwrap
        }
        return self.allInfo[0]
    }
}

