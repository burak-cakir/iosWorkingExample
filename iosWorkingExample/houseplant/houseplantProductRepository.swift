//
//  houseplantProductRepository.swift
//  iosWorkingExample
//
//  Created by burak cakir on 18.11.2021.
//

import Foundation




class ProductRepository{
    
    
    func getAll(completionHandler: @escaping([ProductModel]) -> Void){
        
        guard let url = URL(string: Config.apiURL + "api/products" ) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            do{
                if let returnData = data{
                    let decodeData = try JSONDecoder().decode([ProductModel].self, from: returnData)
                    completionHandler(decodeData)
                    
                }
            }
            catch{
                print("Error")
            }
            
        }.resume()
        
        
    }
    
       func add(productModel: ProductModel, completionHandler:  @escaping (ProductModel)-> Void){
        
        guard let url = URL(string: Config.apiURL + "api/products") else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let postString = "name=\(productModel.name)&description=\(productModel.description)&images=\(productModel.images)&price=\(productModel.price)"
        
        
        request.httpBody = postString.data(using: .utf8)
        
        
        URLSession.shared.dataTask(with: request){ (data,response,error) in
            
            do{
                
                if let returnData = data{
                    let decodeData = try JSONDecoder().decode(ProductModel.self, from: returnData)
                    
                    completionHandler(decodeData)
                    
                    
                }
                
            }
            catch{
                print("Error!")
            }
            
        }.resume()
    }
    
    
}


struct ProductModel : Codable{
//    var id: Int = 0
    var name:String = ""
    var description:String = ""
    var images:String = ""
    var price:String = ""
}
