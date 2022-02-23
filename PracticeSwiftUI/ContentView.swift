//
//  ContentView.swift
//  PracticeSwiftUI
//
//  Created by 양호준 on 2022/02/22.
//

import SwiftUI

// SwiftUI의 가장 큰 장점은 UI와 로직이 명확하게 구분되어 있다는 것이다
// UI와 로직을 연결할 때에는 객체 지향 프로그래밍을 사용할 것이다.
// 여기선 주로 함수형 프로그래밍을 사용할 것이다.

struct ContentView: View { // View로 표시한 것이 함수형 프로그래밍으로 해당 타입이 어떤 행동을 하는지 나타난다
    /*
     View 프로토콜을 채택하는 것은 양날의 검이다.
     View 프로토콜에 정의한 다양한 함수를 사용할 수 있지만 이를 위해 구현해야 하는 것들도 존재한다.
     */
    var body: some View { // some은 왜 붙어있을까? View의 행동을 한다는 것을 표시해준다. 레고로 보자면 집 레고를 만드는데 필요한 주방 레고인 셈이다. 레고의 경우도 1000개가 넘는 부품이 있더라도 각 항목에 맞게 비닐 팩에 담겨져 있다. View도 화면에 올라갈 것들을 담는 가방이라고 생각해도 좋다. padding이 없으면 단순히 Text로 타입 명시를 해줄 수도 있지만 some View로 작성하는 것이 종국적으로 더 많은 정보를 제공한다.
        
        return ZStack(content: {
            RoundedRectangle(cornerRadius: 25.0)
                .stroke(lineWidth: 3) // default는 fill()로 되어 있음.
//                .padding(.horizontal)
//                .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/) // 인스펙터에 원하는 것이 없다면 가장 밑에서 검색할 수도 있다.
            
            Text("Hello, CS193p!")
//                .foregroundColor(Color.orange) // 앞에 return이 숨겨져 있는 것이다.
//                .padding(.all) // 소괄호 안에 아무것도 넣지 않으면 default padding이 적용된다. 이 때 기기(맥, 아이폰, 애플워치, 애플티비 등) 마다 padding이 다르기 때문에 효율적이다. padding은 Text를 리턴하는 것이 아니라 수정된 View가 리턴된다.
        })
            .padding(.horizontal) //
            .foregroundColor(.red) // 안에 foreground 함수를 제거하고 설정하면 ZStack 내에 모든 것이 한 번에 바뀐다.
        
        //        return RoundedRectangle(cornerRadius: 25.0)
        //            .stroke(lineWidth: 3) // default는 fill()로 되어 있음.
        //            .padding(.horizontal)
        //            .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/) // 인스펙터에 원하는 것이 없다면 가장 밑에서 검색할 수도 있다.
        
        //        Text("Hello, CS193p!")
        //            .foregroundColor(Color.orange) // 앞에 return이 숨겨져 있는 것이다.
        //            .padding(.all) // 소괄호 안에 아무것도 넣지 않으면 default padding이 적용된다. 이 때 기기(맥, 아이폰, 애플워치, 애플티비 등) 마다 padding이 다르기 때문에 효율적이다. padding은 Text를 리턴하는 것이 아니라 수정된 View가 리턴된다.
    } // 함수형이기 때문에 저장 프로퍼티로 메모리에 저장되지 않는다. 연산 프로퍼티로 실행된다.
}

// 얘는 glue 코드로 현재로선 잘 사용하지 않을 예정
// 위 코드를 previewer에 띄워줄 수 있도록 붙여주는 역할을 한다.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
