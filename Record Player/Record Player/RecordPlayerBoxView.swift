//
//  RecordPlayerBoxView.swift
//  Record Player
//
//  Created by Christopher Bartling on 2/5/21.
//

import SwiftUI

struct RecordPlayerBoxView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 345, height: 345)
                .cornerRadius(10)
                .foregroundColor(.black)

            Image("woodGrain")
                .resizable()
                .frame(width: 325, height: 325)
                .shadow(color: .white, radius: 3, x: 0, y: 0)
        }
    }
}

struct RecordPlayerBoxView_Previews: PreviewProvider {
    static var previews: some View {
        RecordPlayerBoxView()
    }
}
