//go:build cgo

package main

// Fallback nextHandle for CGO builds where server.go is excluded
func nextHandle(action *Action, result func(data interface{})) bool { return false }

