//
//  SerieDetailsViewModel.swift
//  Mockflix
//
//  Created by Lucas Werner Kuipers on 05/04/2021.
//

import Foundation

struct SerieDetailsViewModel {
	let tituloSerie: String
	let numeroDeTemporadas: Int
	
	init(detalhesSerie: SerieDetails) {
		self.tituloSerie = detalhesSerie.name
		self.numeroDeTemporadas = detalhesSerie.seasonCount
	}
}
