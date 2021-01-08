import Foundation

// MARK: - Filme
struct ModeloFilme: Codable {
    let page: Int
    let results: [Result]
    let totalPages, totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Result: Codable {
    let adult: Bool?
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: OriginalLanguage
    let originalTitle: String?
    let overview, posterPath: String
    let releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double
    let voteCount: Int
    let popularity: Double
    let mediaType: String
    let firstAirDate, name, originalName: String?
    let originCountry: [String]?
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case popularity
        case mediaType = "media_type"
        case firstAirDate = "first_air_date"
        case name
        case originalName = "original_name"
        case originCountry = "origin_country"
    }
}

//enum MediaType: String, Codable {
//    case movie = "movie"
//    case tv = "tv"
//}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case ja = "ja"
}




    
//    var gerenciadorDeResultados:NSFetchedResultsController<Filme>?
//    var contexto:NSManagedObjectContext {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        return appDelegate.persistentContainer.viewContext
//    }
//
//    func recuperaFilmes() -> Array<Filme> {
//
//        let pesquisaFilme:NSFetchRequest<Filme> = Filme.fetchRequest()
//
//
//        gerenciadorDeResultados = NSFetchedResultsController(fetchRequest: pesquisaFilme, managedObjectContext: contexto, sectionNameKeyPath: nil, cacheName: nil)
//
//        do {
//        try gerenciadorDeResultados?.performFetch()
//        } catch {
//        print(error.localizedDescription)
//        }
//
//        guard let listaDeFilmes = gerenciadorDeResultados?.fetchedObjects else {return []}
//        return listaDeFilmes
//    }
//
//
//    func salvaFilme(dicionarioDeFilme: Dictionary<String, Any>) {
//      let filme = Filme(context: contexto)
//
//        filme.media_type = dicionarioDeFilme["media_type"] as? String
//
//        if filme.media_type == "movie"{
//            filme.origin_title = dicionarioDeFilme["title"] as? String
//        }else{
//            filme.origin_title = dicionarioDeFilme["name"] as? String
//
//        }
//        filme.visaoGeral = dicionarioDeFilme["overview"] as? String
//        filme.vote_average = dicionarioDeFilme["vote_average"] as? String
//        filme.release_date = dicionarioDeFilme["release_date"] as? String
//        filme.backdrop_path = dicionarioDeFilme["backdrop_path"] as? String
//        filme.genre_ids = dicionarioDeFilme["genre_ids"] as? String
//        filme.original_language = dicionarioDeFilme["original_language"] as? String
//        filme.video = dicionarioDeFilme["video"] as? String
//        filme.popularidade = dicionarioDeFilme["popularity"] as? String
//        filme.video = dicionarioDeFilme["video"] as? String
//        filme.adult = dicionarioDeFilme["adult"] as? String
//        filme.vote_count = dicionarioDeFilme["vote_count"] as? String
//
//
//
//
//        guard let titulo = filme.origin_title else {return}
//        guard let descricao = filme.visaoGeral else {return}
//
//        print(titulo)
//        print("Descrição: \(descricao)")
//
//        atualizaContexto()
//
//
//
//    }
//    func atualizaContexto() {
//        do {
//            try contexto.save()
//        } catch {
//            print(error.localizedDescription)
//        }
//    }

