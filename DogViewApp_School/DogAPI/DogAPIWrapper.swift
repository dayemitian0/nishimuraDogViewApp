//
//  DogAPIWrapper.swift
//  DogViewApp_School
//
//  Created by user on 2023/09/12.
//

import UIKit

class DogAPIWrapper {

    
    func getDogList(success: @escaping([BreedsData]) -> Void) {
        let api = ListAllBreedsAPI()
        api.getListAllBreedsAPI { breedsInfo in
            var breadList: [BreedsData] = []
            for breed in breedsInfo {
                let breed = BreedsData(dobBreeds: breed.key, subBreeds: breed.value)
                breadList.append(breed)
            }
            success(breadList)
        }
    }
    
}
