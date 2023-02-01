---
title: Solidity while循环
last_update:

    date: 2023-01-21

---

# Solidity while循环

想象一下，如果我们要计算 `1+2+3` 的和，这很简单：

```solidity
uint256 sum = 1+2+3;
```

但是如果我们要计算 `1+2+3+…+100000` 呢。直接在合约里面写出这个表达式是不可能的。为了避免重复劳动，我们就可以用到循环。Solidity提供了三种循环：

- [「for 循环」](for)
- [「while 循环」](while)
- [「do-while 循环」](do-while)

本节我们将会介绍 `while` 循环。

## while循环语法

Solidity的 `while` 循环的语法与C语言，Javascript基本相同，其语法如下：

```solidity
while (test-statement) {
    // 循环体
}
```

我们可以看到while循环里面有两个表达式：

* **test-statement**
* **循环体**

`while` 循环在每次循环开始前，首先判断 `test-statement` 是否为 `true` 。如果是则把循环体执行一遍，如果 `test-statement` 为 `false` ，那么就退出循环并继续执行余下的代码。通常情况下你都需要在循环体里面修改循环控制变量，使得 `test-statement` 在适当的时候执行结果为 `false` 而终止循环。

## for循环与while循环的比较

如果你有先学习了我们的 `for` 循环教程，你应该会留意到其中有一个示例展示了 `for` 循环的控制语句里面只剩下 `test-statement` ，如下面所示：

:::tip `for` 循环，从1加到n

```solidity
function sumToN(uint16 n) public pure returns(uint16) {
    uint16 sum = 0;
    uint16 i = 1; 
    for(; i <= n; ) { // 循环控制语句只剩下test-statement: i <= n
        sum += i;
        i++; // 修改循环变量的值
    }
    return sum;
}
```

:::

其实这种形式就类似于 `while` 循环，我们可以稍作修改就变成 `while` 循环：

:::tip `while` 循环，从1加到n

```solidity
function sumToN(uint16 n) public pure returns(uint16) {
    uint16 sum = 0;
    uint16 i = 1; 
    while(i <= n) { //只改了这一行
        sum += i;
        i++; // 修改循环变量的值
    }
    return sum;
}
```

:::

至于什么时候应该使用 `for` 循环，什么时候使用 `while` 循环，其实没有硬性规定。更多的是取决于你觉得哪种循环会让代码看起来更整洁。不同的场景可能有不同的选择。

通常的做法是如下这样（非硬性规定）：

* 如果有明确的初始和终止条件，那么建议使用`for`循环，这样代码看起来会更清晰
* 如果没有明确的初始和终止条件，并且`test-statement`的条件判断比较复杂，那么就建议使用`while`循环

:::tip 有明确的初始和终止条件，使用 `for` 循环

```solidity
for(uint16 i = 1; i <= n; i++) {
    // 代码块
}
```

:::

:::tip 没有明确的初始和终止条件，条件判断较复杂，使用 `while` 循环

```solidity
while(isEven(x) && !isZero(x)) {
    // 代码块
}
```

:::

## 小结
