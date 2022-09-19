//
//  QueryTag.swift
//  final ass
//
//  Created by Duc, Nguyen Trung on 19/09/2022.
//

import SwiftUI

enum Query: String, CaseIterable {
    case pop, jazz, hiphop, rap
}

struct QueryTag: View {
    var query: Query
    var isSelected: Bool
    
    var body: some View {
        //MARK: query tag
        Text(query.rawValue).font(.caption)
            .bold().foregroundColor(isSelected ? .black : .gray)
            .padding(10).background(.thinMaterial)
            .cornerRadius(10)
    }
}

struct QueryTag_Previews: PreviewProvider {
    static var previews: some View {
        QueryTag(query: .jazz, isSelected: true)
    }
}
