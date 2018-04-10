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
awk "BEGIN { printf \"%.2f\n\", 1.23 / 3 }" # 0.41 ( 2 decimal round = \"%.2f\n\" )
printf "%.*f\n" 0 1.25                      # 1
printf "%.*f\n" 1 1.25                      # 1.2
printf "%.*f\n" 1 1.255                     # 1.3  
```
