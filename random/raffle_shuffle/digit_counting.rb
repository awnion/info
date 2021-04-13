# Ruby
v,n,d=*$<;c=t=0;v.to_i.times{|x|t+=y=x.to_s.count d;c+=1if y>0};p c;p t

# Ruby?
# `tr -d \\ `=~/\n.*\n/;['','-o'].map{|i|$><<`seq 0 $((#$`-1))|grep #{i} [#$']|wc -l`}

# how about Bash? 
# read v;read;d=`tr -d ' '`;for i in -n -o;do seq 0 $((v-1))|grep $i [$d]|wc -l;done
