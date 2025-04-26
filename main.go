// Package main provides a simple OpenFaaS gateway implementation
package main

import (
    "fmt"
    "log"
    "net/http"
)

// main initializes and starts the OpenFaaS gateway server
func main() {
    // Root handler returns a ready status
    http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
        fmt.Fprintf(w, "OpenFaaS Gateway: Ready")
    })

    // Functions endpoint returns an empty array as placeholder
    // for future function management implementation
    http.HandleFunc("/system/functions", func(w http.ResponseWriter, r *http.Request) {
        fmt.Fprintf(w, "[]")
    })

    log.Printf("Gateway listening on port 8081\n")
    if err := http.ListenAndServe(":8081", nil); err != nil {
        log.Fatal(err)
    }
}