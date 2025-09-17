//
//  ContentView.swift
//  Stroll
//
//  Created by Hastomi Riduan Munthe on 16/09/25.
//

import SwiftUI

// MARK: - Main View
struct StrollHomeView: View {
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                Color.black.edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    HeaderView()
                    
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 24) {
                            YourTurnSection()
                            ChatsSection()
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 16)
                        .padding(.bottom, 90)
                    }
                }
                
                Rectangle()
                    .fill(
                        LinearGradient(
                            colors: [Color.black.opacity(1), Color.black.opacity(0)],
                            startPoint: .bottom,
                            endPoint: .top
                        )
                    )
                    .frame(maxWidth: .infinity)
                    .frame(height: 30)
                    .padding(.bottom, 50)
                    
                CustomTabBar()
            }
            .navigationBarHidden(true)
        }
    }
}

// MARK: - Header
struct HeaderView: View {
    var body: some View {
        HStack {
            // Bagian kiri
            VStack(alignment: .leading, spacing: 6) {
                HStack(spacing: 10) {
                    Text("Your Turn")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(Color(hex: "#F5F5F5"))
                    
                    Text("7")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(.black)
                        .frame(width: 16, height: 16)
                        .background(
                            Circle()
                                .fill(Color(hex: "#0E0E0E"))
                        )
                }
                
                Text("Make your move, they are waiting 🎵")
                    .italic()
                    .font(.system(size: 12))
                    .foregroundColor(Color(hex: "#A8AFB7"))
            }
            
            Spacer()
            
            VStack(spacing: -2) {
                ZStack {
                    Circle()
                        .stroke(Color.gray.opacity(0.4), lineWidth: 4)
                        .frame(width: 44.37, height: 44.37)

                    Circle()
                        .trim(from: 0, to: 80 / 100)
                        .stroke(
                            AngularGradient(
                                gradient: Gradient(stops: [
                                    .init(color: Color(hex: "#4C8D25"), location: 0.0),
                                    .init(color: Color(hex: "#36631A").opacity(0.2), location: 0.0),
                                    .init(color: Color(hex: "#36631A"), location: 1.0)
                                ]),
                                center: .center
                            ),
                            style: StrokeStyle(lineWidth: 4, lineCap: .round)
                        )
                        .rotationEffect(.degrees(70))
                        .frame(width: 44.7, height: 44.7)

                    Image("img-koh")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 35.63, height: 35.63)
                        .clipShape(Circle())
                    
                    Rectangle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(stops: [
                                    .init(color: Color(hex: "#B5B2FF").opacity(0), location: 0.0),
                                    .init(color: Color(hex: "#B5B2FF"), location: 0.2),
                                    .init(color: Color(hex: "#B5B2FF"), location: 0.8),
                                    .init(color: Color(hex: "#B5B2FF").opacity(0), location: 1.0)
                                ]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: 8, height: 2)
                        .offset(x: 21)
                }
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                
                Text("90")
                    .foregroundColor(Color(hex: "#E5E5E5"))
                    .font(.system(size: 10.8, weight: .bold))
                    .frame(width: 42, height: 18.4)
                    .background(
                        RoundedRectangle(cornerRadius: 18)
                            .fill(Color(hex: "#12161F"))
                    )
                    .padding(.top, -10)
            }
        }
        .padding(.horizontal, 17)
    }
}

struct YourTurnSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    YourTurnCard(name: "Amanda, 22",
                                 question: "What is your most favorite childhood memory?",
                                 image: "img-amanda")
                    
                    YourTurnCard(name: "Malte, 31",
                                 question: "What is the most important quality in friendships to you?",
                                 badgeText: "📣 They made a move!",
                                 image: "img-malte")
                    
                    YourTurnCard(name: "Binghan, 28",
                                 question: "If you could choose to have one superpower, what would it be?",
                                 isBell: true,
                                 image: "img-binghan",
                                 isHidden: false)
                }
            }
            .background(Color.black.opacity(1))
        }
    }
}

