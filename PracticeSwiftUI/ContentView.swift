//
//  ContentView.swift
//  PracticeSwiftUI
//
//  Created by 양호준 on 2022/02/22.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚂", "✈️", "🛰", "🛳", "🚍", "🚖", "🚄", "🛸", "⛵️", "🚀", "🛶", "🚎", "🚙", "🚗", "🚑", "🚚", "🚜", "🏍", "🚲", "🛵", "🛴", "🚠", "🚔", "🚤"]
    @State var emojiCount = 24
    
    var body: some View {
        VStack { // Stack 내부에 있는 코드 블럭이 바로 View Builder이다.
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) { // LazyVGrid를 사용하면 높이가 최소한으로 맞춰진다.
                    ForEach(emojis[0..<emojiCount], id: \.self, content: { emoji in // Referencing initializer 'init(_:content:)' on 'ForEach' requires that 'String' conform to 'Identifiable' 모든 구조체가 Identifiable을 채택하고 있다. 각각의 id가 필요하다.
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    })
                }
            }
            
            .foregroundColor(.red)
            Spacer() // 버튼과 위 항목들 사이에 공간을 준다. 이게 없으면 버튼과 항목들이 붙게 된다. 공간의 경우 유동적으로 적용된다. HStack을 사용할 경우 하위 뷰들이 길이가 길어지며 Spacer 공간이 적지만 LazyVGrid를 사용할 경우 공간이 엄청 늘어난다.
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
    @State var isFaceUp: Bool = false // 이건 메모리 어딘가에 있는 포인터다. 값이 변하든 그렇지 않든 항상 같은 공간을 가리킨다.
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)

            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3) // 스크롤 뷰는 해당 영역에 벗어나면 자른다. 따라서 lineWidth가 늘어나면 잘리게 된다. 이때 strokeBorder를 사용하면 영역 내에서 두꺼워짐
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
            .preferredColorScheme(.dark) // 이렇게 2개를 띄워서 동시에 볼 수도 있다!
        ContentView()
            .preferredColorScheme(.light) // 여기 인스펙터를 통해 기기, 다크모드 등을 바꿀 수 있다.
    }
}
