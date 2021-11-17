//
//  houseplantAddProduct.swift
//  iosWorkingExample
//
//  Created by burak cakir on 18.11.2021.
//

import SwiftUI

struct houseplantAddProduct: View {
//    @State var id : Int = 0
    @State var name : String = ""
    @State var description : String = ""
    @State var images : String = ""
    @State var price : String = ""
    
    @State var product = [ProductModel]()
    
    var productRepository = ProductRepository()
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Section1")){
                    
                    TextField("Name", text:$name)
                    TextField("Description", text:$description)
                    
                    
    
                   
                }
                
                Section(header: Text("İmages link")){
                    TextField("images", text:$images)
                    TextField("price", text:($price))
                    
                    }
                    
                    
                    
                    
                    
                    
                    Button("Add"){
                        
                        let model = ProductModel(
                                                 name: name,
                                                 description: description,
                                                 images: images,
                                                 price: price
                                                 
                            )
                        
                        productRepository.add(productModel: model){newProduct in
                            print(newProduct)
                        }
                        
                    }
                    .disabled(name.isEmpty )
                }
  
            }
        }
    }



struct houseplantAddProduct_Previews: PreviewProvider {
    static var previews: some View {
        houseplantAddProduct()
    }
}
