import UIKit
import AVFoundation

var str = "Hello, playground"

// MARK:- part 1: simplifying Player class by Playable protocol

// first way of Player class implementation
//class Player {
//    private let avPlayer = AVPlayer()
//
//    func play(_ song: Song) {
//        let item = AVPlayerItem(url: song.audioURL)
//        avPlayer.replaceCurrentItem(with: item)
//        avPlayer.play()
//    }
//
//    func play(_ album: Album) {
//        let item = AVPlayerItem(url: album.audioURL)
//        avPlayer.replaceCurrentItem(with: item)
//        avPlayer.play()
//    }
//}
protocol Playable {
    var audioURL: URL { get }
}

// conforming to protocol via audioURL property
struct Song: Playable {
    var name: String
    var album: Album
    var audioURL: URL
    var isLiked: Bool
}

// conforming to protocol via extension
struct Album {
    var name: String
    var imageURL: URL
    var audioURL: URL
    var isLiked: Bool
}

extension Album: Playable {}

class Player {
    private let avPlayer = AVPlayer()

    func play(_ resource: Playable) {
        let item = AVPlayerItem(url: resource.audioURL)
        avPlayer.replaceCurrentItem(with: item)
        avPlayer.play()
    }
}

// MARK:- part 2:
var isLiked:Bool?
protocol Likeable {
    mutating func markAsLiked()
}
extension Likeable {
    mutating func markAsLiked() {
        isLiked = true
    }
}

extension Song: Likeable {
    mutating func markAsLiked() {
        isLiked = true
    }
}
extension Album: Likeable {}

// MARK:- example 2
// imagine we are creating app that have different users like admin guest users and registered ones

protocol User {
    var id:UUID { get }
    var name: String { get }
}

protocol AuthenticatedUser: User {
    var token: Int { get }
}

struct Admin {}
struct Member {}
struct Guest {}

// conforming to protocols
extension Admin: User, AuthenticatedUser {}
extension Member: User, AuthenticatedUser {}
extension Guest: User, AuthenticatedUser {}


