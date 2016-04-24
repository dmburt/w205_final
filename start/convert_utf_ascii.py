import sys
import os


filepath          = sys.argv[1]
filename, fileext = os.path.splitext(filepath)

def utf_to_ascii():

    firstrec = True

    with open(filename + '_ascii' + fileext, 'a') as fileout:

        with open(filepath, "rb") as filein:
            for line in filein:
                if firstrec != False:
                    next(filein)
                    firstrec = False

                    filedata = line.decode("utf-8")
                    outdata  = filedata.encode("ascii", "ignore")
                    fileout.writelines(outdata)


utf_to_ascii()
