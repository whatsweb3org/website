---
title: 状态可变性
last_update: 

    date: 1/27/2023

---

# 状态可变性

合约函数通常需要修改区块链的状态，例如转账，修改状态变量，触发事件等等。但是有一小部分函数只是起辅助作用的，你不希望它们去修改合约的状态。为了提高合约安全性，你可以使用状态可变性修饰符（`state mutability modifier`）来修饰你的函数。这样可以显示的表示你不希望改变区块链状态。

Solidity 提供了三个状态可变性修饰符：

![picture 1](assets/state-mutability/1674825720506.png)  


- `view` 函数只能查询合约状态，不能更改合约状态。简单来讲就是 read only
- `pure` 既不能查询，也不能修改函数状态。只能使用函数参数进行简单计算并返回结果
- `payable` 允许函数接受 Ether 转账。默认情况下是不能接受转账的，如果你需要接受转账，那么必须指定函数为 payable

## 怎样才算修改状态

我们上面一直在谈论的修改状态究竟是什么含义？到底什么行为才算是修改状态？目前，有8种行为被任务是修改了合约状态：

1. 修改状态变量
2. 触发事件
3. 创建其他合约
4. 使用 `selfdestruct` 来销毁合约
5. 通过函数调用发送以太币
6. 调用未标记为 `view` 或 `pure` 的任何函数
7. 使用低级别调用，如 `transfer`, `send`, `call`, `delegatecall` 等
8. 使用包含某些操作码的内联汇编

## 怎样才算查询状态

1. 读取状态变量
2. 访问  `address(this).balance` 或者 `<address>.balance`
3. 访问 `block` , `tx` , `msg` 的成员
4. 调用未标记为 `pure` 的任何函数
5. 使用包含某些操作码的内联汇编 

## view 函数

如果你的函数承诺不会修改合约状态，那么你应该为它加上 `view` 修饰符。如下所示：

:::tip `view` 函数

```solidity

uint count;
function GetCount() public view returns(uint) {
    return count;
}

```

:::

## pure 函数

如果你的函数承诺不需要查询，也不需要修改合约状态，那么你应该为它加上 `pure` 修饰符。如下所示：

:::tip `pure` 函数

```solidity

function add(uint lhs, uint rhs) public pure returns(uint) {
    return lhs + rhs;
}

```

:::

## payable 函数

函数默认是不能接受 Ether 转账的。如果你的函数需要接受转账，那么你应该为它加上 `payable` 修饰符。如下所示：

:::tip `payable` 函数

```solidity

function deposit() external payable {
    // deposit to current contract
}

```

:::