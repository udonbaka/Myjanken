//
//  ContentView.swift
//  Myjanken
//
//  Created by Hide Shin on 2022/06/03.
//

import SwiftUI

struct ContentView: View {
    
    //@Stateを付与するとプログラム内で変数の値を更新できる。
    @State var answerNumber = 0
    
    var body: some View {

        VStack {
            // スペースを追加
            Spacer()
            
            // じゃんけんの数字が0だったら
            if answerNumber == 0 {
                Text("これからじゃんけんをします")

                .padding(.bottom)
                
            } else if answerNumber == 1 {
                // じゃんけんの数字が1だったら、グー画像を指定
                Image("gu")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
                
                // じゃんけんの種類を指定
                Text("グー")
                // 下辺に余白を設定
                .padding(.bottom)
                
            } else if answerNumber == 2 {
                // じゃんけんの数字が2だったら、チョキ画像を指定
                Image("choki")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()

                Text("チョキ")
                .padding(.bottom)
                
            } else {
                // じゃんけんの数字が「1」と「2」以外だったら、パー画像を指定
                Image("pa")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
                
                Text("パー")
                .padding(.bottom)
            } // ifここまで
            
            // [じゃんけんをする！]ボタン
            Button(action: {
                // 新しいじゃんけんの結果を一時的に格納する変数を設ける
                var newAnswerNumber = 0
                
                // ランダムに結果を出すが、前回の結果と異なる場合のみ採用
                // repeatは繰り返しを意味する
                repeat {
                    // 1,2,3の変数をランダムに算出（乱数）
                    newAnswerNumber = Int.random(in: 1...3)
                    
                    // 前回と同じ結果のときは再度ランダム. 異なる結果のときはrepeatを抜ける
                } while answerNumber == newAnswerNumber
                
                // 新しいじゃんけんの結果を格納
                answerNumber = newAnswerNumber
            }) {
                // Buttonに表示する文字を指定
                Text("じゃんけんをする！")
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .font(.title)
                    .background(Color.pink)
                    .foregroundColor(Color.white)
            } // [じゃんけんをする！]ボタン ここまで
                        
        } // VStack ここまで

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
