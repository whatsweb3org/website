---
title: for循环 
---

# for循环

如果我们要计算`1+2+3`的和，这很简单：

```solidity
uint256 sum = 1+2+3;
```

但是如果我们要计算`1+2+3+…+100000`呢。直接在合约里面写出这个表达式是不可能的。为了避免重复劳动，我们就可以用到循环。Solidity提供了三种循环：

- **`for`循环**
- **`while`循环**
- **`do while`循环**

本节我们将会介绍`for`循环。

# for循环语法

Solidity的`for`循环的语法与C语言基本相同，其语法如下：

```solidity
for (init_statement; test_statement; iteration_statement) {
    // 要执行的代码块
}
```

for循环有三个控制语句：

- `init_statement` 用来在循环开始之前初始化循环变量，只执行一次
- `test_statement` 用来判断循环是否已经满足退出条件，每一轮循环都会执行一次判断
- `iteration_statement` 用来在每一轮循环执行完后（也就是执行完代码块后），改变循环变量的值

例如下面的示例中我们可以看到`init_statement`是 `i=1` ， `test_statement`是 `i<=10` ， `iteration_statement`是 `i++`。

```solidity
for(uint16 i = 1; i <= 10; i++) {
    // init_statement是 i=1 ; test_statement是 i<=n ; iteration_statement是 i++
    sum += i;
}
```

比如上面的例子中，`init_statement`定义并初始化了循环变量`i=1`。然后`test_statement`则判断循环变量`i`是否还是小于等于10，如果是就继续执行，如果不是就退出循环。`iteration_statement`则是在每轮循环给循环变量`i`加1。

# for循环示例

下面5个示例的逻辑都是一样的：**计算从1加到n的总和**。这些示例展示了你可以使用的for循环的不同形式来实现一样的功能。

:::tip 一个典型的for循环
下面是一个典型的for循环，计算从1加到n的总和。

```solidity
function sum1(uint16 n) public pure returns(uint16) {
    uint16 sum = 0;
    uint16 i;
    for(i = 1; i <= n; i++) {
        // init_statement是 i=1 ; test_statement是 i<=n ; iteration_statement是 i++
        sum += i;
    }
    return sum;
}
```
:::

:::tip 在`init_statement`定义并初始化变量
```solidity
function sum2(uint16 n) public pure returns(uint16) {
    uint16 sum = 0;
    for(uint16 i = 1; i <= n; i++) { //你可以在init_statement里面定义并初始化变量i
        sum += i;
    }
    return sum;
}
```
:::

:::tip `init_statement`可以移动到for循环之前
```solidity
function sum3(uint16 n) public pure returns(uint16) {
    uint16 sum = 0;
    uint16 i = 1; //init_statement被移动到这里了
    for(; i <= n; i++) { //你可以将init_statement移到for循环之前
        sum += i;
    }
    return sum;
}
```
:::

:::tip `iteration_statement`可以移动到for循环内部
```solidity
function sum4(uint16 n) public pure returns(uint16) {
    uint16 sum = 0;
    uint16 i = 1; //init_statement被移动到这里了
    for(; i <= n; ) { //你可以不写init_statement， 也不写iteration_statement
        sum += i;
        i++; // iteration_statement的i++被移到这里了
    }
    return sum;
}
```
:::

:::tip 所有逻辑都可以在for循环的代码块里实现
```solidity
function sum5(uint16 n) public pure returns(uint16) {
    uint16 sum = 0;
    uint16 i = 1; //init_statement被移动到这里了
    for(;;) { //你可以init_statement, test_statement，iteration_statement都不写，全部逻辑实现在代码块里面
        if(i > n){ // 这个条件语句实现了test_statement的功能
            break;
        }
        sum += i;
        i++; // iteration_statement的i++被移到这里了
    }
    return sum;
}
```
:::