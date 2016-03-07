package main

import (
	"fmt"
	"bitbucket.org/mrd0ll4r/tbotapi"
	"bitbucket.org/mrd0ll4r/tbotapi/examples/boilerplate"

)

// go yfunc() //Concurrencia
// defer yfunc() //Ultima a ejecutar

func updater(update tbotapi.Update, api *tbotapi.TelegramBotAPI) {
	if update.Type() != tbotapi.MessageUpdate {
		fmt.Println("No es valido")
		return
	}

	msg := update.Message
	chatInfo := msg.Chat
	recipient := tbotapi.NewRecipientFromChat(chatInfo)

	if msg.Type() != tbotapi.TextMessage {
		fmt.Println("No es valido")
		return
	}

	texto := *msg.Text

	switch texto {
		case "/photo":
			
		default:
			customMsg := help()
			output := api.NewOutgoingMessage(recipient, customMsg)
			_,err := output.Send() //Ejecutamos envío y capturamos error
			if err != nil {
				fmt.Println(err)
				return
			}
			fmt.Println("Mensaje enviado :D")

	}
}

func help() string {
	msg := "Mis comando son:\n"
	msg += "/photo - Te doy una foto"
	return msg
}
func main() {
	ApiKey := "204680941:AAF4LckRh6cq3v2VZyqWz_0ypXEzAN5Ba5U"
	boilerplate.RunBot(ApiKey, updater, "Bot de Dani", "Wiiiii")
}
