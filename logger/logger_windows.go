//go:build windows
package logger

import "fmt"

type platformLogger struct{}
func (platformLogger) Log(msg string) {
    fmt.Printf("[Windows] %s\n", msg)
}
func NewPlatformLogger() Logger { return platformLogger{} }