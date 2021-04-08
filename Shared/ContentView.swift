//
//  ContentView.swift
//  Shared
//
//  Created by Frank on 4/7/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(entity: Country.entity(), sortDescriptors: []) var countries: FetchedResults<Country>

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(countries, id: \.self) { country in
                        NavigationLink(
                            destination: CountryView(country: country),
                            label: {
                                Text("\(country.fullName!)")
                            })
                    }
                }

                Button("Add Country") {
                    let country = Country(context: self.viewContext)
                    country.fullName = "TestName"
                    try? self.viewContext.save()
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle(Text("Test"))
        }

    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
