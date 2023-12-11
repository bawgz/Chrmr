//
//  FileFetcher.swift
//  Chrmr MessagesExtension
//
//  Created by Luke Boggs on 10/4/20.
//  Copyright © 2020 Charms Co. All rights reserved.
//

import Foundation

class FileFetcher {
    
    func fetchFile(audioUrl: String, id: String, completionHandler: @escaping (URL) -> Void) {
        let audioUrl = URL(string: audioUrl)

        // then lets create your document folder url
        let documentsDirectoryURL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

        // lets create your destination file url
        let destinationUrl = documentsDirectoryURL.appendingPathComponent(id + ".mp3")
        print(destinationUrl)

        // to check if it exists before downloading it
        if FileManager.default.fileExists(atPath: destinationUrl.path) {
            print("The file already exists at path")
            completionHandler(destinationUrl)
        } else {

            // you can use NSURLSession.sharedSession to download the data asynchronously
            URLSession.shared.downloadTask(with: audioUrl!) { location, response, error in
                guard let location = location, error == nil else {
                    print("error calling file service")
                    print(error)
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse,
                    (200...299).contains(httpResponse.statusCode) else {
                    print("error response returned from file service")
                    print(response)
                    return
                }
                do {
                    // after downloading your file you need to move it to your destination url
                    try FileManager.default.moveItem(at: location, to: destinationUrl)
                    print("File moved to documents folder")
                    completionHandler(destinationUrl)
                } catch {
                    print(error)
                }
            }.resume()
        }
    }
}
