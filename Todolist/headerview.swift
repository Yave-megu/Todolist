//
//  headerview.swift
//  Todolist
//
//  Created by κΉλν on 2022/09/29.
//

import Foundation
import SwiftUI

struct HeaderView: View{
    var body:some View{
        Text("What to do Today?")
                 .font(.title.bold())
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
