package controllers

import (
	"github.com/sarataha/cinema/bookings/models"
)

type (
	// For Get - /bookings
	BookingsResource struct {
		Data []models.Booking `json:"data"`
	}
	// For Post/Put - /bookings
	BookingResource struct {
		Data models.Booking `json:"data"`
	}
)
