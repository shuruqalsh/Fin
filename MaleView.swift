//
//  MaleView.swift
//  Fin
//
//  Created by shuruq alshammari on 18/06/1446 AH.
//
import SwiftUI

struct MaleView: View {
    @Environment(\.presentationMode) var presentationMode // للوصول إلى التنقل
    
    var body: some View {
        ZStack {
            // الخلفية
            Image("backgroundImage2") // صورة الخلفية للذكر
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            // محتوى الصفحة
            Text("مرحبًا بكم في صفحة الذكر!")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.black)
        }
        .navigationBarBackButtonHidden(true) // إخفاء زر الرجوع
        .toolbar { // إلغاء السحب للرجوع
            ToolbarItem(placement: .navigationBarLeading) {
                EmptyView() // إخفاء الأزرار الأخرى
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

struct MaleView_Previews: PreviewProvider {
    static var previews: some View {
        MaleView()
    }
}
