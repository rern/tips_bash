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
$(( x++ ))        # x=$(( n + 1 )) - increment
$(( x-- ))        # x=$(( n - 1 )) - decrement
let 'x += N'      # x=$(( n + N ))
let 'x -= N'      # x=$(( n - N ))
let 'x *= N'      # x=$(( n * N ))
let 'x /= N'      # x=$(( n / N ))
let 'x %= N'      # x=$(( n % N ))
```

**Float**  
Bash cannot do float.
```sh
printf "%.0f\n" 1.25                        # 1
printf "%.1f\n" 1.25                        # 1.2
printf "%.1f\n" 1.255                       # 1.3
printf "%.2f\n" 1.255                       # 1.25

# with calculation
awk "BEGIN { printf \"%.2f\n\", 1.23 / 3 }" # 0.41 ( 2 decimal round = \"%.2f\n\" )
```
