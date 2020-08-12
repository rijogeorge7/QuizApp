//
//  StateManager.swift
//  QuizApp
//
//  Created by Rijo George on 8/11/20.
//  Copyright © 2020 Rijo George. All rights reserved.
//

import Foundation

class StateManager {
    
    static var numCorrectKey = "numberCorrectKey"
    static var questionIndexKey = "questionIndexKey"
    
    static func saveState(numCorrect:Int, questionIndex:Int) {
        
        let defaults = UserDefaults.standard
        defaults.set(numCorrect, forKey: numCorrectKey)
        defaults.set(questionIndex, forKey: questionIndexKey)
        
    }
    
    static func retriveValue(key:String) -> Any {
        let defaults = UserDefaults.standard
        return defaults.value(forKey: key)
    }
    
    static func clearState() {
        
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey:numCorrectKey)
        defaults.removeObject(forKey: questionIndexKey)
        
    }
    
}
