//go:build darwin
package logger

import "fmt"

type platformLogger struct{}
func (platformLogger) Log(msg string) {
    fmt.Printf("[DARWIN] %s\n", msg)
}
func NewPlatformLogger() Logger { return platformLogger{} }
