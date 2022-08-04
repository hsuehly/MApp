//
//  ContentView.swift
//  MApp
//
//  Created by xueliuyang on 2022/7/29.
//

import SwiftUI


struct ContentView: View {
    @Environment(\.colorScheme) var mode
    @State private var Count = 0
    @State private var isActive = false
    @State private var TapNum = 0
    @State private var STapNum = 0
    @State private var SisActive = false


    var body: some View {
        NavigationView {
        
   

            ZStack {
              
           
                FirstView(Count: $Count,TapNum: $TapNum)
                    .onChange(of: TapNum) { newValue in
                        if newValue == 5 {
                            print("tiaozhuan")
                            isActive = true
                            TapNum = 0
                        }
                    }
                NavigationLink( destination: SecondView(STapNum: $STapNum,SisActive: $SisActive).onTapGesture {
                    STapNum += 1
                }
                    .onChange(of: STapNum, perform: { newVale in
                        if newVale == 2 {
                            SisActive = true
                            print("跳转",SisActive)
                         
                            STapNum = 0
                        }
                    }),isActive: $isActive){

                }
//                NavigationLink(destination: ThirdView(), isActive:$SisActive ) {
//
//                }

            }
            .ignoresSafeArea(.all)

            .navigationBarHidden(true)
        
   

    }
}
}

struct DetailView: View {
    @Binding var active: Bool
    var body: some View {
        VStack(spacing: 20) {
            Text("详细页面")
                .font(.title2)
            Button(action: {
                self.active = false
            }, label: {
                Text("关闭画面")
                    .font(.title2)
            })
        }
        .navigationBarTitle("详细")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.active = false
        }, label: {
            Text("返回")
        }))
    }
}
//struct ContentView: View {
//    @State private var activeLink: Bool = false
//
//    var body: some View {
//        NavigationView {
//            VStack(alignment: .center, spacing: 10) {
//                Text("Hello, World!")
//                NavigationLink("第二个画面", destination: DetailView(active: self.$activeLink),
//                    isActive: self.$activeLink)
//                NavigationLink(
//                    destination: DetailView(active: self.$activeLink),
//                    isActive: self.$activeLink,
//                    label: {
//                        Button(action: {
//                            self.activeLink = true
//                        }, label: {
//                            Text("编程导航").foregroundColor(Color.purple)
//                        })
//                    })
//            }
//            .padding()
//            .navigationBarTitle("主画面", displayMode: .inline)
//            .navigationBarHidden(true)
//        }
//    }
//}


extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
