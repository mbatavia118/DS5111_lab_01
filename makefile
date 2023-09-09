#Make will run the first command if none is specified

#Show the makefile
default:
	@cat makefile
#The above space is a tab - will not work with spaces

#Download data
synthetic_data.csv:
	wget https://gist.githubusercontent.com/Niarfe/25100a860cbb660150a3fec87378d8ac/raw/b280768fc7ad782c65f0e714017af2f05ba88ef2/synthetic_data.csv

#Plot column 2
square_wave.png:
	gnuplot -e "set datafile separator ','; set term png; set output 'square_wave.png'; plot 'synthetic_data.csv' using 1:2 with lines"

#Plot column 3
fibonachi.png:
	gnuplot -e "set datafile separator ','; set term png; set output 'fibonachi.png'; plot 'synthetic_data.csv' using 1:3 with lines"


#Remove data and image files
clean:
	rm synthetic_data.csv || true
	rm square_wave.png || true
	rm fibonachi.png || true

#PHONY file to generate all images
.PHONY: all_images

all_images: synthetic_data.csv square_wave.png fibonachi.png
