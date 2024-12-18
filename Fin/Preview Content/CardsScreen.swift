//import SwiftUI
//import SwiftData
//
//struct CardsScreen: View {
//    @Environment(\.modelContext) private var modelContext // لتمكين التفاعل مع قاعدة البيانات
//    
//    @State private var cards: [Card] = [] // مصفوفة لتخزين الكروت المسترجعة
//    @State private var showingNewCardSheet = false // لعرض الـ Sheet الخاصة بإضافة Card جديد
//    
//    var body: some View {
//        VStack {
//            // Grid لعرض الـ Cards
//            ScrollView {
//                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
//                    ForEach(cards) { card in
//                        CardView(card: card) // عرض الكارد
//                    }
//                }
//                .padding()
//                
//                // زر لإضافة Card جديد
//                Button(action: {
//                    showingNewCardSheet.toggle()
//                }) {
//                    Text("Add New Card")
//                        .font(.title2)
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                }
//                .padding()
//            }
//            .sheet(isPresented: $showingNewCardSheet) {
//                NewCard() // عرض نافذة إضافة كارد جديد
//            }
//        }
//        .onAppear {
//            loadCards() // عند ظهور الشاشة، تحميل الكروت من قاعدة البيانات
//        }
//    }
//
//    // دالة لتحميل الكروت من قاعدة البيانات
//    private func loadCards() {
//        // استخدام modelContext لاسترجاع جميع الكروت من قاعدة البيانات باستخدام FetchDescriptor
//        do {
//            // إنشاء FetchDescriptor من نوع Card
//            let fetchDescriptor = FetchDescriptor<Card>()
//            
//            // استرجاع الكروت باستخدام modelContext
//            let cardsFetch = try modelContext.fetch(fetchDescriptor)
//            
//            // ترتيب الكروت حسب الـ id
//            cards = cardsFetch.sorted { $0.id < $1.id }
//        } catch {
//            print("Error loading cards: \(error.localizedDescription)")
//        }
//    }
//
//}

import SwiftUI
import SwiftData

struct CardsScreen: View {
    @Environment(\.modelContext) private var modelContext // للحصول على السياق
    @State private var cards: [Card] = [] // لتخزين الكروت المسترجعة
    @State private var showingNewCardSheet = false // لعرض الـ Sheet الخاصة بإضافة Card جديد
    
    var body: some View {
        VStack {
            // Grid لعرض الكروت
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(cards) { card in
                        CardView(card: card) // عرض الكارد
                    }
                }
                .padding()
                
                // زر لإضافة Card جديد
                Button(action: {
                    showingNewCardSheet.toggle()
                }) {
                    Text("Add New Card")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
            }
            .sheet(isPresented: $showingNewCardSheet) {
                NewCard(cards: $cards) // عرض نافذة إضافة كارد جديد
            }
        }
        .onAppear {
            loadCards() // عند ظهور الشاشة، تحميل الكروت من قاعدة البيانات
        }
    }
    
    // دالة لتحميل الكروت من قاعدة البيانات
    private func loadCards() {
        // استخدام modelContext لاسترجاع جميع الكروت من قاعدة البيانات
        do {
            // إنشاء FetchDescriptor من نوع Card
            let fetchDescriptor = FetchDescriptor<Card>()
            
            // استرجاع الكروت باستخدام modelContext
            let cardsFetch = try modelContext.fetch(fetchDescriptor)
            
            // ترتيب الكروت حسب الـ id
            cards = cardsFetch.sorted { $0.id < $1.id }
        } catch {
            print("Error loading cards: \(error.localizedDescription)")
        }
    }
}
struct CardsScreen_Previews: PreviewProvider {
    static var previews: some View {
        CardsScreen()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
