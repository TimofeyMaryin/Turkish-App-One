//
//  BuisnessQuizFragment.swift
//  Turkish Opros 1
//
//  Created by Mac on 18.03.2024.
//

import Foundation
import SwiftUI

struct BuisnessQuizFragment : View {
    
    
    @State var countAnswer: Int = 0
    @State private var randomNumber = Int.random(in: 0...100)
    @State private var isCanNav = false
    
    
    var body: some View {
        
        
        NavigationView(content: {
            ScrollView {
                Text("Ankete katılın ve bir iş kurmak için ne kadar hazır olduğunuzu öğrenin. ")
                    .multilineTextAlignment(.center)

                ForEach(0..<10) { item in
                    QuizItem(model: allBuisnessQuiz[item]) {
                        countAnswer+=1
                        
                    }
                }
                NavigationLink(
                    isActive: .constant(countAnswer == 10),
                    destination: {
                        FinishFragment(progress: randomNumber)
                        
                    },
                    label: {
                        Text("Sonuçlandırın")
                            .frame(width: 250, height: 50)
                            .background(countAnswer == 10 ? Color.blue : Color.gray)
                            .cornerRadius(10)
                            .foregroundColor(.black)
                    })
                
                
                
                
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            
        })
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("İş Dünyası")
    }
}