struct YourTurnCard: View {
    var name: String
    var question: String
    var badgeText: String? = nil
    var isBell: Bool? = false
    var image: String
    var isHidden: Bool = true
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.clear)
                .frame(width: 145, height: 205)
                .background(
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 145, height: 205)
                        .blur(radius: isHidden ? 30 : 0)
                        .clipped()
                        .cornerRadius(20)
                )
            
            VStack {
                GeometryReader { geometry in
                    Spacer()
                    VStack(alignment: .leading, spacing: 8) {
                        Spacer()
                            .frame(height: geometry.size.height * 0.25)
                        Text("Tap to answer")
                            .foregroundColor(Color(hex: "#A8AFB7"))
                            .font(.system(size: 10, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .center)
                        Spacer()
                        
                        Text(name)
                            .foregroundColor(Color(hex: "#FFFFFF"))
                            .font(.system(size: 15, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text(question)
                            .foregroundColor(Color(hex: "#CFCFFEB2"))
                            .font(.system(size: 10, weight: .regular))
                            .lineLimit(3)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
            }
            .padding(12)
            
            if let badgeText = badgeText {
                Text(badgeText)
                    .font(.system(size: 9, weight: .bold))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Color.black.opacity(0.7))
                    .foregroundColor(Color(hex: "#E5E5E5"))
                    .cornerRadius(12)
                    .padding(8)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            
            if let isBell = isBell, isBell {
                Text("📣")
                    .font(.system(size: 10))
                    .frame(width: 24, height: 24)
                    .background(Color.black.opacity(0.7))
                    .foregroundColor(Color(hex: "#E5E5E5"))
                    .cornerRadius(12)
                    .padding(8)
            }
        }
    }
}

// MARK: - Chats Section
struct ChatsSection: View {
    var chats: [ChatItem] = [
        ChatItem(name: "Jessica", message: "Voice message", time: "6:21 pm", type: .voice, unreadCount: 0, unread: false, status: nil, isNew: true, image: "img-jessica", favourite: true),
        ChatItem(name: "Amanda", message: "Lol I love house music too", time: "6:21 pm", type: .text, unreadCount: 0, unread: true, status: "Your move", isNew: false, image: "img-amanda", favourite: false),
        ChatItem(name: "Sila", message: "You: I love the people there tbh, have you been?", time: "Wed", type: .text, unreadCount: 0, unread: false, status: nil, isNew: false, image: "img-sila", favourite: false),
        ChatItem(name: "Marie", message: "Hahaha that's interesting, it does seem like people here are startin...", time: "6:21 pm", type: .text, unreadCount: 4, unread: true, status: "Your move", isNew: false, image: "img-marie", favourite: false),
        ChatItem(name: "Jessica", message: "Hahaha that's interesting, it does seem like people here are startin...", time: "6:21 pm", type: .text, unreadCount: 4, unread: true, status: "Your move", isNew: false, image: "img-sila", favourite: false)
        
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 15) {
                Text("Chats")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(Color(hex: "#F5F5F5"))
                Text("Pending")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(Color(hex: "#5F5F60"))
            }
            
            Rectangle()
                .fill()
                .foregroundColor(Color(hex: "#FFFFFF"))
                .frame(width: 53, height: 1)
                .offset(x: 0, y: -4)
            
            Text("The ice is broken. Time to hit it off")
                .font(.system(size: 12))
                .italic()
                .foregroundColor(Color(hex: "#A8AFB7"))
                .padding(.bottom, 8)
            
            VStack(spacing: 10) {
                ForEach(chats) { chat in
                    ChatRow(chat: chat)
                }
            }
        }
    }
}

