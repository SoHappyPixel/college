package geometry

import "testing"

func TestNewCuadrado(t *testing.T) {
	c := NewCuadrado(10)
	if c.lado != 10 {
		t.Error("lado != 10")
		return
	}
}
