# Read def.asm file and convert it to a .inc.pas file
# v1.0.2

import sys
import ntpath

#print (sys.argv)

filename = sys.argv[2].replace("'",'')
outputPath = sys.argv[1].replace("'",'')

prefix = ''
if len(sys.argv) >= 4:
  prefix = sys.argv[3].replace("'",'').strip()

with open(filename+'.asm') as file_in:
    lines = []
    firstConst = True

    for line in file_in:
         # move comments into a separate var
         split = line.split(';')
         line = split[0]
         if len(split) > 1:
             comments = ''
             i = 1
             while i < len(split):
                 comments = comments + '//' + split[i]
                 i += 1
         else:
             comments = ''

         # semicolon is needed for const expression
         if line.find('=') != -1:
             line = '  ' + prefix + line.rstrip() + ';'
             if firstConst:
                firstConst = False
                lines.append('const\n')

         # comment .byte and .word definitions
         if (line.find('.byte') != -1) or (line.find('.word') != -1):
                 resultLine = '//' + line
         else:
                 # check for .include
                 if line.find('.include ') != -1:
                     line = line.replace(".include", "{$include")
                     line = line.replace('.asm"', '.inc.pas"}')
                     line = line.replace('"', "'")
                     resultLine = line
                 else:
                     resultLine = line


         if len(resultLine) > 0:
            resultLine = resultLine + '  ' + comments
         else:
             if not firstConst:
                resultLine = '  ' + resultLine
             resultLine = resultLine + comments

         lines.append(resultLine.rstrip() + '\n')

# writing to file 
outputFilename = ntpath.basename(filename) + '.inc.pas'
file1 = open(outputPath + '\\' + outputFilename, 'w') 
file1.writelines(lines) 
file1.close() 


with open("includes.pas", "a") as file_object:
    file_object.write("{$include '" + outputFilename + "'}\n")