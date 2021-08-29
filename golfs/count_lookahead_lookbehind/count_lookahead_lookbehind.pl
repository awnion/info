# count how many chars $a in a text such $b$a or $a$b w/o "double counting"
$a=<>=~s/\n//gr;
$b=<>=~s/\n//gr;
# eval regex technique
$r=qr/$a(?=$b)|(?<=$b)$a/;
$_=()=<>=~/$e/g;
print
