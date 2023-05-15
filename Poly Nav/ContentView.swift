//
//  ContentView.swift
//  Poly Nav
//
//  Created by Михаил on 16.04.2023.
//

import SVGView
import SwiftUI

struct BuildingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 40, height: 40, alignment: .center)
            .background(.ultraThickMaterial)
            .foregroundColor(.white)
            .cornerRadius(6)
    }
}

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel

    @State private var selectedBuilding: Building?
    @State private var isGenPlan: Bool = false
    @State private var selectedTab = "Корпуса"

    @State private var searchText: String = ""

    var body: some View {
<<<<<<< HEAD
       
        TabView(selection: $selectedTab){
            List{
                ForEach(viewModel.buildings){ building in
                    HStack{
                        Text("\(building.address)").onTapGesture {
                            selectedBuilding = building
                            selectedTab = "Routes"
                            isGenPlan = false
                        }
                        
                        
                        
                        
                        Text("Общ. план").onTapGesture {
                            print("plan")
                            selectedBuilding = building
                            selectedTab = "Routes"
=======
        TabView(selection: $selectedTab) {
            VStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search", text: $searchText)
                        .textFieldStyle(.plain)
                }
                .padding(.horizontal, 10)
                .frame(height: 48)
                .background(Color.black)
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.gray, lineWidth: 0.5)
                })
                .padding(.bottom, 25)

                List {
                    ForEach(viewModel.buildings) { building in
                        Text("\(building.address) (\(building.abbreviation))").onTapGesture {
                            print(building)
                            selectedBuilding = building
                            selectedTab = "Routes"
                            print(building)
>>>>>>> 69b359e9a63f7ae2e0fc00a858b52a487eed2df5
                        }
                    }
                }
                .listStyle(.insetGrouped)
            }
            .tabItem {
                Image(systemName: "rectangle.grid.2x2.fill")
                Text("Корпуса")
            }
            .tag("Buildings")

<<<<<<< HEAD

            MapView(building: selectedBuilding, isGenPlan: $isGenPlan)
            .tabItem {
=======
            MapView(building: selectedBuilding)
                .tabItem {
>>>>>>> 69b359e9a63f7ae2e0fc00a858b52a487eed2df5
                    Image(systemName: "map")
                    Text("Маршруты")
                }
                .tag("Routes")

            Text("О Нас")
                .tabItem {
                    Image(systemName: "info.circle.fill")
                    Text("О Нас")
                }
        }
        .onAppear {
            viewModel.loadBuildings()
            selectedBuilding = viewModel.buildings.first!
        }
    }
}

// struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
////        ContentView()
//    }
// }
