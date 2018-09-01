if(!require(imager)) install.packages("imager")
library(imager)

tmpF <- tempfile(fileext=".png")

write.letter = function(input.text, img.path, font = NULL){
  png(img.path)
  plot.new()
  text(0.5,0.5,input.text, family = font, cex = 3 )
  dev.off()
}

write.letter("ciao", img.path = tmpF)



scatter.img = function(img.path, n.points, gray.thr=0.5, plain = TRUE){
  
  img    = load.image(img.path)
  img.df = as.data.frame(img)
  
  black.pixels = subset(img.df, value < gray.thr)
  
  if(plain) pixel.sample = seq.int(1, nrow(black.pixels), length.out = n.points) 
  else      pixel.sample = sample(1:nrow(black.pixels), size = n.points)
  
  out.df = black.pixels[pixel.sample, 1:2] 

  return(out.df)
}


# clean
plot(scatter.img(tmpF, 1100), pch = 15, cex = 1, bty = "n", axes = F, xlab = "", ylab = "")

# noisy
plot(apply(scatter.img(tmpF, 1100, plain= F), 2, jitter, amount = 1), pch = 20, cex = 1, bty = "n", axes = F, xlab = "", ylab = "")

# plot(scatter.img("~/Downloads/golf_01.png", 500), pch = ".", cex = 2, bty = "n", axes = F, xlab = "", ylab = "")


# Prettify shit -----------------------------------------------------------


install.packages('extrafont')
library(extrafont)

# import all fonts already installed on your computer:
font_import()

# check what you have:
fonts()


plot.new()
text(0.5,0.5,"AAAA", family = "Comic Sans MS", cex = 3 )


write.letter("ciao Akis", img.path = tmpF, font = "Comic Sans MS")
# clean
plot(scatter.img(tmpF, 1100), pch = 15, cex = 1, bty = "n", axes = F, xlab = "", ylab = "")

# noisy
plot(apply(scatter.img(tmpF, 1500, plain= F), 2, jitter, amount = 1), pch = 20, cex = 1, bty = "n", axes = F, xlab = "", ylab = "")



