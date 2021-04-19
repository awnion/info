
w,h,m,*o=`dd`.split
l={}
b=(0...h=h.to_i).map{|y|
    o[y].scan(/[A-z]/){|c|l[c]=[$`.size,y]}
    o[y].chars
}
o[h..].each_slice(2){|q,w|
    x,y,u,v=l[q]+l[w]
    (0..s=[x-u,y-v].map(&:abs).max).map{|t|b[y+(v-y)*t/s][x+(u-x)*t/s]=?*}
}

puts b.map &:join
