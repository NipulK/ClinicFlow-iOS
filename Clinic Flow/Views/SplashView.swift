import SwiftUI

struct SplashView: View {
    
    @State private var showLogin = false
    
    var body: some View {
        ZStack {
            
            if !showLogin {
                VStack {
                    Image("AppLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                }
                .transition(.move(edge: .leading))
            }
            
            if showLogin {
                LoginView()
                    .transition(.move(edge: .trailing))
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                    showLogin = true
                }
            }
        }
    }
}
