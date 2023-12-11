//
//  ChrmUrlService.swift
//  Chrmr MessagesExtension
//
//  Created by Luke Boggs on 5/9/21.
//  Copyright © 2021 Charms Co. All rights reserved.
//

import Foundation

class ChrmUrlService {
    
    func fetchChrmUrl(songClip: SongClip, completionHandler: @escaping (String) -> Void) {
//        var url = URL(string: "http://helloworldbawgz.com:8080")!
        var url = URL(string: "https://us-central1-chrmrapp.cloudfunctions.net/chrm-url")!

        var request = URLRequest(url: url)
        let jsonEncoder = JSONEncoder()
//        let songClipCopy = SongClip(id: songClip.id, title: songClip.title, artist: songClip.artist, coverUrl: "", audioUrl: "")
        do {
            request.httpBody = try jsonEncoder.encode(songClip)
        } catch {
            print(error)
        }
        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        let str = String(decoding: request.httpBody!, as: UTF8.self)
        print(str)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("error")
                print(error)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                print("error")
                var httpResponse = response as! HTTPURLResponse;
                print(httpResponse)
                print(httpResponse.statusCode)
                print(response)
                return
            }
            if let data = data,
                let string = String(data: data, encoding: .utf8) {
                    print(string)
                    completionHandler(string)
                }
        }.resume()
    }
}
