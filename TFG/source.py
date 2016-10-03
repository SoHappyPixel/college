#!/usr/bin/python3
# -*- coding: utf-8 -*-

import sys
from PyQt5 import QtGui as g
from PyQt5 import QtWidgets as w

class Example(w.QMainWindow):

    def __init__(self):
        super().__init__()
        self.initUI()


    def initUI(self):
        canvas = w.QTextEdit()
        menubar = self.menuBar()

        # el widget central debería ser un canvas.
        self.setCentralWidget(canvas)
        # crear la statusbar.
        self.statusBar()

        ### convertir esto en método
        ### make_button(img,tag,self,shortcut,statusbar_text,action)
        # definición del botón (icono,tag,self).
        exitAction = w.QAction(g.QIcon('exit24.png'), 'Exit', self)
        # atajo de teclado.
        exitAction.setShortcut('Ctrl+Q')
        # descripción en statusbar.
        exitAction.setStatusTip('Exit application')
        # acción a realizar.
        exitAction.triggered.connect(self.close)

        fileMenu = menubar.addMenu('File')
        fileMenu.addAction(exitAction)

        toolbar = self.addToolBar('Exit')
        toolbar.addAction(exitAction)

        self.setWindowTitle('IDE_UIFD')
        self.show()


if __name__ == '__main__':
    app = w.QApplication(sys.argv)
    ex = Example()
    sys.exit(app.exec_())
