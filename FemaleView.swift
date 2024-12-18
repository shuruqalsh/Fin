//
//  FemaleView.swift
//  Fin
//
//  Created by shuruq alshammari on 18/06/1446 AH.
//
import SwiftUI

struct FemaleView: View {
    @Environment(\.presentationMode) var presentationMode // للوصول إلى التنقل
    
    var body: some View {
        ZStack {
            // الخلفية
            Image("backgroundImage2") // صورة الخلفية الخاصة بالأنثى
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            // المحتوى
            VStack {
                Text("مرحبًا بكم في صفحة الأنثى!") // النص الترحيبي
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.black)
                    .padding()
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true) // إخفاء زر الرجوع
        .toolbar { // إلغاء السحب للرجوع
            ToolbarItem(placement: .navigationBarLeading) {
                EmptyView() // إخفاء أي عناصر إضافية
            }
        }
        .onAppear {
            // تعطيل إيماءة السحب للرجوع
            disableSwipeBack()
        }
    }
    
    // تعطيل السحب للرجوع
    func disableSwipeBack() {
        if let navigationController = UIApplication.shared.windows.first?.rootViewController as? UINavigationController {
            navigationController.interactivePopGestureRecognizer?.isEnabled = false
        }
    }
}

struct FemaleView_Previews: PreviewProvider {
    static var previews: some View {
        FemaleView()
    }
}
