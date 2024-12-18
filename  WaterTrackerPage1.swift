//
//  File.swift
//  Fin
//
//  Created by shuruq alshammari on 17/06/1446 AH.
//

import SwiftUI

struct WaterTrackerPage1: View {
    @State private var bodyWeight: String = ""
    
    var body: some View {
        NavigationView { // 1. إضافة NavigationView
            VStack(spacing: 30) { // التباعد بين العناصر
                
                // Water drop icon
                Image(systemName: "drop.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .foregroundColor(Color(red: 89/255, green: 171/255, blue: 224/255)) // اللون المخصص لقطرة الماء
                
                // Title text
                Text("Hydrate")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                // Description text
                Text("Start with Hydrate to record and track your water intake daily based on your needs and stay hydrated")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                
                // Body weight input
                HStack {
                    Text("Body weight")
                        .font(.headline)
                    TextField("Value", text: $bodyWeight)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                }
                .padding(.horizontal, 40)
                
                // Next Button
                NavigationLink(destination: WaterTrackerPage2()) { // 2. إضافة NavigationLink للانتقال إلى WaterTrackerPage2
                    Text("Next")
                        .font(.headline)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 89/255, green: 171/255, blue: 224/255)) // اللون المخصص لزر Next
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 40)
                
            }
            .padding(.top, 50)
        }
    }
}

struct WaterTrackerPage2: View { // 3. إضافة صفحة WaterTrackerPage2
    var body: some View {
        Text("This is Water Tracker Page 2") // محتوى الصفحة الثانية
            .font(.largeTitle)
            .navigationBarTitle("Page 2", displayMode: .inline) // 4. إضافة عنوان للنافبار في الصفحة الثانية
    }
}

struct WaterTrackerPage1_Previews: PreviewProvider {
    static var previews: some View {
        WaterTrackerPage1()
    }
}
