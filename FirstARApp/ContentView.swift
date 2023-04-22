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
//      arView.debugOptions = ARView.DebugOptions.showAnchorOrigins

      //      bookScene.bookDescription?.isEnabled = false
      if let bookDescription = bookScene.bookDescription {
         
         
         if let textEntity = bookDescription.children[0].children[0] as? Entity {
            var textModelComp: ModelComponent = (textEntity.components[ModelComponent])!
            var material = SimpleMaterial()
            material.baseColor = .color(.red)
            textModelComp.materials[0] = material
            
            textModelComp.mesh = .generateText("Obj-C",
                                               extrusionDepth: 0.01,
                                               font: .systemFont(ofSize: 0.08),
                                               containerFrame: CGRect(),
                                               alignment: .left,
                                               lineBreakMode: .byCharWrapping)
            
            textEntity.position = [-0.1,-0.05, 0.01]
            
            bookDescription.children[0].children[0].components.set(textModelComp)
            
//            try? textMesh.replace(with: MeshResource.generateText("Hello World").contents)
         }
      }
      
      // Add the box anchor to the scene
      arView.scene.anchors.append(bookScene)
      return arView
   }
   
   func updateUIView(_ uiView: ARView, context: Context) {
//      print("updateUIView called")
   }
   
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}
#endif
