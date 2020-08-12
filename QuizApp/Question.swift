//
//  Question.swift
//  QuizApp
//
//  Created by Rijo George on 8/9/20.
//  Copyright © 2020 Rijo George. All rights reserved.
//

import Foundation

struct Question : Codable {
    
    var question:String?
    var answers:[String]?
    var correctAnswerIndex:Int?
    var feedback:String?
    
    
}
