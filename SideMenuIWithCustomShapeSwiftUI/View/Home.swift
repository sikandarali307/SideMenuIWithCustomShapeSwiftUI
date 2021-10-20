//
//  Home.swift
//  SideMenuIWithCustomShapeSwiftUI
//
//  Created by Sikandar Ali on 20/10/2021.
//

import SwiftUI

struct Home: View {
    @State var showMenu:Bool = false
    
    @State var animatePath:Bool = false
    @State var animateBG:Bool = false
    
    
    var body: some View {
        ZStack{
            VStack(spacing:15){
                //navigation bar
                HStack(){
                    Button{
                        withAnimation {
                            animateBG.toggle()
                            
                        }
                        withAnimation(.spring()) {
                            showMenu.toggle()
                        }
                        //animating with little delay
                        withAnimation(.interactiveSpring(response: 0.4, dampingFraction: 0.3, blendDuration: 0.3).delay(0.2)){
                            animatePath.toggle()
                        }
                        
                    }label: {
                        Image("menu").resizable()
                            .renderingMode(.template)
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .shadow(radius: 1)
                      }
                    Spacer()
                    Button{
                        
                    }label: {
                        Image("Add").resizable()
                            .renderingMode(.template)
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .shadow(radius: 1)
                      }
                }
                .overlay(
                    Text("Stories").font(.title2.bold())
                ).foregroundColor(Color.white.opacity(0.8))
                    .padding([.horizontal,.top])
                    .padding(.bottom,5)
                
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing:25){
                        //sample card
                        
                        ForEach(stories){ story in
                            //card view
                            cardView(story: story)
                        }
                    }.padding()
                        .padding(.top,20)
                }
                
                
                
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    LinearGradient(colors: [Color("BG1"),Color("BG2")], startPoint: .top, endPoint: .bottom ).ignoresSafeArea()
                )
            Color.black
                .opacity(animateBG ? 0.25:0)
                .ignoresSafeArea()
            MenuView(showMenu: $showMenu,animatePath: $animatePath,animateBG: $animateBG)
                .offset(x:showMenu ? 0 : -getReact().width)
        }
    }
    @ViewBuilder
    func cardView(story:Story)->some View{
        VStack(alignment: .leading, spacing: 12) {
            // to get in screen width
            GeometryReader{
                proxy in
                let size =  proxy.size
                Image(story.image).resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    .cornerRadius(15)
            }.frame(height:200)
            Text(story.title)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(Color.white.opacity(0.8))
            Button{
                
            }label: {
                Text("Read Now")
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.vertical , 6)
                    .padding(.horizontal)
                    .background(
                        Capsule().fill(Color("Red"))
                    )
            }
        }
    }
}

//menu view


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct MenuView: View {
    @Binding var showMenu : Bool
    @Binding var animatePath : Bool
    @Binding var animateBG : Bool
    var body: some View {
        ZStack{
          // blur view
            BlurView(style: .systemThinMaterialDark)
            
            //blending with safearea
            Color("BG2")
                .opacity(0.7)
                .blur(radius: 15)
            //content
            VStack(alignment: .leading, spacing: 25) {
                Button{
                    // closing menu
                    //animating with little delay
                    withAnimation(.interactiveSpring(response: 0.4, dampingFraction: 0.3, blendDuration: 0.3)){
                        animatePath.toggle()
                    }
                    
                    withAnimation {
                        animateBG.toggle()
                        
                    }
                    withAnimation(.spring().delay(0.1)) {
                        showMenu.toggle()
                    }
                   
                    
                }label: {
                    Image(systemName: "xmark.circle")
                        .font(.title)
                        
                }.foregroundColor(.white.opacity(0.8))
                
                // menu Button .......
                
                MenuButton(title: "Preimum", image: "square.grid.2x2", offset: 10)
                    .padding(.top,40)
                MenuButton(title: "Upload Content", image: "square.and.arrow.up.on.square", offset: 10)
                MenuButton(title: "My Account", image: "Pro", offset: 10)
                MenuButton(title: "MakeMoney", image: "dollarsign.circle", offset: 10)
                MenuButton(title: "Help", image: "questionmark.circle", offset: 10)
                
                Spacer(minLength: 10)
                MenuButton(title: "LOGOUT", image: "rectangle.portrait.and.arrow.right", offset: 0)
                
            }.padding(.trailing ,125)
                .padding()
                .padding(.top,getSafeArea().top)
                .padding(.bottom,getSafeArea().bottom)
                .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
//
        } //custom shape
        .clipShape(MenuShape(value: animatePath ? 150 : 0 ))
        .background(
            MenuShape(value: animatePath ? 150 : 0).stroke(
                .linearGradient(.init(colors: [Color("Blue"),
                                               Color("Blue").opacity(0.7),
                                               Color("Blue").opacity(0.5),
                                               Color.clear]), startPoint: .top, endPoint: .bottom),lineWidth: animatePath ? 8 : 0
            ).padding(.leading,-50)
                )
        .ignoresSafeArea()
        
        
    }
     @ViewBuilder
    func  MenuButton (title :String,image:String,offset:CGFloat)->some View{
        Button
        {
        }label: {
            
            HStack(spacing:12){
                
            if image == "Pro"{
                //asset image
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50 , height: 50)
                    .clipShape(Circle())
            }else{
                //sf imagse
                Image(systemName: image)
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(width: 25, height: 25)
                    .foregroundColor(.white.opacity(0.7))
            }
                
                Text(title)
                    .font(.system(size: 17))
                    .fontWeight( title == "LOGOUT" ? .semibold:.medium)
                    .kerning(title == "LOGOUT" ?1.2 :0.8 )
                    .foregroundColor(.white.opacity(title == "LOGOUT" ?0.9 :0.65))
        }
            .padding(.vertical)
        }
        .offset(x:offset)
    }
}


struct MenuShape :Shape{
    var value :CGFloat
    var animatableData : CGFloat{
        get{return value}
        set{
            value = newValue
        }
    }
    
    func path(in rect: CGRect) -> Path {
        
        return Path{
            path in
            //for curve shape
            let width = rect.width - 100
            let height = rect.height
            path.move(to: CGPoint(x: width, y: height))
            path.addLine(to: CGPoint(x: 0, y: height))
            path.addLine(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: width, y: 0))
            
            //curve code
            
            path.move(to: CGPoint(x: width, y: 0))
            
            path.addCurve(to: CGPoint(x: width, y: height + 100), control1: CGPoint(x: width + value, y: height / 3), control2: CGPoint(x: width - value, y: height / 2))
           
        }
    }
}



extension View{
    func getSafeArea()->UIEdgeInsets{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return .zero
        }
        guard let safeArea = screen.windows.first?.safeAreaInsets
        else{
            return .zero
        }
        return safeArea
    }
    
    func getReact ()->CGRect{
        return UIScreen.main.bounds
    }
}

  
