//
//  CountryView.swift
//  SwiftUICoreDataTest
//
//  Created by Frank on 4/8/21.
//

import SwiftUI

struct CountryView: View {

    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Candy.entity(), sortDescriptors: []) var candies: FetchedResults<Candy>

    var country: Country?

    var body: some View {
        VStack {
            List {
                ForEach(candies, id: \.self) { candy in
                    Text("\(candy.name!)")
                }
            }
            Button("Add Candy") {
                let candy = Candy(context: self.viewContext)
                candy.name = "Test Candy"
                candy.origin = country
                candy.origin?.addToCandy(candy)
                try? self.viewContext.save()
            }

        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle(Text("\((country?.fullName)!)"))

    }
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        CountryView()
    }
}
