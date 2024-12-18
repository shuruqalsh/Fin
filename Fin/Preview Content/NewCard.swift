//
//  NewCard.swift
//  AutismAppTest
//
//  Created by Sumayah Alqahtani on 17/06/1446 AH.
//

//import SwiftUI
//import SwiftData
//
//struct NewCard: View {
//    @Environment(\.modelContext) private var modelContext // لتمكين التفاعل مع قاعدة البيانات
//    @State private var emoji: String = ""
//    @State private var description: String = ""  // الوصف الذي يدخله المستخدم
//    
//    var body: some View {
//        VStack {
//            TextField("Enter Emoji", text: $emoji)
//                .font(.largeTitle)
//                .multilineTextAlignment(.center)
//                .padding()
//                .keyboardType(.default)
//            
//            TextField("Enter Description", text: $description)
//                .font(.body)
//                .padding()
//                .keyboardType(.default)
//            
//            Button("Save") {
//                if !emoji.isEmpty && !description.isEmpty {
//                    // إنشاء Card جديد
//                    let newCard = Card(emoji: emoji, cardDescription: description)
//                    modelContext.insert(newCard) // إضافة الـ Card إلى الـ Context
//                    try? modelContext.save() // حفظ الـ Context
//                    emoji = ""
//                    description = ""
//                }
//            }
//            .padding()
//            .background(Color.blue)
//            .foregroundColor(.white)
//            .cornerRadius(10)
//            
//            Spacer()
//        }
//        .padding()
//    }
//}
import SwiftUI
import SwiftData

struct NewCard: View {
    @Environment(\.modelContext) private var modelContext // للحصول على السياق
    @Binding var cards: [Card] // لإعادة تحميل الكروت بعد إضافة كارد جديد
    @State private var emoji: String = ""
    @State private var description: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter Emoji", text: $emoji)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .padding()
                .keyboardType(.default)
            
            TextField("Enter Description", text: $description)
                .font(.body)
                .padding()
                .keyboardType(.default)
            
            Button("Save") {
                if !emoji.isEmpty && !description.isEmpty {
                    // إنشاء كارد جديد
                    let newCard = Card(emoji: emoji, cardDescription: description)
                    
                    // إضافة الكارد إلى الـ modelContext
                    modelContext.insert(newCard)
                    
                    // حفظ التغييرات في الـ modelContext
                    do {
                        try modelContext.save()
                        
                        // بعد حفظ الكارد، نحدث قائمة الكروت في الـ parent view
                        cards.append(newCard)
                        
                        // إعادة تعيين القيم المدخلة
                        emoji = ""
                        description = ""
                    } catch {
                        print("Error saving card: \(error.localizedDescription)")
                    }
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Spacer()
        }
        .padding()
    }
}
struct NewCard_Previews: PreviewProvider {
    @State static var mockCards: [Card] = [] // Create a mock array of cards

    static var previews: some View {
        NewCard(cards: $mockCards) // Pass the mock array as a binding
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
