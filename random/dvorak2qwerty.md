
## Bash

```bash
tr "\-=qwertyuiop[]asdfghjkl;'zxcvbn,./" "[]',.pyfgcrl/=aoeuidhtns\-;qjkxbwvz"
```

## Ruby

```ruby
$><<`dd`.tr(
"-=qwertyuiop[]asdfghjkl;'zxcvbn,./",
"[]',.pyfgcrl/=aoeuidhtns\\-;qjkxbwvz")
```

## Python

```python
print(input().translate(dict(zip(
b"-=qwertyuiop[]asdfghjkl;'zxcvbn,./",
b"[]',.pyfgcrl/=aoeuidhtns-;qjkxbwvz"))))
```
