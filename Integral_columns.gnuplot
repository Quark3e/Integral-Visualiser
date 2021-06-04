#
# Explaination:
# This code is just an in depth visualisation "tool" where you yourself can tinker with the values. This whole idea came from 3Blue1Browns' video:
# "Integration and the fundamental theorem of calculus | Chapter 8, Essence of calculus". That videos does this MUCH better. This is just a fun concept.
# I highly recommend you watch his video(s) if you actually want to learn integrals or understand it. What i've done is just for the sake of "fun"
#
# This code creates columns/rectangles between the x axis and it's corresponding point on the function
# The columns will overlap (and underlap) the function by a bit but the point is to demonstrate that for higher nres values (explained later on)
# the closer the sum area of all rectangles will be to the actual integral value.
#
# This code generates columns with the "set object" command in gnuplot and generates each one with a "do for" loop 
# (simpler version of a "for" loop where the iterations are already set default to 1) 
# where in each iteration it creates a rectangle by from one point at the function line and the opposite point at the x axis.
# (command for generating each rectangle: 
# set object <index> rectangle from <point coords at function> to <opposite point coords of rectangle on the x axis> <fillcolor> rgb "<color>" )
# note: the "set object" command sets several objects/columns, each represented as an seperate object/entity defined by its <index>


# function
f(x) = x**3-2*x**2+2

# limits (the number that goes above the integral symbol (x2) and the number that goes below the integral sumbol)
x1 = -0.5
x2 = 1.5

# definitions
nres = 4  #nres is the resolution, i.e the number of columns in the integral

xbase = x2 - x1  #xbase is the base of all the columns combined on the x axis

xwidth = xbase/nres  #width of each column

counter = x1 + xwidth*i  #used for calculating each column/rectangle as it set the x value on the x axis.

# labeling/details
set xrange [-2:2]
set yrange [0:3]
set title "Integral area representation"

# plot preparation
n = 1
do for [n=1:nres] {
    counter = x1 + xwidth*n
    set obj n rect from (counter-xwidth),f(counter-xwidth) to counter,0 fc rgb "purple" 
    #I describe the corners of each rectangle/column with a counter variable and xwidths. The "counter" variable starts at x1 (the start of the limit)
    # + xwidth (the thickness of each column).
    # So for the top left corner it subtracts xwdith as "counter" will naturally be located on the right side corner) and sets the x coord as (counter-xwidth) and y coord as f(counter-xwidth)
}

# plotting
plot x**3-2*x**2+2  #the "plot" command plots the function on gnuplots plotting terminal/window. This command also allows us to see all the set objects



# A cool thing with gnuplot is that it has a gif terminal, where it can generate a gif with different plots.
# The code below shows how to create a gif where each frame is an nres value between (in this case) 4 and 60. So it will have 56 frames
# with each one having a certain nres value. Each frame is created with "plot" under a second/outer "do for" loop. Where each iterations in this
# loop generates a full image with all rectangles all set.
# The nres value increases with each "do for" iteration so the number of columns/rectangles
# are increases.
# So after each column iteration sequence it plots the function again, creating each gif frame.
# the "set terminal window; replot" at the end is just to force the gif generator to hurry as sometimes it glitches and slows down.

# to animate column resolution value

cd 'C:\Users\aa82637\Videos\Gnuplot animation outputs'
set terminal gif animate delay 16
set output "Column demonstration animation1.gif"
do for [nres=4:60] {
    xwidth = xbase/nres
    do for [n=1:nres] {
        counter = x1 + xwidth*n
        set obj n rect from (counter-xwidth),f(counter-xwidth) to counter,0 fc rgb "purple"
        n=n+1
        }
    
    plot x**3-2*x**2+2
    }
set terminal window; replot
