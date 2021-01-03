//
//  NotificationBadge.swift
//  ShopProject
//
//  Created by Adam Rais on 2020-12-26.
//

import SwiftUI

struct NotificationBadge: View {
    @Binding var number: Int
    
    var body: some View {
        ZStack {
            Capsule().fill(Color.red).frame(width: 13.33 * CGFloat(numOfDigits()), height: 20, alignment: .topTrailing)
                .position(.zero)
        
            Text("\(number)").foregroundColor(Color.white)
                .font(Font.system(size: 15))
                .position(.zero)
        }
    }
    
    func numOfDigits() -> Float {
        let numOfDigits = Float(String(number).count)
        
        return numOfDigits == 1 ? 1.5 : numOfDigits
    }
}

struct NotificationBadge_Previews: PreviewProvider {
    static var previews: some View {
        NotificationBadge(number: .constant(2))
    }
}
