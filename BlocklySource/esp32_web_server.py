#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import BaseHTTPServer
import SimpleHTTPServer
import os
import subprocess
import tempfile
import urllib

class Handler(SimpleHTTPServer.SimpleHTTPRequestHandler):
    def do_HEAD(self):
        """Send response headers"""
        if self.path != "/":
            return SimpleHTTPServer.SimpleHTTPRequestHandler.do_HEAD(self)
        self.send_response(200)
        self.send_header("content-type", "text/html;charset=utf-8")
        self.send_header('Access-Control-Allow-Origin', '*')
        self.end_headers()

    def do_GET(self):
        """Send page text"""
        if self.path != "/":
            return SimpleHTTPServer.SimpleHTTPRequestHandler.do_GET(self)
        else:
            self.send_response(302)
            self.send_header("Location", "/blockly/apps/blocklyduino/index.html")
            self.end_headers()

    def do_POST(self):
        """Save new page text and display it"""
        if self.path != "/":
            return SimpleHTTPServer.SimpleHTTPRequestHandler.do_POST(self)

        length = int(self.headers.getheader('content-length'))
        if length:
            text = self.rfile.read(length)

            dirname = tempfile.mkdtemp()
            sketchname = os.path.join(dirname, os.path.basename(dirname)) + ".ino"
            f = open(sketchname, "wb")
            f.write(text + "\n")
            f.close()

            # Substituido pelo arquivo de upload do Soneca
            rc = subprocess.call(["sh", "upload.sh", sketchname])

            # Comando timeout retorna 124
            if rc == 124:
                print "Killed by timeout, but probably uploaded the code"
                self.send_response(200)
            # Caso outro erro
            elif not rc == 0:
                print "Something went wrong"
                self.send_response(400)
            # Tudo certo aqui
            else:
                self.send_response(200)
                self.send_header('Access-Control-Allow-Origin', '*')
                self.end_headers()
        else:
            self.send_response(400)


if __name__ == '__main__':
    # Mandando um subprocess.Popen abre em background
    subprocess.Popen(["sh", "precompile.sh"])
    subprocess.Popen(["xdg-open", "http://127.0.0.1:8080"])

    print "Blocklyduino can now be accessed at http://127.0.0.1:8080/"
    server = BaseHTTPServer.HTTPServer(("127.0.0.1", 8080), Handler)
    server.pages = {}
    server.serve_forever()
