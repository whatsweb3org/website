---
title: 整型 
---

# 整型

整型（*integer*）是不包含小数部分的数值型数据，正整数，负整数和0等都属于整型的范畴。比如账户余额，Gas，持有的Token数等都是用整型表示。Solidity的整型有两种：

- `intM`   有符号整型
- `uintM` 无符号整型

其中`M`为8到256，步长为8。例如有`int8, int16, int32 … int256`。也有`uint8, uint16, uint32 … uint256`等等。其中，`int8/uint8`占8bits，`int16/uint16`占16bits，依此类推。

## 运算符

### 算术运算符

算术运算符可以用来进行四则运算，得到的结果是整型。

- `+`（加）
- `-`（减）
- `*`（乘）
- `/`（除）
- `%`（取模）
- `**`（幂）
- `<<`（左移）
- `>>`（右移）

:::tip 算术运算
```solidity
假设a=5 , b=2  类型均为uint8

a+b  : 7
a-b  : 3
a*b  : 10
a/b  : 2
a%b  : 1
a**b : 25
a<<b : 20
a>>b : 1
```
:::

### 比较运算符

通过比较运算符，我们可以比较两个变量的数量大小关系，以及变量是否相等。比较运算符得到的结果是布尔值。

- `<=`（小于等于）
- `<`  （小于）
- `==`（等于）
- `!=`（不等于）
- `>=`（大于等于）
- `>`  （大于）

:::tip 比较运算
```solidity
假设a=5 , b=2  类型均为uint8

a<=b : false
a<b  : false
a==b : false
a!=b : true
a>=b : true
a>b  : true
```
:::

### 位运算符

位运算符用来对二进制位进行操作，其执行结果是整形。

- `&`（按位与）
- `|`（按位或）
- `^`（按位异或）
- `~`（按位取反）

:::tip 位运算
```solidity
假设a=5 , b=2  类型均为uint8

a&b : 0
a|b : 7
a^b : 7
~a  : 250
```
:::

## 整型溢出

Solidity整型运算结果可能出现溢出的情况，导致合约运行出现不符合预期的行为。在旧版本的Solidity中你可能会使用Openzeppelin的[SafeMath](https://docs.openzeppelin.com/contracts/2.x/api/math)来防止整型溢出。不过在版本 >= 0.8.0 的Solidity，一旦出现整型溢出，整个transaction都会被revert。所以Solidity在整型溢出方面是安全的。（当然，前提是你使用了版本 >= 0.8.0 的Solidity）

如下面的例子所示，`uint8`能够储存的最大正整数为255，如果再加1，那么就会产生整型溢出。如果你执行下面的函数，Remix Terminal会输出：`call to Integer.overflow errored: VM error: revert`。这意味着整个transaction已经被revert。

:::tip 整型溢出
```solidity
// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.9;

contract Integer {
	function overflow() public view {
	    uint8 a = 255;
	    a = a+1; //整型溢出，整个transaction revert
	    console.log("a=%s", a);
	}
}
```
:::