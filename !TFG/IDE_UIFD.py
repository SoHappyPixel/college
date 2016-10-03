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
        # el widget central debería ser un canvas.
        self.setCentralWidget(w.QTextEdit())

        # definición del botón (icono,tag,self).
        exitAction = w.QAction(g.QIcon('exit24.png'), 'Exit', self)
        # atajo de teclado.
        exitAction.setShortcut('Ctrl+Q')
        # descripción en statusbar.
        exitAction.setStatusTip('Exit application')
        # acción a realizar.
        exitAction.triggered.connect(self.close)

        self.statusBar()

        menubar = self.menuBar()
        fileMenu = menubar.addMenu('&File')
        fileMenu.addAction(exitAction)

        toolbar = self.addToolBar('Exit')
        toolbar.addAction(exitAction)

        # self.setGeometry(300, 300, 350, 250)
        self.setWindowTitle('IDE_UIFD')
        self.show()


if __name__ == '__main__':
    app = w.QApplication(sys.argv)
    ex = Example()
    sys.exit(app.exec_())
