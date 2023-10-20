//
//  ContentView.swift
//  TestW04
//
//  Jessiline Imanuela - 0706022110010
//

import SwiftUI

struct ContentView: View {
    @State var skorBenar = 0
    @State var skorSalah = 0
    @State var jumlahKlik = 0
    @State var newRandom = 0
    @State var tampilkanAlert = false

    var asean = ["Indonesia", "Singapore", "Malaysia", "Laos", "Philipines", "Cambodia", "Myanmar", "Thailand", "Brunei", "Vietnam"]
    @State var angkaRandom = Int.random(in: 0...9)
    @State private var angkaRandomSet: Set<Int> = []

    var body: some View {
        ZStack{
            Color(red:234/255,green: 238/255,blue: 224/255)
                .ignoresSafeArea()
            VStack{
                Text("Pilih Bendera dari Negara : ")
                    .foregroundStyle(.black)
                Text(asean[angkaRandom])
                    .foregroundStyle(.black)
            }
        }

        HStack{
            Spacer()
            VStack{
                ForEach(0..<5) { number in
                    Button {
                        if number == angkaRandom {
                            skorBenar += 1
                        }
                        else {
                            skorSalah += 1
                        }
                        if angkaRandomSet.isEmpty{
                            angkaRandomSet.insert(angkaRandom)
                        }
                        
                        if angkaRandomSet.count != 10{
                            while angkaRandomSet.contains(newRandom) {
                                newRandom = Int.random(in: 0...9)
                            }
                        }
                        
                        angkaRandom = newRandom
                        angkaRandomSet.insert(newRandom)
                        jumlahKlik += 1
                        
                        if jumlahKlik >= 10 {
                            tampilkanAlert = true
                        }
                        
                    } label: {
                        
                        Image(asean[number])
                            .resizable()
                            .frame(width:105,height: 65)
                    }
                }
            }
            Spacer()
            VStack{
                ForEach(5..<10) { number in
                    Button {
                        if number == angkaRandom{
                            skorBenar += 1
                        }
                        else {
                            skorSalah += 1
                        }
                        if angkaRandomSet.isEmpty{
                            angkaRandomSet.insert(angkaRandom)
                        }
                        if angkaRandomSet.count != 10{
                            while angkaRandomSet.contains(newRandom) {
                                newRandom = Int.random(in: 0...9)
                            }
                        }
                        angkaRandom = newRandom
                        angkaRandomSet.insert(newRandom)
                        jumlahKlik += 1
                        
                        if jumlahKlik >= 10 {
                            tampilkanAlert = true
                        }
                    } label: {
                        Image(asean[number])
                            .resizable()
                            .frame(width:105,height: 65)
                    }
                }
            }
            Spacer()
        }
        
        .alert(isPresented: $tampilkanAlert) {
            Alert(
                title: Text("Skor Akhir"),
                message: Text("Benar : \(skorBenar) \nSalah : \(skorSalah)"),
                dismissButton: .default(Text("Reset Game")){
                    skorBenar = 0
                    skorSalah = 0
                    jumlahKlik = 0
                    newRandom = Int.random(in: 0...9)
                    angkaRandom = Int.random(in: 0...9)
                    angkaRandomSet = []
                }
            )
            
        }
    }
}

#Preview {
    ContentView()
}
