# some random codingame: clash of code submitions

###

read n
read -a A
echo `for((i=0;i<$n;i++));do echo -n "${A[$((A[i]))]} ";done`


###

# sed loop example
# cast 1+2*3 -> (((1)+2)*3) then bc
bc<<<`sed -E ':L;/(^.*[0-9])([^)0-9]|$)/{s//(\1)\2/g;b L}'`