struct ChatRow: View {
    var chat: ChatItem
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                Image(chat.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 62, height: 52)
                    .clipShape(Circle())
                    .foregroundColor(.white.opacity(0.7))
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 10) {
                        Text(chat.name)
                            .foregroundColor(Color(hex: "#F5F5F5"))
                            .font(.system(size: 16, weight: .bold))
                        
                        if chat.isNew {
                            HStack(spacing: 6) {
                                Circle()
                                    .fill(Color(hex: "#F5F5F5"))
                                    .frame(width: 5, height: 8)
                                
                                Text("New Chat")
                                    .font(.system(size: 10, weight: .bold))
                                    .foregroundColor(Color(hex: "#F5F5F5"))
                            }
                            .padding(.vertical, 2)
                            .padding(.horizontal, 8)
                            .background(Color(hex: "#8669A8"))
                            .cornerRadius(8)
                        }
                        
                        if let status = chat.status {
                            Text(status)
                                .font(.system(size: 10, weight: .semibold))
                                .padding(.vertical, 2)
                                .padding(.horizontal,8)
                                .background(Color(hex: "#282828CC").opacity(0.2))
                                .foregroundColor(Color(hex: "#F5F5F5"))
                                .cornerRadius(8)
                        }
                    }
                    
                    if chat.type == .voice {
                        HStack(spacing: 12.5) {
                            Image("icon-mic")
                                .resizable()
                                .frame(width: 10.5, height: 17.5)
                                .foregroundColor(Color(hex: "#8669A8"))
                            Image("icon-sound")
                                .resizable()
                                .frame(width: 22.5, height: 11.25)
                                .foregroundColor(Color(hex: "#8669A8"))
                            Text("00:58")
                                .foregroundColor(Color(hex: "#8669A8"))
                                .font(.system(size: 14, weight: .bold))
                        }
                    } else {
                        Text(chat.message)
                            .foregroundColor(chat.unread
                                             ? Color(hex: "#E5E5E5")
                                             : Color(hex: "#818181"))
                            .font(.system(size: 14, weight: .semibold))
                            .lineLimit(2)
                    }
                }
                
                Spacer()
                
                HStack(alignment: .top) {
                    VStack(alignment: .trailing, spacing: 5) {
                        Text(chat.time)
                            .foregroundColor(chat.time.contains { $0.isNumber }
                                             ? Color(hex: "#555390")
                                             : Color(hex: "#A8AFB7"))
                            .font(.system(size: 12))
                        
                        if chat.unreadCount > 0 {
                            Text("\(chat.unreadCount)")
                                .font(.system(size: 10, weight: .bold))
                                .padding(.horizontal, 5)
                                .padding(.vertical, 2)
                                .background(Color(hex: "#B5B2FF"))
                                .cornerRadius(7)
                                .foregroundColor(Color(hex: "#000000"))
                        }
                        
                        if chat.favourite {
                            Text("★")
                                .font(.system(size: 8, weight: .regular))
                                .padding(.horizontal, 5)
                                .padding(.vertical, 2)
                                .background(Color(hex: "#B5B2FF"))
                                .cornerRadius(8)
                                .foregroundColor(Color(hex: "#000000"))
                        }
                    }
                }
            }

            Rectangle()
                .fill(Color.white.opacity(0.5))
                .frame(height: 0.5)
                .frame(maxWidth: .infinity)
                .padding(.leading, 77)
        }
    }
}

// MARK: - Model
struct ChatItem: Identifiable {
    let id = UUID()
    let name: String
    let message: String
    let time: String
    let type: ChatType
    let unreadCount: Int
    let unread: Bool
    let status: String?
    let isNew: Bool
    let image: String
    let favourite: Bool
}

enum ChatType {
    case text
    case voice
}

// MARK: - Custom Tab Bar
struct CustomTabBar: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                TabBarItem(icon: "navbar-poker", label: "Cards", hasNotif: true)
                Spacer()
                TabBarItem(icon: "navbar-fire", label: "Bonfire")
                Spacer()
                TabBarItem(icon: "navbar-message", label: "Matches", isActive: true)
                Spacer()
                TabBarItem(icon: "navbar-profile", label: "Profile")
                Spacer()
            }
            .padding(.top, 10)
            .padding(.bottom, 3)
            .background(Color.black)
        }
    }
}

struct TabBarItem: View {
    let icon: String
    let label: String
    var isActive: Bool = false
    var hasNotif: Bool = false
    
    var body: some View {
        HStack {
            VStack(spacing: 4) {
                ZStack(alignment: .topTrailing) {
                    Image(icon)
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 25.7, height: 23.83)
                    
                    if hasNotif {
                        Text("10")
                            .font(.system(size: 7, weight: .bold))
                            .foregroundColor(Color(hex: "#111315"))
                            .padding(.horizontal, 4)
                            .padding(.vertical, 2)
                            .background(Color(hex: "#B5B2FF"))
                            .clipShape(Circle())
                            .overlay(
                                Rectangle()
                                    .stroke(Color.black, lineWidth: 1)
                            )
                            .cornerRadius(1)
                            .offset(x: 4, y: -2)
                        
                    }
                }
                
                Text(label)
                    .font(.system(size: 10, weight: .semibold))
                    .foregroundColor(isActive ? Color(hex: "#B5B2FF") : Color(hex: "#5F5F60"))
            }
        }
        .padding(.horizontal, 25)
        .padding(.vertical, 1)
    }
}

// MARK: - Preview
struct StrollHomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StrollHomeView()
                .previewDevice("iPhone 14 Pro")
            StrollHomeView()
                .previewDevice("iPhone 12")
        }
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        
        let r, g, b: Double
        switch hex.count {
        case 6:
            r = Double((int >> 16) & 0xFF) / 255
            g = Double((int >> 8) & 0xFF) / 255
            b = Double(int & 0xFF) / 255
        default:
            r = 1
            g = 1
            b = 1
        }
        
        self.init(.sRGB, red: r, green: g, blue: b, opacity: 1)
    }
}


#Preview {
    StrollHomeView()
}
