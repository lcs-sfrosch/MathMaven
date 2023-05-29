//
//  MultiplicationView.swift
//  MathMaven
//
//  Created by Russell Gordon on 2023-05-24.
//

import SwiftUI

struct MultiplicationView: View {
    var body: some View {
        VStack {
            Text("Multiplication")
            Text(Operation.multiplication.rawValue)
        
        .font(Font.custom("SF Pro", size: 64))

    
    @State var firstValue = Int.random(in: 1...144)
    @State var secondValue = 0  // Will be updated once view loads
    
    // Holds whatever input was provided by the user
    @State var input = ""
    
    // Has the user's answer been checked?
    @State var answerChecked = false
    
    // Was the user's given answer correct?
    @State var answerCorrect = false
    
    // MARK: Computed properties

    // The correct response
    var correctResponse: Int {
        return firstValue / secondValue
    }
    
    // The user interface
    var body: some View {
        VStack(spacing: 0) {
            
            
            Group {
                HStack {
                    Text(Operation.multiplication.rawValue)
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("\(firstValue)")
                        Text("\(secondValue)")
                    }
                }
                
                Divider()
            }
            .padding(.horizontal)

           
            HStack {

                ZStack {
                    
                   
                    if answerCorrect == true {
                        Image(systemName: "checkmark.circle")
                            .foregroundColor(.green)
                    }
                    
                    
                    if answerChecked == true && answerCorrect == false {
                        Image(systemName: "x.square")
                            .foregroundColor(.red)
                    }
                }
                
                Spacer()
                
                TextField("",
                          text: $input)
                    .multilineTextAlignment(.trailing)
            }
            .padding(.horizontal)

            
            if answerChecked == false {
                
                CheckAnswerButtonView(input: input,
                                      correctResponse: correctResponse,
                                      answerChecked: $answerChecked,
                                      answerCorrect: $answerCorrect)
                
            } else {
                
              
                Button(action: {
                    generateNewQuestion()
                }, label: {
                    Text("New question")
                        .font(.largeTitle)
                })
                .padding()
                .buttonStyle(.bordered)
                
            }
            
            Spacer()

        }
        .font(Font.custom("SF Pro", size: 64))
    
        .task {
            
            secondValue = Int.random(in: 1...firstValue)
        }
    }
    
    
    func generateNewQuestion() {
        
      
        firstValue = Int.random(in: 1...144)
        secondValue = Int.random(in: 1...firstValue)

        
        answerChecked = false
        answerCorrect = false
        
       
        input = ""

    }
}

struct MultiplicationView_Previews: PreviewProvider {
    static var previews: some View {
        MultiplicationView()
    }
}
