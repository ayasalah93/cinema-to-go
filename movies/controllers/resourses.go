package controllers

import (
	"github.com/sarataha/cinema/movies/models"
)

type (
	// For Get - /movies
	MoviesResource struct {
		Data []models.Movie `json:"data"`
	}
	// For Post/Put - /movies
	MovieResource struct {
		Data models.Movie `json:"data"`
	}
)
