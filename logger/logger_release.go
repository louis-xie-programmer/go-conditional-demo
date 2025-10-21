//go:build !debug
package logger

type releaseLogger struct{ base Logger }
func NewLogger() Logger { return &releaseLogger{NewPlatformLogger()} }
func (l *releaseLogger) Log(msg string) { l.base.Log(msg) }
