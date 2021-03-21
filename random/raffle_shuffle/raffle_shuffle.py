"""

Calculate minimum steps of raffle shuffle (alternating shuffle)
of a deck of cards to get to max degree of disorder.

Disorder of a = sum(abs(i-a[i]) for i in range(...))

"""

def steps(n):
    deck = [*range(n)]
    p = []
    for _ in range(n):
        deck = deck[::2] + deck[1::2]
        p += sum(abs(i-deck[i]) for i in range(n)),
    return p.index(max(p))

print(*(steps(i) for i in range(2, 30)))
