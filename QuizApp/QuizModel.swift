//
//  QuizModel.swift
//  QuizApp
//
//  Created by Rijo George on 8/9/20.
//  Copyright © 2020 Rijo George. All rights reserved.
//

import Foundation

protocol QuizProtocol {
    func questionsReceived(_ questions:[Question])
}

class QuizModel {
    
    var delegate : QuizProtocol?
    
    func getQuestions() {
        
        // TODO: - retrive questions
        //delegate?.questionsReceived([])
        //getLocalJSONFile()
        getRemoteJSONFile()
    }
    
    
    func getLocalJSONFile() {
        
        let path = Bundle.main.path(forResource: "QuestionData", ofType: "json")
        
        guard path != nil else{
            print("json file path not found")
            return
        }
        
        let url = URL(fileURLWithPath: path!)
        do{
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let questionArray = try decoder.decode([Question].self, from: data)
            delegate?.questionsReceived(questionArray)
        }
        catch {
            print("couldn't get data from url")
        }
    }
    
    func getRemoteJSONFile() {
        
        let urlString = "https://codewithchris.com/code/QuestionData.json"
        
        //create url objct
        let url = URL(string: urlString)
        
        guard url != nil else {
            print("cannot create url")
            return
        }
        
        //create shared session object
        let session = URLSession.shared
        
        // create datatask object
        let datatask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                
                do{
                    let decoder = JSONDecoder()
                    let questionArray = try decoder.decode([Question].self, from: data!)
                    
                    //move to main thread to update UI
                    DispatchQueue.main.async {
                        self.delegate?.questionsReceived(questionArray)
                    }
                    
                } catch {
                    print ("couldn't parse json")
                }
                
            }
            
        }
        
        
        //call resume on data Task
        datatask.resume()
    }
    
}
