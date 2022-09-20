/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Group 28
  Created  date: 05/09/2022
  Last modified: 20/09/2022
*/
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
