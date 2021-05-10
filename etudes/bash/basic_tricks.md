based on codingame submissions

## Print binaries example

For some strange reason bash's printf doesn't have bin notation

```bash
seq 10|sed -E 's/\S+/echo "obase=2;&"|bc/eg'|xargs -n1 printf "%06d\n"
# or 
echo "print(f'{"{1..10}":06b}');"|python3
```

    000001
    000010
    000011
    000100
    000101
    000110
    000111
    001000
    001001
    001010

---

## Read array and print `A[A[i]]` for each i

```bash
read n
read -a A
echo `for((i=0;i<$n;i++));do echo -n "${A[$((A[i]))]} ";done`

# or shorter

read n
read -a A
for((;i<$n;i++)){
    echo ${A[A[i]]}
} | xargs

```

---

## `sed` loop example

    cast 1+2*3 -> (((1)+2)*3) then bc

```bash
bc<<<`sed -E ':L;/(^.*[0-9])([^)0-9]|$)/{s//(\1)\2/g;b L}'`
```

---

## Matrix Transpose

    3
    1 2 3
    3 2 1
    4 4 4

    to

    1 3 4
    2 2 4
    3 1 4

```bash
read n
a=`dd`
for((i=0;i++<$n;)){
cut -d\  -f$i <<<$a|xargs
}
```

---
