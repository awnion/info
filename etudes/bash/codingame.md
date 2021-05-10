# Some random codingame: clash of code submitions

### Print binaries example

For some strange reason bash's printf doesn't have bin notation

```bash
seq 10|sed -E 's/\S+/echo "obase=2;&"|bc/eg'|xargs -n1 printf "%06d\n"
# or 
echo "print(f'{"{1..10}":06b}');"|python3

# 000001
# 000010
# 000011
# 000100
# 000101
# 000110
# 000111
# 001000
# 001001
# 001010
```

### Read array and print A[A[i]] for each i

```bash
read n
read -a A
echo `for((i=0;i<$n;i++));do echo -n "${A[$((A[i]))]} ";done`
```

### sed loop example

    cast 1+2*3 -> (((1)+2)*3) then bc

```bash
bc<<<`sed -E ':L;/(^.*[0-9])([^)0-9]|$)/{s//(\1)\2/g;b L}'`
```
