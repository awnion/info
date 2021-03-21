main=interact$f(s[2..]).read
s(p:r)|p>360=p:r
s(p:r)=p:s[x|x<-r,rem x p>0]
f(x:y:r)n|n>y=f(y:r)n
f(x:y:z:r)n|x+z<2*y="STRONG"|x+z>2*y="WEAK"|0<1="BALANCED"