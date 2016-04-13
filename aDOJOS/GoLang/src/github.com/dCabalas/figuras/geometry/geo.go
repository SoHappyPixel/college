package geometry

import "math"

type Figura interface {
		Area() float64
}

//Cuadrado es una figura cuadrada
type Cuadrado struct {
	lado uint
}
func NewCuadrado (l uint) Cuadrado {
	return Cuadrado{l}
}
func (c Cuadrado) Area() float64{
	return float64(c.lado * c.lado)
}


type Circulo struct { //Clase
	radio uint
}
func NewCirculo(r uint) Circulo { //Constructor
	return Circulo{radio: r}	
}
func (c Circulo) Area() float64 { //Metodo de la clase
	return math.Pi * float64(c.radio)
}


func SumarAreas(figuras ...Figura) float64{
	var suma float64
	for _, f := range figuras {
		suma += f.Area()
	}
	return suma
}



type Empleado struct {
	nombre string
}
func (e Empleado) Hablar() string {
	return "Hablo mucho"
}
type Encargado struct {
	Empleado //NoHerencia(COMPOSICIÓN)
}


type Gato interface{
	Maulla() string
}
type Can interface{
	Ladrar() string
}
type GatoCan interface{
	Gato
	Can
	Caminar() int //Puede ser llamado desde Gato y Can
	//Ahora un GatoCan puede Ladrar y Maullar;
}
