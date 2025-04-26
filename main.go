package main

import (
    "fmt"
    "log"
    "net/http"
)

func main() {
    http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
        fmt.Fprintf(w, "OpenFaaS Gateway: Ready")
    })

    http.HandleFunc("/system/functions", func(w http.ResponseWriter, r *http.Request) {
        fmt.Fprintf(w, "[]")
    })

    log.Printf("Gateway listening on port 8081\n")
    if err := http.ListenAndServe(":8081", nil); err != nil {
        log.Fatal(err)
    }
}