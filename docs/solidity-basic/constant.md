---
title: Solidity constant
last_update:

    date: 2023-01-21

---

# Solidity constant

Solidity 中的 `constant` 关键字用来定义常量。也就是在编译期间就确定值，以后都不能再改变的变量。因为 `constant` 是不能更改的，所以使用它可以提高合约安全性。例如假设你写了一个借贷合约，要求抵押率为 3 倍，同时你预期这个比率永远都不会改变的。那么你可以把这个比率定义为一个 `constant` 变量。

```solidity
uint constant ratio = 3;
```

## constant 的值必须能在编译期间确定

`constant` 变量的值必须能在编译期间确定, 否则会返回编译错误。所以你不能用普通变量给 constant 变量赋值。

:::tip `constant` 的值必须能在编译期间确定 

```solidity
uint a = 3;
uint constant ratio = a; // 不合法，不能用普通变量给 `constant` 赋值

uint constant b; // 不合法，必须在声明时就赋值
```

:::

## constant 不能更改

`constant` 必须在声明的时候赋值，不能在任何地方为其赋值

:::tip `constant` 不能更改

```solidity
uint constant ratio = 3;

constructor() {
    ratio = 0; // 不合法
}

function f() public {
    ratio = 0; // 不合法
}
```

:::
