//
//  ContentView.swift
//  First iPhone App
//
//  Created by Simon K Moyana on 07/08/2021.
//

import SwiftUI
import MapKit

struct MainView: View {
    var body: some View {
        LoginScreen()
    }
}

struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier( HiddenNavigationBar() )
    }
}

struct tempView: View{
    var body: some View{
        ScrollView{
            VStack{
                
            }
        }
    }
}

struct FirstView: View {
    let items = ["Simon", "Moyana", "TheBest"]
    var body: some View{
        NavigationView {
            List(items, id: \.self) {
                Text($0)
            }.navigationBarTitle(Text("Simon's List"))
        }
    }
}

struct ScrolledView: View{
    var body: some View{
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<10) {
                    Text("Item \($0)")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .frame(width: 200, height: 200)
                        .background(Color.red)
                
                }
            }
        }.hiddenNavigationBarStyle()
    }
}

struct SocialFeed: View{
    
    @State private var imageName: String = ""
    var body: some View{
        ScrollView{
            VStack(spacing: 20){
                ForEach(0..<9) {
                    Image("Selfie\($0)").resizable().frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(13)
                }
            }
        }.hiddenNavigationBarStyle()
    }
}

struct SocialFeedTwo: View{
    
    @State private var imageName: String = ""
    var body: some View{
        ScrollView{
            VStack(spacing: 20){
                ForEach(0..<9) {
                    NavigationLink(
                        destination: SelfieMain(selfie: Image("Selfie\($0)").resizable(), socialText: Text("Simon \($0)")),
                        label: {
                            Text("Simon").foregroundColor(.white).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/ .bold()).position(x: 100, y: 180)
                        }).background(Image("Selfie\($0)").resizable().frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)).frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
            }
        }.hiddenNavigationBarStyle()
    }
}

struct SelfieMain: View{
    var selfie: Image
    var socialText: Text
    var body: some View{
        ScrollView{
            VStack(spacing: 20){
                //Image("Selfie0").resizable().frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                selfie.resizable().frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                socialText.font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/ .bold())
            }
        }
    }
}

struct CurrentView: View{
    var body: some View{
        ScrollView{
            HStack(spacing: 20){
                ForEach(0..<9) {
                    Image("Image\($0)").resizable().frame(width: 200, height: 200, alignment: .center)
                }
            }
        }
    }
}

struct TabbedView: View{
    var body: some View{
        TabView{
            FirstView()
                .tabItem { Label("Menu", systemImage: "list.dash") }
            SocialFeedTwo()
                .tabItem { Label("Social", systemImage: "square.and.pencil") }
            MapView().tabItem { Label("Map", systemImage: "map" )}
        }
    }
}

struct MapView: View{
    var body: some View{
        AppleParkMap()
    }
}


struct LoginScreen: View{
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    @State private var incorrect: String = ""
    
    var body: some View{
        NavigationView{
            VStack{
                Text("Simon's Locations").fontWeight(.bold).padding(.bottom, 50.0).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                TextField("Username", text: $username).frame(width: 200, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1).cornerRadius(3.0)
                
                SecureField("Password", text: $password).frame(width: 200, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/).cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/).padding()
                
                if(username == "Simon"){
                NavigationLink(
                    destination:
                        TabbedView(),
                    label: {
                        Text("Login").foregroundColor(.white)
                    }).padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).frame(width: 200.0).background(Color .blue).cornerRadius(13)
                    .navigationTitle("Logout")
                    .navigationBarTitleDisplayMode(.inline)
                }
                                
                else{
                    Button("Login"){incorrect = "Incorrect Password!"}.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).foregroundColor(.white).frame(width: 200.0).background(Color .blue).cornerRadius(13)
                }
                
                Text(incorrect).foregroundColor(.red)
            }.hiddenNavigationBarStyle()
        }
    }
}

struct AppleParkMap: View {
     
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.334_900,
                                       longitude: -122.009_020),
        latitudinalMeters: 750,
        longitudinalMeters: 750
    )
    
    @State private var current = MKCoordinateRegion()
    
    var body: some View {
        VStack{
        Map(coordinateRegion: $region).hiddenNavigationBarStyle()
        }
        
    }
}

struct NewView {
    var body: some View{
        ScrollView{
            VStack{
                Image("Selfie7").resizable().frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct DescriptionText{
    let descriptions = ["Simon Moyana"]
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        tempView()
        CurrentView()
        MainView()
        FirstView()
        ScrolledView()
        TabbedView()
        SocialFeedTwo()
        LoginScreen()
        MapView()
        AppleParkMap()
        //SocialFeed()
        //SocialFeedTwo()
        //SelfieMain(selfie: Image("Selfie1").resizable(), socialText: Text("Simon"))
    }
}
