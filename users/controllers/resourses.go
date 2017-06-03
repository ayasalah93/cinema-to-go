package controllers

import (
	"github.com/sarataha/cinema/users/models"
)

type (
	// For Get - /users
	UsersResource struct {
		Data []models.User `json:"data"`
	}
	// For Post/Put - /users
	UserResource struct {
		Data models.User `json:"data"`
	}
)
