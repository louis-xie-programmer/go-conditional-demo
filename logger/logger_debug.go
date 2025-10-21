//go:build debug
package logger

import (
    "fmt"
    "time"
)

type debugLogger struct{ base Logger }
func NewLogger() Logger { return &debugLogger{NewPlatformLogger()} }
func (l *debugLogger) Log(msg string) {
    fmt.Printf("[DEBUG %s] ", time.Now().Format("15:04:05"))
    l.base.Log(msg)
}
