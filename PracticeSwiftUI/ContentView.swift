//
//  ContentView.swift
//  PracticeSwiftUI
//
//  Created by ์ํธ์ค on 2022/02/22.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["๐", "โ๏ธ", "๐ฐ", "๐ณ", "๐", "๐", "๐", "๐ธ", "โต๏ธ", "๐", "๐ถ", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐ฒ", "๐ต", "๐ด", "๐ ", "๐", "๐ค"]
    @State var emojiCount = 24
    
    var body: some View {
        VStack { // Stack ๋ด๋ถ์ ์๋ ์ฝ๋ ๋ธ๋ญ์ด ๋ฐ๋ก View Builder์ด๋ค.
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) { // LazyVGrid๋ฅผ ์ฌ์ฉํ๋ฉด ๋์ด๊ฐ ์ต์ํ์ผ๋ก ๋ง์ถฐ์ง๋ค.
                    ForEach(emojis[0..<emojiCount], id: \.self, content: { emoji in // Referencing initializer 'init(_:content:)' on 'ForEach' requires that 'String' conform to 'Identifiable' ๋ชจ๋  ๊ตฌ์กฐ์ฒด๊ฐ Identifiable์ ์ฑํํ๊ณ  ์๋ค. ๊ฐ๊ฐ์ id๊ฐ ํ์ํ๋ค.
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    })
                }
            }
            
            .foregroundColor(.red)
            Spacer() // ๋ฒํผ๊ณผ ์ ํญ๋ชฉ๋ค ์ฌ์ด์ ๊ณต๊ฐ์ ์ค๋ค. ์ด๊ฒ ์์ผ๋ฉด ๋ฒํผ๊ณผ ํญ๋ชฉ๋ค์ด ๋ถ๊ฒ ๋๋ค. ๊ณต๊ฐ์ ๊ฒฝ์ฐ ์ ๋์ ์ผ๋ก ์ ์ฉ๋๋ค. HStack์ ์ฌ์ฉํ  ๊ฒฝ์ฐ ํ์ ๋ทฐ๋ค์ด ๊ธธ์ด๊ฐ ๊ธธ์ด์ง๋ฉฐ Spacer ๊ณต๊ฐ์ด ์ ์ง๋ง LazyVGrid๋ฅผ ์ฌ์ฉํ  ๊ฒฝ์ฐ ๊ณต๊ฐ์ด ์์ฒญ ๋์ด๋๋ค.
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add: some View {
        Button(action: {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        }, label: {
            Image(systemName: "plus.circle")
        })
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = false // ์ด๊ฑด ๋ฉ๋ชจ๋ฆฌ ์ด๋๊ฐ์ ์๋ ํฌ์ธํฐ๋ค. ๊ฐ์ด ๋ณํ๋  ๊ทธ๋ ์ง ์๋  ํญ์ ๊ฐ์ ๊ณต๊ฐ์ ๊ฐ๋ฆฌํจ๋ค.
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)

            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3) // ์คํฌ๋กค ๋ทฐ๋ ํด๋น ์์ญ์ ๋ฒ์ด๋๋ฉด ์๋ฅธ๋ค. ๋ฐ๋ผ์ lineWidth๊ฐ ๋์ด๋๋ฉด ์๋ฆฌ๊ฒ ๋๋ค. ์ด๋ strokeBorder๋ฅผ ์ฌ์ฉํ๋ฉด ์์ญ ๋ด์์ ๋๊บผ์์ง
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark) // ์ด๋ ๊ฒ 2๊ฐ๋ฅผ ๋์์ ๋์์ ๋ณผ ์๋ ์๋ค!
        ContentView()
            .preferredColorScheme(.light) // ์ฌ๊ธฐ ์ธ์คํํฐ๋ฅผ ํตํด ๊ธฐ๊ธฐ, ๋คํฌ๋ชจ๋ ๋ฑ์ ๋ฐ๊ฟ ์ ์๋ค.
    }
}
