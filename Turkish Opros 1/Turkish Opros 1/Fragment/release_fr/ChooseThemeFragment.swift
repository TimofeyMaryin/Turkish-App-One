//
//  ChooseThemeFragment.swift
//  Turkish Opros 1
//
//  Created by Mac on 18.03.2024.
//

import Foundation
import SwiftUI
import SwiftUITooltip

// finance-business-exchange-rating-rate-svgrepo-com

struct ChooseThemeFragment : View {
    
    var tooltipConfig = DefaultTooltipConfig()

    init() {
        self.tooltipConfig.enableAnimation = true
        self.tooltipConfig.animationOffset = 10
        self.tooltipConfig.animationTime = 1
    }
    
    var body: some View {
        NavigationView(
            content: {
                ScrollView(content: {
                    Spacer().frame(height: 70)
                    Text("Bir sonraki anketiniz için bir konu seçin!")
                        .multilineTextAlignment(.center)
                        .font(.title)
                    
                    Spacer().frame(height: 20)
                    
                    Text("Karta tıklayın ve testi yapmaya başlayın!")
                        .font(.title3)
                        .foregroundColor(.gray.opacity(0.5))
                        .multilineTextAlignment(.center)
                    
                    Spacer().frame(height: 20)
                    
                    NavigationLink(destination: { FinanceQuizFragment() }, label: {
                        ChooseThemeButton(themeName: "Finans", image: "choose-theme-business-service", baseInfo: "Finansla ilgili bir sınav kartı bütçeleme, yatırım, vergilendirme, hisse senedi, tahvil, sigorta, kredi, finansal okuryazarlık vb. kavramlarla ilgili sorular içerebilir.", onClick: {})
                    })
                    Spacer().frame(height: 20)
                    NavigationLink(destination: BuisnessQuizFragment(), label: {
                        ChooseThemeButton(themeName: "İş Dünyası", image: "finance-business-exchange-rating-rate-svgrepo-com", baseInfo: "Bir işletme sınav kartı, şirket türleri, pazarlama stratejileri, finansal terimler, ünlü girişimciler ve iş modelleri hakkında sorular içerebilir.", onClick: {})
                    })
                    Spacer().frame(height: 10)
                    Text("Konu seçiminiz, finans dünyasının en önemli yönlerine odaklanmamıza ve anket katılımcılarından değerli geri bildirimler almamıza yardımcı olacaktır. Tartışma için uygun bir konu seçerek anketimizi daha odaklı ve bilgilendirici hale getirmemize yardımcı olun.")
                        .italic()
                        .foregroundColor(.gray.opacity(0.5))
                        .multilineTextAlignment(.center)
                        .font(.caption)
                    
                })
                .navigationTitle("Bir konu seç")
            }
        )
        
        
    }
}



private struct ChooseThemeButton : View {
    var themeName: String
    var image: String
    var baseInfo: String
    var onClick: () -> Void
    
    @State private var showingAlert = false
    @State private var level: Int = 0
    
    var body: some View {
        VStack(content: {
            HStack(content: {
                Spacer()
                Button {
                    showingAlert = true
                } label: {
                    Image(systemName: "info.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .foregroundColor(.blue)
                        .frame(width: 30, height: 30)
                }
                Spacer().frame(width: 10)
            })
            .padding([.top], 10)
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill )
                .frame(width: 100, height: 100)
                .padding([.top], 10)
            
            Text(themeName)
                .foregroundColor(.white)
                .font(.title)
                .fontWeight(.semibold)
                .padding([.horizontal], 10)
            
            Spacer().frame(height: 10)
            Text("Zorluk seviyesi")
                .foregroundColor(.white)
            Spacer().frame(height: 20)
            HStack(content: {
                Button(action: {
                    if level > 0 {
                        level -= 1
                    }
                }, label: {
                    Image(systemName: "minus.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 35, height: 35)
                })
                Text(String(level))
                    .bold()
                    .font(.title3)
                    .padding([.horizontal], 20)
                
                Button(action: {
                    if level <= 4 {
                        level += 1
                    }
                    
                }, label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 35, height: 35)
                })
            })
            Spacer().frame(height: 20)
//            Button(action: {}, label: {
//                Label("Start", systemImage: "restart.circle")
//                    .font(.title2)
//            })
//            .buttonStyle(.bordered)
//            .padding([.bottom], 20)
            
        })
        .frame(width: 350)
        .padding([.horizontal], 10)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        .alert(isPresented: $showingAlert, content: {
            Alert(
                title: Text("Short Info"),
                message: Text(baseInfo),
                dismissButton: .default(Text("Got it"))
            )
        })
        
    }
}
