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
Bash cannot do float. Use Python.
```sh
python -c "print(1.23 / 3)"                # 0.41 - float
python -c "print(1 / float(3))"            # 0.33333333333333 - integer
python -c "print(round(1 / float(3), 2))"  # 0.33 - round to 2 decimals
```
