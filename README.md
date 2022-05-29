# contactsheet_flashcards

- expects a key file csv named `imagekey.csv`
- expects a directory called `images/` with png, tiff, or jpeg/jpg files.

`imagekey.csv` should have minimum four columns (others are ignored):

- `filename` (just name not path)
- `id`
- `name`
- `sex`

`id`, `name`, `sex` get pasted together to form `label` (the answer). if you don't like this hard coded setup then just edit the first couple of lines... this is for me this isn't really for you. Images in the directory that aren't in `imagekey.csv` are ignored.

requires:

- `library(tiff)`
- `library(jpeg)`
- `library(png)`
- `library(shiny)`

to run:

after making sure you have appropraitely formatted `imagekey.csv` and `images/` just source the entire `.r` file.