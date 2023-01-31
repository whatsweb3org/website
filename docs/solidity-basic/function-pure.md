---
title: Solidity pure函数
last_update:

    date: 2023-01-29

---

# Solidity pure 函数

纯函数（*pure function*）是函数式编程的一个重要概念。在程序设计中，若一个函数符合以下要求，则它可能被认为是纯函数：

1. 相同的输入值时，需产生相同的输出
2. 函数的输出和输入值以外的其他隐藏信息或状态无关，也和由I/O设备产生的外部输出无关
3. 不能有语义上可观察的函数副作用，诸如“触发事件”，使输出设备输出，或更改输出值以外的内容等

简单而言就是：**纯函数不读不写，没有副作用**。使用纯函数可以提高代码安全性，避免出现与预期不符的副作用。

如果你的函数承诺不需要查询，也不需要修改合约状态，那么你应该为它加上 `pure` 修饰符。如下所示：

:::tip `pure` 函数

```solidity

function add(uint lhs, uint rhs) public pure returns(uint) {
    return lhs + rhs;
}

```

:::

被标记为 `pure` 的函数，如果你在函数体查询或者修改合约状态，编译器都会直接报错。

## 怎样才算查询合约状态

Solidity 有5种行为被认为是查询了合约状态：

1. 读取状态变量
2. 访问  `address(this).balance` 或者 `<address>.balance`
3. 访问 `block` , `tx` , `msg` 的成员
4. 调用未标记为 `pure` 的任何函数
5. 使用包含某些操作码的内联汇编

## 怎样才算修改合约状态

Solidity 有8种行为被认为是修改了合约状态：

1. 修改状态变量
2. 触发事件
3. 创建其他合约
4. 使用 `selfdestruct` 来销毁合约
5. 通过函数调用发送以太币
6. 调用未标记为 `view` 或 `pure` 的任何函数
7. 使用低级别调用，如 `transfer`, `send`, `call`, `delegatecall` 等
8. 使用包含某些操作码的内联汇编
