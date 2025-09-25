//go:build cgo && !android

package main

// Fallback nextHandle for CGO builds where server.go is excluded (non-Android)
func nextHandle(action *Action, result func(data interface{})) bool { return false }
