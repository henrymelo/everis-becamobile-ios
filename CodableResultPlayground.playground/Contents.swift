import UIKit

//------------------- com retorno do Json - Array -----------------------------------------------------
//let json = """
//{
//"backdrop_path": "/kf456ZqeC45XTvo6W9pW5clYKfQ.jpg",
//"id": 508442,
//"overview": "Joe Gardner é um professor de música de ensino fundamental desanimado por não conseguir alcançar seu sonho de tocar no lendário clube de jazz The Blue Note, em Nova York. Quando um acidente o transporta para fora do seu corpo, fazendo com que ele exista em outra realidade na forma de sua alma, ele se vê forçado a embarcar em uma aventura ao lado da alma de uma criança que ainda está aprendendo sobre si, para aprender o que é necessário para retomar sua vida.",
//"poster_path": "/bzDAfXoqNAvWUe7uss2NE3BmRqy.jpg",
//"title": "Soul",
//"media_type": "movie"
//}
//"""
//
//struct Result : Codable {
//
//    var id: Int = 0
//    var backdropPath: String = ""
//    var title: String? // Quando a variável não é obrigatória no retorno da API se deve usar Optional
//    var overview = ""
//    var posterPath: String = ""
//
//    enum CodingKeys: String,CodingKey{
//        case id
//        case backdropPath = "backdrop_path"
//        case title
//        case overview
//        case posterPath = "poster_path"
//    }
//}
//
//
//let decoder = JSONDecoder()
//
//if let jsonData = json.data(using: .utf8) {
//
//    do {
//        let result = try decoder.decode(Result.self, from: jsonData)
//        print(result)
//
//    } catch {
//        print(error)
//    }
//}





//------------------- com retorno do Json - Dicionário -----------------------------------------------------
//let json = """
//[{
//"backdrop_path": "/kf456ZqeC45XTvo6W9pW5clYKfQ.jpg",
//"id": 508442,
//"overview": "Joe Gardner é um professor de música de ensino fundamental desanimado por não conseguir alcançar seu sonho de tocar no lendário clube de jazz The Blue Note, em Nova York. Quando um acidente o transporta para fora do seu corpo, fazendo com que ele exista em outra realidade na forma de sua alma, ele se vê forçado a embarcar em uma aventura ao lado da alma de uma criança que ainda está aprendendo sobre si, para aprender o que é necessário para retomar sua vida.",
//"poster_path": "/bzDAfXoqNAvWUe7uss2NE3BmRqy.jpg",
//"title": "Soul",
//"media_type": "movie"
//},
//{
//"overview": "Oito irmãos inseparáveis buscam amor e felicidade na alta sociedade de Londres.",
//"poster_path": "/qaewZKBKmXjb4ZfFBb1LCug6BE8.jpg",
//"id": 91239,
//"backdrop_path": "/m7FqiUOvsSk7Ulg2oRMfFGcLeT9.jpg"
//},
//{
//"overview": "Em uma terra fantástica e única, um hobbit recebe de presente de seu tio um anel mágico e maligno que precisa ser destruído antes que caia nas mãos do mal. Para isso, o hobbit Frodo tem um caminho árduo pela frente, onde encontra perigo, medo e seres bizarros. Ao seu lado para o cumprimento desta jornada, ele aos poucos pode contar com outros hobbits, um elfo, um anão, dois humanos e um mago, totalizando nove pessoas que formam a Sociedade do Anel.",
//"title": "O Senhor dos Anéis: A Sociedade do Anel",
//"backdrop_path": "/vRQnzOn4HjIMX4LBq9nHhFXbsSu.jpg",
//"poster_path": "/omoMXT3Z7XrQwRZ2OGJGNWbdeEl.jpg",
//"id": 120
//}]
//"""
//
//struct Result : Codable {
//
//    var id: Int = 0
//    var backdropPath: String = ""
//    var title: String?
//    var overview = ""
//    var posterPath: String = ""
//
//    enum CodingKeys: String,CodingKey{
//        case id
//        case backdropPath = "backdrop_path"
//        case title
//        case overview
//        case posterPath = "poster_path"
//    }
//}
//
//
//let decoder = JSONDecoder()
//
//if let jsonData = json.data(using: .utf8) {
//
//    do {
//        let result = try decoder.decode([Result].self, from: jsonData)
//        print(result)
//
//    } catch {
//        print(error)
//    }
//}


//------------------- com retorno do Json - Array de Dicionário ----------------------------------------------

let json = """
{
"page": 1,
"results": [{
"backdrop_path": "/kf456ZqeC45XTvo6W9pW5clYKfQ.jpg",
"id": 508442,
"overview": "Joe Gardner é um professor de música de ensino fundamental desanimado por não conseguir alcançar seu sonho de tocar no lendário clube de jazz The Blue Note, em Nova York. Quando um acidente o transporta para fora do seu corpo, fazendo com que ele exista em outra realidade na forma de sua alma, ele se vê forçado a embarcar em uma aventura ao lado da alma de uma criança que ainda está aprendendo sobre si, para aprender o que é necessário para retomar sua vida.",
"poster_path": "/bzDAfXoqNAvWUe7uss2NE3BmRqy.jpg",
"title": "Soul",
"media_type": "movie"
},
{
"overview": "Oito irmãos inseparáveis buscam amor e felicidade na alta sociedade de Londres.",
"poster_path": "/qaewZKBKmXjb4ZfFBb1LCug6BE8.jpg",
"id": 91239,
"backdrop_path": "/m7FqiUOvsSk7Ulg2oRMfFGcLeT9.jpg"
},
{
"overview": "Em uma terra fantástica e única, um hobbit recebe de presente de seu tio um anel mágico e maligno que precisa ser destruído antes que caia nas mãos do mal. Para isso, o hobbit Frodo tem um caminho árduo pela frente, onde encontra perigo, medo e seres bizarros. Ao seu lado para o cumprimento desta jornada, ele aos poucos pode contar com outros hobbits, um elfo, um anão, dois humanos e um mago, totalizando nove pessoas que formam a Sociedade do Anel.",
"title": "O Senhor dos Anéis: A Sociedade do Anel",
"backdrop_path": "/vRQnzOn4HjIMX4LBq9nHhFXbsSu.jpg",
"poster_path": "/omoMXT3Z7XrQwRZ2OGJGNWbdeEl.jpg",
"id": 120
}]
}
"""

struct Result : Codable {
    
    var id: Int = 0
    var backdropPath: String = ""
    var title: String?
    var overview = ""
    var posterPath: String = ""
    
    enum CodingKeys: String,CodingKey{
        case id
        case backdropPath = "backdrop_path"
        case title
        case overview
        case posterPath = "poster_path"
    }

}


struct ResultDataStore: Codable {
    var results: [Result]
}

let decoder = JSONDecoder()

if let jsonData = json.data(using: .utf8) {
    
    do {
        let resultDataStore = try decoder.decode(ResultDataStore.self, from: jsonData)
        for result in resultDataStore.results {
            print(result)
        }
        
    } catch {
        print(error)
    }
}
