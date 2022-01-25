//
//  ContentView.swift
//  SwiftUI Tutorial: Working with TabView
//
//  Created by Alvin Sosangyo on 01/24/22.
//


import SwiftUI

struct ContentView: View {
    
    @State private var selection = 0
    
    var body: some View {
        
        TabView(selection: $selection) {
            
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            
            Text("Search view")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .tag(1)

            PhotosView()
                .tabItem {
                    Image(systemName: "photo.fill")
                    Text("Photos")
                }
                .tag(2)

            Text("Message view")
                .tabItem {
                    Image(systemName: "envelope.fill")
                    Text("Messages")
                }
                .tag(3)

            ProfileView(selection: {
                selection = (selection + 4) % 5
            })
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                    Text("Profile")
                }
                .tag(4)
            
        } //TabView
        .accentColor(.black) //Active tab color
        
    } //body
    
    init() {
        //Set tab bar appearance
        UITabBar.appearance().barTintColor = UIColor.systemBlue //Tab bar color
        UITabBar.appearance().unselectedItemTintColor = UIColor.white //Tab item color when not selected
        UITabBar.appearance().isOpaque = false
    }
    
} //ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HomeView: View {
    
    var body: some View {
        
        List(1...50, id: \.self) {
            Text("Content \($0)")
        }
        
    } //body
    
} //HomeView

struct PhotosView: View {
    
    private var imageList = [
        "hare.fill",
        "tortoise.fill",
        "pawprint.fill",
        "ant.fill",
        "ladybug.fill"
    ]
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            ForEach(imageList, id: \.self) { index in
                Image(systemName: "\(index)")
                    .font(.system(size: 150))
                    .padding()
            }
        }
        
    } //body
    
} //PhotosView

struct ProfileView: View {
    
    var selection: () -> Void
    
    var body: some View {
        
        VStack {
            
            Image(systemName: "person.crop.circle")
                .font(.system(size: 100))
                .padding()
            
            Button(action: selection) {
                Image(systemName: "envelope.fill")
                    .font(.system(size: 50))
            }
            .padding()
            
        } //ZStack
        
    } //body
    
} //ProfileView
