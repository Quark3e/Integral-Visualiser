# function
f(x) = x**3-2*x**2+2
F(x) = ((x**4)/4-(2*(x**3))/3+2*x)  #Primitive function to f(x). NOTE: Change primitive function if f(x) is changed


# limits (the number that goes above the integral symbol (x2) and the number that goes below the integral sumbol)
x1 = -0.5
x2 = 1.5


# definitions
nres = 4  #nres is the resolution, i.e the number of columns in the integral
nresmax = 80  #the end nres value for animating a gif
xbase = x2 - x1  #xbase is the base of all the columns combined on the x axis
xwidth = xbase/nres  #width of each column
counter = x1 + xwidth*i  #used for calculating each column/rectangle as it set the x value on the x axis.

RealIntegralValue = F(x2) - F(x1)
round(x) = x - floor(x) < 0.5? floor(x) : ceil(x)  #rounding the numbers. floor rounds down the number if x<0.5. ceil rounds up x if x>0.5
round2(x, n) = round(x*10**n)*10.0**(-n)  #rounding the numbers with n decimals.


# labeling/details
set xrange [-2:2]
set yrange [0:3]
set title "Integral area representation"
set grid


# plot preparation
n = 1
do for [n=1:nres] {
    counter = x1 + xwidth*n
    set obj n rect from (counter-xwidth),f(counter-xwidth) to counter,0 fc rgb "purple" 
}
TotalAreaText = round2(TotalArea, 4) #rounding up the calculated area to the 4th decimal
RealIntegral = round2(RealIntegralValue, 4) #rounding up the actual integral value to the 4th decimal

set label 1 sprintf("Area of Columns: %.3f\n \nActual Integral Value %.3f\n \nNumber of Columns: %.3f", TotalAreaText, RealIntegral, nres) #label for the area, integral and the nres value
set label 1 at -1.1,2.75 front center


# plotting
plot x**3-2*x**2+2  #the "plot" command plots the function on gnuplots plotting terminal/window. This command also allows us to see all the set objects


# animate column resolution (nres) value
cd 'C:\Users\aa82637\Videos'
set terminal gif animate delay 25  #everything plotted will now be turned into a gif frame
set output "Column demonstration animation.gif"  #name of the gif file
do for [nres=4:nresmax] {
    xwidth = xbase/nres
    do for [n=1:nres] {
        counter = x1 + xwidth*n
        set obj n rect from (counter-xwidth),f(counter-xwidth) to counter,0 fc rgb "purple"
        n=n+1
        }
    TotalAreaText = round2(TotalArea, 4)
    RealIntegral = round2(RealIntegralValue, 4)
    set label 1 sprintf("Area of Columns: %.3f\n \nActual Integral Value %.3f\n \nNumber of Columns: %.3f", TotalAreaText, RealIntegral, nres)
    set label 1 at -1.1,2.75 front center

    plot x**3-2*x**2+2
    }
set terminal window; replot

