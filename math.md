Math
---

**Integer**
```sh
$(( n1 + n2 ))
$(( n1 - n2 ))
$(( n1 * n2 ))
$(( n1 / n2 ))
$(( n1 % n2 ))    # modulus
$(( n1 ** n2 ))   # exponential

x=n
(( x++ ))         # x=$(( n + 1 )) - increment
(( x-- ))         # x=$(( n - 1 )) - decrement
let 'x += N'      # x=$(( n + N ))
let 'x -= N'      # x=$(( n - N ))
let 'x *= N'      # x=$(( n * N ))
let 'x /= N'      # x=$(( n / N ))
let 'x %= N'      # x=$(( n % N ))
```

**Round**
```sh
$(( N / n ))           # round down - by default
$(( ( N + n-1 ) / n )) # round up
$(( ( N + n/2 ) / n )) # round nearest
```

**Float**  
Bash cannot do float. (`perl` - slower, `python` `jq` - much slower)
```sh
# awk + printf
awk 'BEGIN { printf "%.2f", 1 / 3 }'     # 0.33

# perl + printf - a bit slower and longer
printf '%.3f' $( perl -e "print 1 / 3" ) # 0.333
# perl - no decimal limit - shorter but still slower
perl -e "print 1 / 3"                    # 0.333333333333333

# printf - no calculation - \n for newline ending
printf '%.0f' 1.25      # 1
printf '%.1f' 1.25      # 1.2
printf '%.1f' 1.255     # 1.3
printf "%.2f\n" 1.255     # 1.25
```
