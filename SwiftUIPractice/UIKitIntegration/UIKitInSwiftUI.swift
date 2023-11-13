//
//  UIKitIntegration.swift
//  SwiftUIPractice
//
//  Created by Neosoft on 26/10/23.
//

import SwiftUI
import PhotosUI

//MARK: - UIViewControllerRepresentable
//All the ViewController
struct DemoVC: UIViewControllerRepresentable{
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = DemoViewController()
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        uiViewController.view.backgroundColor = .lightGray
    }
    
    typealias UIViewControllerType = UIViewController
}

struct ImagePicker: UIViewControllerRepresentable{
    @Binding var image: UIImage?
    
    //Coordinator that is bridge between SwiftUIView and UIviewController or UIview
    class Coordinator: PHPickerViewControllerDelegate{
        var parent: ImagePicker
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            
            guard let provider = results.first?.itemProvider else {return}
            if provider.canLoadObject(ofClass: UIImage.self){
                provider.loadObject(ofClass: UIImage.self) { img,_ in
                    self.parent.image = img as? UIImage
                }
            }
        }
    }
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
}

struct UIKitInSwiftUI: View {
    
    @State var img: Image?
    @State var inputImg: UIImage?
    @State var showingPicker = false
    var body: some View {
        VStack{
            img?
                .resizable()
//                .scaledToFit()
//                .scaledToFill()
                .aspectRatio(contentMode: .fill)
            Button("Select Image") {
                showingPicker = true
            }
            DemoVC()
            
        }
        .sheet(isPresented: $showingPicker) {
            ImagePicker(image: $inputImg)
        }
        .onChange(of: inputImg) { newValue in
            img = Image(uiImage: inputImg ?? UIImage())
        }
    }
}


struct UIKitInSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        UIKitInSwiftUI()
    }
}
