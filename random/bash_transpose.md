```
3
1 2 3
3 2 1
4 4 4

to

1 3 4
2 2 4
3 1 4
```

```bash
read n
a=`dd`
for((i=0;i++<$n;)){
cut -d\  -f$i <<<$a|xargs
}
```
