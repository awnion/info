n=int(input())
n=1<<n

print(*['.   .']*n)
print(*['|_ _|']*n)
u=2
n//=2
while n>0:
    print(end=' '*u)
    u = 2*u + 1
    print((' '*u).join([f'|{" ":_^{u}}|']*n))
    n//=2

print(' '*u+'|')


