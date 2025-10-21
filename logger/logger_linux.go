//go:build linux
package logger

import "fmt"

type platformLogger struct{}
func (platformLogger) Log(msg string) {
    fmt.Printf("\033[32m[LINUX]\033[0m %s\n", msg)
}
func NewPlatformLogger() Logger { return platformLogger{} }
