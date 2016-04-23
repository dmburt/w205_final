import sys
import os


filepath          = sys.argv[1]
filename, fileext = os.path.splitext(filepath)

def utf_to_ascii():

    thisfile = open(filepath, "rb")
    filedata = thisfile.read().decode("utf-8")
    outdata  = filedata.encode("ascii", "ignore")
    outfile  = open(filename + '_ascii' + fileext, "wb")

    outfile.write(outdata)

utf_to_ascii()
