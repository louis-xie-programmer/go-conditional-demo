// main.go
package main

import "go-conditional-demo/logger"

func main() {
    log := logger.NewLogger()
    log.Log("Hello conditional build!")
}
