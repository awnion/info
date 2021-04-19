
```bash
tr "\-=qwertyuiop[]asdfghjkl;'zxcvbn,./" "[]',.pyfgcrl/=aoeuidhtns\-;qjkxbwvz"
```

```ruby
$><<`dd`.tr(
"-=qwertyuiop[]asdfghjkl;'zxcvbn,./",
"[]',.pyfgcrl/=aoeuidhtns\\-;qjkxbwvz")
```

```python
print(input().translate(dict(zip(
b"-=qwertyuiop[]asdfghjkl;'zxcvbn,./",
b"[]',.pyfgcrl/=aoeuidhtns-;qjkxbwvz"))))
```
