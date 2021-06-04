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
}
LABEL = "Number of Columns ".nres
set label 10 at -1,2.5 LABEL front center

# plotting
plot x**3-2*x**2+2  #the "plot" command plots the function on gnuplots plotting terminal/window. This command also allows us to see all the set objects

# animate column resolution (nres) value
cd 'C:\Users\aa82637\Videos\Gnuplot animation outputs'
set terminal gif animate delay 25  #everything plotted will now be turned into a gif frame
set output "Column demonstration animation1.gif"  #name of the gif file
do for [nres=4:60] {
    xwidth = xbase/nres
    do for [n=1:nres] {
        counter = x1 + xwidth*n
        set obj n rect from (counter-xwidth),f(counter-xwidth) to counter,0 fc rgb "purple"
        n=n+1
        }
    LABEL = "Number of Columns ".nres
    set label 10 at -1,2.5 LABEL front center
    plot x**3-2*x**2+2
    }
set terminal window; replot

