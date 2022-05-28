# contactsheet_flashcards

expects a key file csv named imagekey.csv
expects a directory called images/ with png tiff or jpeg/jpg.

imagekey.csv should have minimum three columns
filename with the name not the path of the file
id
name

id and name get pasted to form the label (answer)

requires
library(tiff)
library(jpeg)
library(png)
library(shiny)
