//
//  FinishFragment.swift
//  Turkish Opros 1
//
//  Created by Mac on 18.03.2024.
//

import Foundation
import SwiftUI


struct FinishFragment : View {
    
    var progress: Int
    
    let height: CGFloat = 10
    @State private var showAlert = false

    
    var body: some View {
        NavigationView(content: {

            
            GeometryReader(content: { geometry in
                VStack(alignment: .center,content: {
                    VStack(alignment: .center, content: {
                        Spacer()
                        Image("trophy-prize-medal-svgrepo-com")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 200)
                        
                        Spacer()
                        Text("Sonucunuz: \(progress)%")
                            .foregroundColor(.white)
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        
                        Text("Testten keyif aldınız mı?")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        HStack(content: {
                            Button("Evet") {
                                showAlert = true
                            }
                            Button("Hayır") {
                                showAlert = true
                            }
                            
                        })
                        Spacer()
                        
                    })
                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.9)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                })
                .frame(width: geometry.size.width, height: geometry.size.height)
                
            })
            .navigationTitle("Tebrikler!!!")
            .alert("Değerlendirme için teşekkürler!", isPresented: $showAlert, actions: {Button("OK", role: .cancel) { }})
        })
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
        
    }
}
