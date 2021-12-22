package main

import (
	"net/http"
	"testing"

	"github.com/go-chi/chi"
)

func Test_APIFunction(t *testing.T) {
	r := chi.NewRouter()
	r.Get("/", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("root"))
	})

	r.Get("/ping", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("pong"))
	})

	r.Get("/panic", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte(`{"status":"success"}`))
	})
	// RESTy routes for "articles" resource
	r.Get("/quotes", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte(`{"status":"success"}`))
	})
	// ts := httptest.NewServer(r)
}
