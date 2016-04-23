import xlrd
import csv
import os
import sys


filepath          = sys.argv[1]
filename, fileext = os.path.splitext(filepath)

def xl_to_csv():

    wb      = xlrd.open_workbook(filepath)
    sh      = wb.sheet_by_name('Sheet1')
    csvfile = open(filename + '.csv', 'wb')
    wr      = csv.writer(csvfile)

    for row in xrange(sh.nrows):

        if len(sh.cell(row,0).value) > 0:
            wr.writerow(sh.row_values(row))
        else:
            continue

    csvfile.close()

xl_to_csv()
