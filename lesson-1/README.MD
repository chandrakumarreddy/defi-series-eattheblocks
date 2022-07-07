# EIP-20: Token Standard

## Specification

### name (OPTIONAL)

```
Returns the name of the token
```

### symbol (OPTIONAL)

```
Returns the symbol of the token
```

### decimals (OPTIONAL) defauls= 10^18

```
Returns the number of decimals the token uses
```

### totalSupply()

```
Returns the amount of tokens in existence.
```

### balanceOf(account)

```
Returns the amount of tokens owned by account.
```

### transfer(to, amount)

```
Moves amount tokens from the caller’s account to to.

Returns a boolean value indicating whether the operation succeeded.

Emits a Transfer event.
```

### allowance(owner, spender)

```
Returns the remaining number of tokens that spender will be allowed to spend on behalf of owner through transferFrom. This is zero by default.

This value changes when approve or transferFrom are called.
```

### approve(spender, amount)

```
Sets amount as the allowance of spender over the caller’s tokens.

Returns a boolean value indicating whether the operation succeeded.

Emits an Approval event.
```

### transferFrom(from, to, amount)

```
Moves amount tokens from from to to using the allowance mechanism. amount is then deducted from the caller’s allowance.

Returns a boolean value indicating whether the operation succeeded.

Emits a Transfer event.
```

## EVENTS

### Transfer(from, to, value)

```
Emitted when value tokens are moved from one account (from) to another (to).

Note that value may be zero.
```

### Approval(owner, spender, value)

```
Emitted when the allowance of a spender for an owner is set by a call to approve. value is the new allowance.
```
