library(shiny)
library(tiff)
library(png)
library(jpeg)

# load files
key <- read.table("imagekey.csv", header = TRUE, sep = ',', stringsAsFactors = FALSE)
imagepaths <- file.path("images", key$filename)
nimages <- length(imagepaths)
curdis <- 1

key$label <- paste(key$id, key$name, key$sex)

stdplot <- function(...) {
  plot(
    0, 0, type = 'n', axes = FALSE, 
    xlim = c(0, 1), ylim = c(0, 1),
    xlab = "", ylab = "",
    ...
  )
}

loadimage <- function(imagepath) {
  extension <- sapply(strsplit(imagepaths[1], split = "[.]"), function(x) x[length(x)])
  img <- NULL
  
  if(grepl("jp*g", extension)) {
    img <- jpeg::readJPEG(imagepath)
  } else if(grepl("tif*", extension)) {
    img <- tiff::readTIFF(imagepath)
  } else if(grepl("png", extension)) {
    img <- png::readPNG(imagepath)
  } else {
    warning(paste("warning unable to open", imagepath))
  }
  
  img
}

displayimage <- function(i) {
  img <- loadimage(i)
  r <- as.raster(img[,,1:3])
  stdplot(asp = 1)
  rasterImage(r, 0, 0, 1, 1)
}

ui <- fluidPage(
  actionButton('go', 'go'), 
  actionButton('tell', 'tell!'),
  textOutput("answer"),
  mainPanel(
    plotOutput("flashcard", width = 800, height = 800),
  )
)

server <- function(input, output, session) {
  curdis <<- sample(nimages, 1)
  output$answer <- renderText({"guess!"})
  output$flashcard <- renderPlot({
    displayimage(imagepaths[curdis])
  })

  observeEvent(input$go, {
    curdis <<- sample(nimages, 1)
    output$answer <- renderText({"guess!"})
    output$flashcard <- renderPlot({
      displayimage(imagepaths[curdis])
    })
  })
  
  observeEvent(input$tell, {
    output$answer <- renderText({key$label[curdis]})
  })
  
}

shinyApp(ui, server)