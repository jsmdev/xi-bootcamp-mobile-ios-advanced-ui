//
//  TopicCellViewModel.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 08/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

protocol TopicCellViewModelDelegate: class {
    func didDownload(image: UIImage?)
}

/// ViewModel que representa un topic en la lista
class TopicCellViewModel {
    let topic: Topic
    weak var delegate: TopicCellViewModelDelegate?
    var imageStringURL: String?
    var userImageURL: String?
    var userImage: UIImage?
    var titleText: String?
    var postCountText: String?
    var posterCountText: String?
    var dateText: String?
    
    init(topic: Topic) {
        self.topic = topic
        titleText = topic.title
        postCountText = "\(topic.postsCount)"
        posterCountText = "\(topic.posters.count)"
        dateText = topic.lastPostedAt
        userImageURL = formatAvatarURL()
        getPhotoImage(with: userImageURL)
    }
    
    private func formatAvatarURL() -> String {
        let apiURL = "https://mdiscourse.keepcoding.io"
        guard let userURL = userImageURL else {
            return apiURL
        }
        let formatedURL = userURL.replacingOccurrences(of: "{size}", with: "100")
        return apiURL + formatedURL
    }
    
    private func getPhotoImage(with imagePath: String?) {
        guard let imageString = imagePath, let imageURL = URL(string: imageString) else { return }
        
        DispatchQueue.global(qos: .userInitiated).async {
            guard let imageData: Data = try? Data(contentsOf: imageURL) else { return }
            let image: UIImage? = UIImage(data: imageData)
            self.userImage = image
            self.delegate?.didDownload(image: image)
        }
    }
}
