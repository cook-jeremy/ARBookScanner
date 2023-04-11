//
//  ContentView.swift
//  FirstARApp
//
//  Created by Jeremy Cook on 4/3/23.
//

import SwiftUI
import RealityKit
import ARKit

struct ContentView : View {
   var body: some View {
      ARViewContainer().edgesIgnoringSafeArea(.all)
   }
}

struct ARViewContainer: UIViewRepresentable {
   
   var bookScene: Experience.BookScene
   
   init() {
      bookScene = try! Experience.loadBookScene()
   }
   
   func makeUIView(context: Context) -> ARView {
      
      let arView = ARView(frame: .zero)
      arView.debugOptions = ARView.DebugOptions.showAnchorOrigins

      bookScene.bookDescription?.isEnabled = false
      
      // Add the box anchor to the scene
      arView.scene.anchors.append(bookScene)
      return arView
   }
   
   func updateUIView(_ uiView: ARView, context: Context) {
      
   }
   
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}
#endif
