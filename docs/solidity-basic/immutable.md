---
title: immutable 
last_update:

    date: 2023-01-29

---

# immutable

Solidity 中的 `immutable` 和 `constant` 类似，都是用来定义不能二度改变的变量。不过 `immutable` 的限制比 `constant` 稍微宽松一点。我们在 [「constant」](constant) 一节提到： `constant` 变量必须在定义的时候就初始化，其他任何地方都不能再赋值。而 `immutable` 的限制是：只允许初始化（赋值）一次，并允许在构建函数中再做初始化。

也就是说， `immutable` 变量允许：

1. 在声明的时候初始化
2. 或者在构建函数初始化

所以 `immutable` 与 `constant` 的最大区别就是，它允许在构建函数中才做初始化。

## immutable 变量声明

正如上面所述，我们可以在声明的时候对 immutable 变量初始化，或者在构建函数初始化。

:::tip 声明时初始化

```solidity
uint immutable n = 5;
```

:::

:::tip 在构建函数初始化

```solidity
uint immutable n;

constructor () {
    n = 5;
}
```

:::

注意**不能初始化两次**：

:::tip 不能初始化两次

```solidity
uint immutable n = 0;

constructor () {
    n = 5; // 不合法，已经在声明时初始化过了
}
```

:::

注意**不能在函数中初始化**：

:::tip 不能在函数初始化 `immutable` 变量

```solidity
uint immutable n;

function f() public {
    n = 5; // 不合法， 不能在函数初始化 immutable 变量 
}
```

:::

## immutable 变量不能更改

:::tip `immutable` 变量不能更改

```solidity
uint immutable n = 0; // 初始化为0

function f() public {
    n = 5; // 不合法，immutable 变量不能更改
}
```

:::
