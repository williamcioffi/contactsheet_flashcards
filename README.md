# contactsheet_flashcards

expects a key file csv named imagekey.csv
expects a directory called images/ with png tiff or jpeg/jpg.

imagekey.csv should have minimum three columns
filename (actual filename not path) 
id
name
sex

id, name, sex get pasted to form the label (answer)

if you don't like this hard coded setup then just edit the first couple of linesthis is for me this isn't really for you.

requires
library(tiff)
library(jpeg)
library(png)
library(shiny)
