package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"net/http"

	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"
)

func main() {
	r := chi.NewRouter()
	r.Use(middleware.RequestID)
	r.Use(middleware.Logger)
	r.Get("/quotes", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/json")
		resp, err := http.Get("https://api.quotable.io/random")
		if err != nil {
			log.Fatalln(err)
		}
		body, err := ioutil.ReadAll(resp.Body)
		if err != nil {
			log.Fatalln(err)
		}
		sb := string(body)
		w.WriteHeader(http.StatusOK)
		log.Println(w.Write([]byte(sb)))
	})
	r.Get("/wheater", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/json")
		resp, err := http.Get("https://api.openweathermap.org/data/2.5/weather?q=Semarang,id&appid=b6907d289e10d714a6e88b30761fae22")
		if err != nil {
			log.Fatalln(err)
		}
		body, err := ioutil.ReadAll(resp.Body)
		if err != nil {
			log.Fatalln(err)
		}
		sb := string(body)
		w.WriteHeader(http.StatusOK)
		log.Println(w.Write([]byte(sb)))

	})
	fmt.Println("Listening to port 3000")
	log.Println(http.ListenAndServe(":3000", r))
}
