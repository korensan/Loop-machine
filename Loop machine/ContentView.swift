//
//  ContentView.swift
//  Loop machine
//
//  Created by Koren Salav on 01/05/2022.
//

import SwiftUI
import AVFoundation
import AVKit

var isPlaying = false
var time = 0.0


let url1 = Bundle.main.url(forResource: "ALL TRACK", withExtension: "mp3")
let url2 = Bundle.main.url(forResource: "B VOC", withExtension: "mp3")
let url3 = Bundle.main.url(forResource: "DRUMS", withExtension: "mp3")
let url4 = Bundle.main.url(forResource: "HE HE VOC", withExtension: "mp3")
let url5 = Bundle.main.url(forResource: "HIGH VOC", withExtension: "mp3")
let url6 = Bundle.main.url(forResource: "JIBRISH", withExtension: "mp3")
let url7 = Bundle.main.url(forResource: "LEAD 1", withExtension: "mp3")
let url8 = Bundle.main.url(forResource: "tambourine", withExtension: "mp3")
let url9 = Bundle.main.url(forResource: "UUHO VOC", withExtension: "mp3")


struct ContentView: View {
    @State var time1 = 0.0
    @State var time2 = 0.0
    @State var time3 = 0.0
    @State var time4 = 0.0
    @State var time5 = 0.0
    @State var time6 = 0.0
    @State var time7 = 0.0
    @State var time8 = 0.0
    @State var time9 = 0.0
    
    @State var width1 : CGFloat = 0
    @State var width2 : CGFloat = 0
    @State var width3 : CGFloat = 0
    @State var width4 : CGFloat = 0
    @State var width5 : CGFloat = 0
    @State var width6 : CGFloat = 0
    @State var width7 : CGFloat = 0
    @State var width8 : CGFloat = 0
    @State var width9 : CGFloat = 0
    
    @State var player1: AVAudioPlayer!
    @State var player2: AVAudioPlayer!
    @State var player3: AVAudioPlayer!
    @State var player4: AVAudioPlayer!
    @State var player5: AVAudioPlayer!
    @State var player6: AVAudioPlayer!
    @State var player7: AVAudioPlayer!
    @State var player8: AVAudioPlayer!
    @State var player9: AVAudioPlayer!
    
