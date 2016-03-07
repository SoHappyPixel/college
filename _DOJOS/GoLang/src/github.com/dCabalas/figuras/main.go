package main

import "github.com/dCabalas/figuras/geometry"
import "fmt"

func main() {
	cuad := geometry.NewCuadrado(10)
	fmt.Println(cuad)

	circ := geometry.NewCirculo(5)
	fmt.Println(circ)

	s1 := geometry.SumarAreas(cuad, cuad, cuad)
	fmt.Println(s1)
	s2 := geometry.SumarAreas(circ, circ, circ)
	fmt.Println(s2)

}
