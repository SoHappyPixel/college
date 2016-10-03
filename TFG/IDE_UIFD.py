#!/usr/bin/python3
# -*- coding: utf-8 -*-

import sys
from PyQt5 import QtGui as g
from PyQt5 import QtWidgets as w


class IDE_UIFD(w.QMainWindow) :

    # Constructor base.
    def __init__(self) :
        super().__init__()
        self.UI()

    # Definición de la interfaz.
    def UI(self) :
        # 0. Buttons / Actions.
        AB_exit = self.AB('Salir','Ctrl+Q','Dejar',self.close)

        # 1. Canvas
        canvas = w.QTextEdit()
        self.setCentralWidget(canvas)

        # 2. Barra de menu.
        menubar = self.menuBar()
        fileMenu = menubar.addMenu('Window')
        fileMenu.addAction(AB_exit)

        # 3. Barra de herramientas.
        toolbar = self.addToolBar('Salir')
        toolbar.addAction(AB_exit)

        # 4. Barra lateral (izquierda).

        # 5. Barra de estado.
        self.statusBar()

        # 6. Barra de titulo y lanzar la app.
        self.setWindowTitle('IDE_UIFD')
        self.show()

    # Metodo para crear botones/acciones.
    def AB(self,tag,shortcut,sb_text,action) :
        AB = w.QAction(tag, self)       # botón
        AB.setShortcut(shortcut)        # atajo
        AB.setStatusTip(sb_text)        # statusbar
        AB.triggered.connect(action)    # accion
        return AB


if __name__ == '__main__':
    app = w.QApplication(sys.argv)
    ui = IDE_UIFD()
    sys.exit(app.exec_())