    @State var isSoundOn1 = false
    @State var isSoundOn2 = false
    @State var isSoundOn3 = false
    @State var isSoundOn4 = false
    @State var isSoundOn5 = false
    @State var isSoundOn6 = false
    @State var isSoundOn7 = false
    @State var isSoundOn8 = false
    @State var isSoundOn9 = false
    @State var isLoop = false
    @State var temp = 0.0
    @State private var showingPopover = false

    
    
    
    var body: some View {
        ZStack{
            
            
        
            VStack{
                Button("info") {
                            showingPopover = true
                        }
                .position(x: 40, y: 760)
                        .popover(isPresented: $showingPopover) {
                            Text("A Moveo task \nCreated by Koren Salav on 01/05/2022 \nhttps://www.linkedin.com/in/koren-salav/ \nkorensalav@gmail.com")
                                .font(.headline)
                                .multilineTextAlignment(.center)
                                .padding()
                            Text("there's 9 rows, each row is a channel representing an audio loop.\nEach channel can be muted with a toggle button.\nA lower section controls the playback with two buttons you can play and stop,and a loop toogle which can be toggled on and off, as well as a cursor with timer to show the current playing position in real time.")
                                .multilineTextAlignment(.center)
                                .padding()
                                

                        }
                Text("Loop machine")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .position(x: 200, y: 20)
                ZStack{
                    VStack{
                        Rectangle().frame(width: 1, height: 400).offset(x: max(width1, width2, width3, width4, width5, width6, width7, width8, width9), y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/).position(x: 137, y: 290)
                        Text("00:\(String(Int(max(time1,time2,time3,time4,time5,time6,time7,time8,time9))))").offset(x: max(width1, width2, width3, width4, width5, width6, width7, width8, width9), y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/).position(x: 137, y: 485)
                    }
                }.zIndex(1)
                Group{
                    HStack{
                        Spacer()
                            .frame(width: 320)
                        Image(systemName: "speaker.2").padding().frame(width: nil).font(.title)
                    }
                    HStack{
                        Text("All Tracks")
                            .padding(.horizontal)
                            .frame(width: 150)
                        
                        
                        
                        ZStack(alignment: .leading){
                            Capsule().fill(Color.yellow.opacity(0.2)).frame(height: 8)
                            Capsule().fill(Color.yellow).frame(width: width1, height: 8)
                        }
                        .frame(width: 160)
                        
                        Toggle(isOn: $isSoundOn1) {
                        }.onChange(of: isSoundOn1) { Value in
                            if(isPlaying){
                                temp = max(time1,time2,time3,time4,time5,time6,time7,time8,time9)
                                stopSoundEx()
                                playSound()
                            }                        }
                        
                        .padding(.trailing)
                    }
                    
                    
                    HStack{
                        Text("B-Vocal")
                            .padding(.horizontal)
                            .frame(width: 150)
                        
                        ZStack(alignment: .leading){
                            Capsule().fill(Color.orange.opacity(0.2)).frame(height: 8)
                            Capsule().fill(Color.orange).frame(width: width2, height: 8)
                        }
                        .frame(width: 160)
                        Toggle(isOn: $isSoundOn2) {
                        }.onChange(of: isSoundOn2) { Value in
                            if(isPlaying){
                                temp = max(time1,time2,time3,time4,time5,time6,time7,time8,time9)
                                stopSoundEx()
                                playSound()
                            }                        }
                        .padding(.trailing)
                    }
                    HStack{
                        Text("Drums")
                            .padding(.horizontal)
                            .frame(width: 150)
                        ZStack(alignment: .leading){
                            Capsule().fill(Color.red.opacity(0.2)).frame(height: 8)
                            Capsule().fill(Color.red).frame(width: width3, height: 8)
                        }
                        .frame(width: 160)
                        Toggle(isOn: $isSoundOn3) {
                        }.onChange(of: isSoundOn3) { Value in
                            if(isPlaying){
                                temp = max(time1,time2,time3,time4,time5,time6,time7,time8,time9)
                                stopSoundEx()
                                playSound()
                            }                        }
                        .padding(.trailing)
                    }
                    HStack{
                        Text("He-He")
                            .padding(.horizontal)
                            .frame(width: 150)
                        ZStack(alignment: .leading){
                            Capsule().fill(Color.pink.opacity(0.2)).frame(height: 8)
                            Capsule().fill(Color.pink).frame(width: width4, height: 8)
                        }
                        .frame(width: 160)
                        Toggle(isOn: $isSoundOn4) {
                        }.onChange(of: isSoundOn4) { Value in
                            if(isPlaying){
                                temp = max(time1,time2,time3,time4,time5,time6,time7,time8,time9)
                                stopSoundEx()
                                playSound()
                            }                        }
                        .padding(.trailing)
                    }
                    HStack{
                        Text("High")
                            .padding(.horizontal)
                            .frame(width: 150)
                        ZStack(alignment: .leading){
                            Capsule().fill(Color.purple.opacity(0.2)).frame(height: 8)
                            Capsule().fill(Color.purple).frame(width: width5, height: 8)
                        }
                        .frame(width: 160)
                        Toggle(isOn: $isSoundOn5) {
                        }.onChange(of: isSoundOn5) { Value in
                            if(isPlaying){
                                temp = max(time1,time2,time3,time4,time5,time6,time7,time8,time9)
                                stopSoundEx()
                                playSound()
                            }                        }
                        .padding(.trailing)
                    }
                    HStack{
                        Text("Jibrish")
                            .padding(.horizontal)
                            .frame(width: 150)
                        ZStack(alignment: .leading){
                            Capsule().fill(Color.blue.opacity(0.2)).frame(height: 8)
                            Capsule().fill(Color.blue).frame(width: width6, height: 8)
                        }
                        .frame(width: 160)
                        Toggle(isOn: $isSoundOn6) {
                        }.onChange(of: isSoundOn6) { Value in
                            if(isPlaying){
                                temp = max(time1,time2,time3,time4,time5,time6,time7,time8,time9)
                                stopSoundEx()
                                playSound()
                            }                        }
                        .padding(.trailing)
                    }
                    HStack{
                        Text("Lead")
                            .padding(.horizontal)
                            .frame(width: 150)
                        ZStack(alignment: .leading){
                            Capsule().fill(Color.blue.opacity(0.1)).frame(height: 8)
                            Capsule().fill(Color.blue.opacity(0.7)).frame(width: width7, height: 8)
                        }
                        .frame(width: 160)
                        Toggle(isOn: $isSoundOn7) {
                        }.onChange(of: isSoundOn7) { Value in
                            if(isPlaying){
                                temp = max(time1,time2,time3,time4,time5,time6,time7,time8,time9)
                                stopSoundEx()
                                playSound()
                            }                        }
                        .padding(.trailing)
                    }
                    HStack{
                        Text("Tambourine")
                            .padding(.horizontal)
                            .frame(width: 150.0)
                        ZStack(alignment: .leading){
                            Capsule().fill(Color.gray.opacity(0.3)).frame(height: 8)
                            Capsule().fill(Color.gray).frame(width: width8, height: 8)
                        }
                        .frame(width: 160)
                        Toggle(isOn: $isSoundOn8) {
                        }.onChange(of: isSoundOn8) { Value in
                            if(isPlaying){
                                temp = max(time1,time2,time3,time4,time5,time6,time7,time8,time9)
                                stopSoundEx()
                                playSound()
                            }                        }
                        .padding(.trailing)
                    }
                    HStack{
                        Text("Uu-Ho")
                            .padding(.horizontal)
                            .frame(width: 150.0)
                        ZStack(alignment: .leading){
                            Capsule().fill(Color.black.opacity(0.19)).frame(height: 8)
                            Capsule().fill(Color.black).frame(width: width9, height: 8)
                        }
                        .frame(width: 160)
                        Toggle(isOn: $isSoundOn9) {
                        }.onChange(of: isSoundOn9) { Value in
                            if(isPlaying){
                                temp = max(time1,time2,time3,time4,time5,time6,time7,time8,time9)
                                stopSoundEx()
                                playSound()
                            }
                        }
                        .padding(.trailing)
                    }
                    
                }
                .position(x: 180, y: 0)
                
                Group{
                    Spacer()
                        .frame(height: 80)
                    HStack{
                        
                        Button("play") {
                            stopSound()
                            playSound()
                            
                        }
                        .frame(width: 100.0, height: 40.0)
                        .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.black/*@END_MENU_TOKEN@*/)
                        .accentColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.white, lineWidth: 2)
                        )
                        .cornerRadius(25)
                        
                        Spacer()
                            .frame(width: 40)
                        Button("stop") {
                            stopSound()
                        }
                        .frame(width: 100.0, height: 40.0)
                        .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.black/*@END_MENU_TOKEN@*/)
                        .accentColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.white, lineWidth: 2)
                        )
                        .cornerRadius(25)
                    }
                    Toggle(isOn: $isLoop) {
                        Text("Loop")
                        
                    }
                    .padding(.horizontal, 145.0)
                    
                }
                .position(x: 200, y: 0)
                
            }
            
            
        }.background(
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
    }
    
    
    func playSound() {
        
        
        isPlaying = true
        
        if(isSoundOn1 == true){
            do{
                player1 = try AVAudioPlayer(contentsOf: url1!)
                let shortStartDelay: TimeInterval = 0.01    // seconds
                let now: TimeInterval = player1?.deviceCurrentTime ?? 0
                let timeDelayPlay: TimeInterval = now + shortStartDelay
                player1?.currentTime = temp // Specific time to start play
                player1?.play(atTime: timeDelayPlay)
                Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (_) in
                    
                    if player1.isPlaying{
                        let screen = UIScreen.main.bounds.width - 220
                        
                        let value = player1.currentTime / player1.duration
                        
                        self.width1 = screen * CGFloat(value)
                        
                        time1 = player1.currentTime
                        
                        
                        
                    }
                }
            } catch{
                print("error")
            }
        }
        if(isSoundOn2 == true){
            do{
                player2 = try AVAudioPlayer(contentsOf: url2!)
                let shortStartDelay: TimeInterval = 0.01    // seconds
                let now: TimeInterval = player2?.deviceCurrentTime ?? 0
                let timeDelayPlay: TimeInterval = now + shortStartDelay
                player2?.currentTime = temp // Specific time to start play
                player2?.play(atTime: timeDelayPlay)
                Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (_) in
                    
                    if player2.isPlaying{
                        
                        let screen = UIScreen.main.bounds.width - 220
                        
                        let value = player2.currentTime / player2.duration
                        
                        self.width2 = screen * CGFloat(value)
                        time2 = player2.currentTime
                        
                    }
                }
            } catch{
                print("error")
            }
        }
        if(isSoundOn3 == true){
            do{
                player3 = try AVAudioPlayer(contentsOf: url3!)
                let shortStartDelay: TimeInterval = 0.01    // seconds
                let now: TimeInterval = player3?.deviceCurrentTime ?? 0
                let timeDelayPlay: TimeInterval = now + shortStartDelay
                player3?.currentTime = temp // Specific time to start play
                player3?.play(atTime: timeDelayPlay)
                Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (_) in
                    
                    if player3.isPlaying{
                        
                        let screen = UIScreen.main.bounds.width - 220
                        
                        let value = player3.currentTime / player3.duration
                        
                        self.width3 = screen * CGFloat(value)
                        time3 = player3.currentTime
                        
                    }
                }
            } catch{
                print("error")
            }
        }
        if(isSoundOn4 == true){
            do{
                player4 = try AVAudioPlayer(contentsOf: url4!)
                let shortStartDelay: TimeInterval = 0.01    // seconds
                let now: TimeInterval = player4?.deviceCurrentTime ?? 0
                let timeDelayPlay: TimeInterval = now + shortStartDelay
                player4?.currentTime = temp // Specific time to start play
                player4?.play(atTime: timeDelayPlay)
                Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (_) in
                    
                    if player4.isPlaying{
                        
                        let screen = UIScreen.main.bounds.width - 220
                        
                        let value = player4.currentTime / player4.duration
                        
                        self.width4 = screen * CGFloat(value)
                        time4 = player4.currentTime
                        
                    }
                }
            } catch{
                print("error")
            }
        }
        if(isSoundOn5 == true){
            do{
                player5 = try AVAudioPlayer(contentsOf: url5!)
                let shortStartDelay: TimeInterval = 0.01    // seconds
                let now: TimeInterval = player5?.deviceCurrentTime ?? 0
                let timeDelayPlay: TimeInterval = now + shortStartDelay
                player5?.currentTime = temp // Specific time to start play
                player5?.play(atTime: timeDelayPlay)
                Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (_) in
                    
                    if player5.isPlaying{
                        
                        let screen = UIScreen.main.bounds.width - 220
                        
                        let value = player5.currentTime / player5.duration
                        
                        self.width5 = screen * CGFloat(value)
                        time5 = player5.currentTime
                        
                    }
                }
            } catch{
                print("error")
            }
        }
        if(isSoundOn6 == true){
            do{
                player6 = try AVAudioPlayer(contentsOf: url6!)
                let shortStartDelay: TimeInterval = 0.01    // seconds
                let now: TimeInterval = player6?.deviceCurrentTime ?? 0
                let timeDelayPlay: TimeInterval = now + shortStartDelay
                player6?.currentTime = temp // Specific time to start play
                player6?.play(atTime: timeDelayPlay)
                Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (_) in
                    
                    if player6.isPlaying{
                        
                        let screen = UIScreen.main.bounds.width - 220
                        
                        let value = player6.currentTime / player6.duration
                        
                        self.width6 = screen * CGFloat(value)
                        time6 = player6.currentTime
                        
                    }
                }
            } catch{
                print("error")
            }
        }
        if(isSoundOn7 == true){
            do{
                player7 = try AVAudioPlayer(contentsOf: url7!)
                let shortStartDelay: TimeInterval = 0.01    // seconds
                let now: TimeInterval = player7?.deviceCurrentTime ?? 0
                let timeDelayPlay: TimeInterval = now + shortStartDelay
                player7?.currentTime = temp // Specific time to start play
                player7?.play(atTime: timeDelayPlay)
                Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (_) in
                    
                    if player7.isPlaying{
                        
                        let screen = UIScreen.main.bounds.width - 220
                        
                        let value = player7.currentTime / player7.duration
                        
                        self.width7 = screen * CGFloat(value)
                        time7 = player7.currentTime
                        
                    }
                }
            } catch{
                print("error")
            }
        }
        if(isSoundOn8 == true){
            do{
                player8 = try AVAudioPlayer(contentsOf: url8!)
                let shortStartDelay: TimeInterval = 0.01    // seconds
                let now: TimeInterval = player8?.deviceCurrentTime ?? 0
                let timeDelayPlay: TimeInterval = now + shortStartDelay
                player8?.currentTime = temp // Specific time to start play
                player8?.play(atTime: timeDelayPlay)
                Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (_) in
                    
                    if player8.isPlaying{
                        
                        let screen = UIScreen.main.bounds.width - 220
                        
                        let value = player8.currentTime / player8.duration
                        
                        self.width8 = screen * CGFloat(value)
                        time8 = player8.currentTime
                        
                    }
                }
            } catch{
                print("error")
            }
        }
        if(isSoundOn9 == true){
            do{
                player9 = try AVAudioPlayer(contentsOf: url9!)
                let shortStartDelay: TimeInterval = 0.01    // seconds
                let now: TimeInterval = player9?.deviceCurrentTime ?? 0
                let timeDelayPlay: TimeInterval = now + shortStartDelay
                player9?.currentTime = temp // Specific time to start play
                player9?.play(atTime: timeDelayPlay)
                Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (_) in
                    
                    if player9.isPlaying{
                        
                        let screen = UIScreen.main.bounds.width - 220
                        
                        let value = player9.currentTime / player9.duration
                        
                        self.width9 = screen * CGFloat(value)
                        time9 = player9.currentTime
                        
                    }
                }
            } catch{
                print("error")
            }
        }
        if(isLoop == true && isPlaying == true && temp <= 1){
            DispatchQueue.main.asyncAfter(deadline: .now() + 16) {
                //                if stop button pressed - cancel the loop
                guard isPlaying == true else {
                    return
                }
                stopSound()
                playSound()
            }
            
        }
    }
    
    func stopSound() {
        isPlaying = false
        
        temp = 0.0
        
        time1 = 0.0
        time2 = 0.0
        time3 = 0.0
        time4 = 0.0
        time5 = 0.0
        time6 = 0.0
        time7 = 0.0
        time8 = 0.0
        time9 = 0.0
        
        player1?.stop()
        player2?.stop()
        player3?.stop()
        player4?.stop()
        player5?.stop()
        player6?.stop()
        player7?.stop()
        player8?.stop()
        player9?.stop()
        
        
        
        width1 = 0
        width2 = 0
        width3 = 0
        width4 = 0
        width5 = 0
        width6 = 0
        width7 = 0
        width8 = 0
        width9 = 0
    }
    func stopSoundEx() {
        
        
        isPlaying = false
        
        time1 = 0.0
        time2 = 0.0
        time3 = 0.0
        time4 = 0.0
        time5 = 0.0
        time6 = 0.0
        time7 = 0.0
        time8 = 0.0
        time9 = 0.0
        
        player1?.stop()
        player2?.stop()
        player3?.stop()
        player4?.stop()
        player5?.stop()
        player6?.stop()
        player7?.stop()
        player8?.stop()
        player9?.stop()
        
        
        
        width1 = 0
        width2 = 0
        width3 = 0
        width4 = 0
        width5 = 0
        width6 = 0
        width7 = 0
        width8 = 0
        width9 = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
