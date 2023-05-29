import SwiftUI

struct MultiplicationView: View {
    
    
    
    @State var firstValue = Int.random(in: 1...12)
    @State var secondValue = 0
    
   
    @State var input = ""
    
   
    @State var answerChecked = false
    
  
    @State var answerCorrect = false
    
   

    
    var correctResponse: Int {
        return firstValue * secondValue
    }
    
    
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
           
            secondValue = Int.random(in: 1...12)
        }
    }
    
   
    func generateNewQuestion() {
        
        // Generate a new question
        firstValue = Int.random(in: 1...12)
        secondValue = Int.random(in: 1...12)

        
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

