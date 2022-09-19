//
//  UserUtils.swift
//  final ass
//
//  Created by Triet, Luu Huynh on 11/09/2022.
//
import Foundation

class UserUtils {
    static var shared = UserUtils()
    
    func setDarkMode(enable: Bool) {
        let defaultvalue = UserDefaults.standard
        defaultvalue.set(enable, forKey: Mode.DARK)
    }
    
    func getDarkMode() -> Bool {
        let defaultvalue = UserDefaults.standard
        return defaultvalue.bool(forKey: Mode.DARK)
    }
}
