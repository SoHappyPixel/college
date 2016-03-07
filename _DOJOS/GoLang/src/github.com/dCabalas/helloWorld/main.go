package main

import "fmt"

const Pi = 3.14

const (
	Rojo = iota
	Azul
	Verde
)

type Codigo int
type Cadena string

func main(){

	var noNumber int64

	unNumero := 9
	unaString := "Hola"
	unFloat := 0.9
	unBool := true
	fmt.Println("Hello World !")
	fmt.Println(unNumero, unaString, unFloat, unBool, noNumber)

	//miArray := [10]int{}
	//miSly2 := []int{1,2,3,4,5}
	miSly := []int{}
	miSly = append(miSly, 1, 2, 3, 4)
	subArray := miSly[:len(miSly)]
	fmt.Println(miSly, subArray)

	miMapa := map[string]int{}
	_, ok := miMapa["none"] //Devuelve 0.
	if !ok {
		fmt.Println("No existe")
	}


	myCodigo := Codigo(5)
	myCadena := Cadena("Meh")
	fmt.Println(myCadena, myCodigo)
	fmt.Println(saludar("Hello"))

	x, y := getXY()
	fmt.Println(x, y)

	p := persona{"Dani",23} //no puntero
	fmt.Println(p)

	p2 := &persona{"Dani2",23} //puntero
	fmt.Println(p2)

	for i:=0; i<10; i++{ //for clasico
		fmt.Println(i)
	}

	suma := 0
	for suma < 20 { //while
		suma++
	}
	fmt.Println(suma)

	//panic("OMG")

	// for {
	// 	fmt.Println("loooooop")
	// }

	_, err := getError()
	if err != nil {
		fmt.Println(err)
	}
	fmt.Println("Todo guay")

}

type persona struct {
	nombre string
	edad int
}



func saludar(saludo string) string {
	return saludo + "..."
}

func getXY() (int, int){
	return 0,3
}


func getError() (int, error){
	return 0, fmt.Errorf("Boom!")

}

type MyError struct {
	porque string
	cuando int
}

func (e MyError) Error() string {

}
