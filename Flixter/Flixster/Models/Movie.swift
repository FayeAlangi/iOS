//
//  Movies.swift
//  Flixster
//
//  Created by Faye Alangi on 3/5/23.
//

import Foundation

struct Movie{
    let title : String
    let overview : String
    let posterURL : URL
    let backdropURL : URL
    let popularity : Double
    let voteAverage : Double
    let voteCount : Int
    
}

extension Movie {
    
    static var mockMovies : [Movie] = [
        Movie(title: "Knock at the Cabin",
              overview: "While vacationing at a remote cabin, a young girl and her two fathers are taken hostage by four armed strangers who demand that the family make an unthinkable choice to avert the apocalypse. With limited access to the outside world, the family must decide what they believe before all is lost.", posterURL: URL(string: "https://image.tmdb.org/t/p/w342/dm06L9pxDOL9jNSK4Cb6y139rrG.jpg")!, backdropURL: URL(string: "https://image.tmdb.org/t/p/w342/22z44LPkMyf5nyyXvv8qQLsbom.jpg")!, popularity : 4286.16, voteAverage : 6.6, voteCount :778),
        Movie(title: "Black Panther: Wakanda Forever", overview: "Queen Ramonda, Shuri, M’Baku, Okoye and the Dora Milaje fight to protect their nation from intervening world powers in the wake of King T’Challa’s death.  As the Wakandans strive to embrace their next chapter, the heroes must band together with the help of War Dog Nakia and Everett Ross and forge a new path for the kingdom of Wakanda.", posterURL: URL(string: "https://image.tmdb.org/t/p/w342/sv1xJUazXeYqALzczSZ3O6nkH75.jpg")!,backdropURL: URL(string: "https://image.tmdb.org/t/p/w342/xDMIl84Qo5Tsu62c9DGWhmPI67A.jpg")!, popularity : 4286.16, voteAverage : 7.4, voteCount :3823),
        Movie(title: "Puss in Boots: The Last Wish", overview: "Puss in Boots discovers that his passion for adventure has taken its toll: He has burned through eight of his nine lives, leaving him with only one life left. Puss sets out on an epic journey to find the mythical Last Wish and restore his nine lives.", posterURL: URL(string: "https://image.tmdb.org/t/p/w342/kuf6dutpsT0vSVehic3EZIqkOBt.jpg")!,backdropURL: URL(string: "https://image.tmdb.org/t/p/w342/b1Y8SUb12gPHCSSSNlbX4nB3IKy.jpg")!, popularity : 4286.16, voteAverage : 8.4, voteCount :4277),
        Movie(title: "Little Dixie", overview: "Erstwhile Special Forces operative Doc Alexander is asked to broker a truce with the Mexican drug cartel in secrecy. When Oklahoma Governor Richard Jeffs celebrates the execution of a high-ranking cartel member on TV, his Chief of Staff and Doc inform him about the peace he just ended. But it’s too late, as Cuco, the cartel’s hatchet man, has set his vengeful sights on Doc’s daughter Dixie.", posterURL: URL(string: "https://image.tmdb.org/t/p/w342/cmWTZj9zzT9KFt3XyL0gssL7Ig8.jpg")!,backdropURL: URL(string: "https://image.tmdb.org/t/p/w342/k4V6EvpcOsu8CX10JD0H53lFXLq.jpg")!, popularity : 2015.06, voteAverage : 6.4, voteCount :46),
        Movie(title: "Huesera", overview: "Valeria's joy at becoming a first-time mother is quickly taken away when she's cursed by a sinister entity. As danger closes in, she's forced deeper into a chilling world of dark magic that threatens to consume her.", posterURL: URL(string: "https://image.tmdb.org/t/p/w342/7NhG3NClQ1xrc3kEwTiwFht5Y3L.jpg")!,backdropURL: URL(string: "https://image.tmdb.org/t/p/w342/A2avUoNFstnBhAnHiogXQs4c9Bt.jpg")!, popularity : 1896.806, voteAverage : 6.7, voteCount :65),
        Movie(title: "Shotgun Wedding", overview: "Darcy and Tom gather their families for the ultimate destination wedding but when the entire party is taken hostage, ’Til Death Do Us Part takes on a whole new meaning in this hilarious, adrenaline-fueled adventure as Darcy and Tom must save their loved ones—if they don’t kill each other first.", posterURL: URL(string: "https://image.tmdb.org/t/p/w342/t79ozwWnwekO0ADIzsFP1E5SkvR.jpg")!,backdropURL: URL(string: "https://image.tmdb.org/t/p/w342/zGoZB4CboMzY1z4G3nU6BWnMDB2.jpg")!, popularity : 1415.663, voteAverage : 6.4, voteCount :583)
    ]
}
