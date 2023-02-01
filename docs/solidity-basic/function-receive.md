---
title: Solidity receive函数
last_update:

    date: 2023-01-29

---

`receive` 函数是 Solidity 中的一种特殊函数，它主要被用来接收 Ether 转账。另外还有一个 [fallback](function-fallback.md) 函数也可以用来接收 Ether 转账，下一节我们会介绍。

:::caution 要注意 Ether 转账和 ERC20 代币转账的区别

Ether 转账时所转的是原生代币（native token）。而 ERC20 所定义的都是非原生代币（non-native token）。ERC20 代币内部实现类似于一个数据库，里面记录了每个持有者持有了多少个代币。ERC20 代币转账调用的都是普通函数。跟 Ether 转账是有本质不同的。

:::

## Solidity receive 函数定义语法

`receive` 函数的定义格式是固定的，其可见性（*visibility*）必须为 `external`，状态可变性（*state mutability*）必须为 `payable`。同时要注意 `receive` 函数不需要 `function` 前缀

```solidity

receive() external payable {
    // 函数体
}

```

## 合约没有定义 receive 和 fallback 函数时，不能对其转账

如果一个合约既没有定义 `receive` 函数，也没有定义 `fallback` 函数，那么我们不能对它发起 Ether 转账。这种情况下所有试图向该合约转账的交易都会被 revert 。如下面所示：


:::tip `Callee` 没有定义 `receive` 和 `fallback` 函数，三种对其转账的方法都失败

```solidity
// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

// Callee既没有定义receive函数，也没有定义fallback函数
contract Callee {}

contract Caller {
    address payable callee;

    // 注意： 记得在部署的时候给 Caller 合约转账一些 Wei，比如 100
    constructor() payable{
        callee = payable(address(new Callee()));
    }

    // 失败，因为Callee既没有定义receive函数，也没有定义fallback函数
    function tryTransfer() external {
        callee.transfer(1);
    }

    // 失败，因为Callee既没有定义receive函数，也没有定义fallback函数
    function trySend() external {
        bool success = callee.send(1);
        require(success, "Failed to send Ether");
    }

    // 失败，因为Callee既没有定义receive函数，也没有定义fallback函数
    function tryCall() external {
        (bool success, bytes memory data) = callee.call{value: 1}("");
        require(success, "Failed to send Ether");
    }
}

```

:::

要注意我们上面提到的 Ether 转账指的是纯转账（*msg.data = empty*）。Ether 转账不进行函数调用，只是把 Ether 转到目标地址。Solidity 中有三种方法进行 Ether 转账：

- `send(amount)` （gas 固定为 2300，错误时 revert)
- `transfer(amount)` （gas 固定为 2300, 返回布尔值） 
- `call{value: amount}("")`（gas 可以随意设定，返回布尔值）

这三种方法都是发送 amount 数量的 Wei 到目标地址。

我们提到如果合约既没有定义 `receive` 函数，也没有定义 `fallback` 函数，那么对其转账会失败。但是在同等情况下，不影响普通函数调用（*msg.data != empty*）。例如你可以用 `call` 来调用普通函数：

```solidity

// 调用 foo() 函数 
call( abi.encodeWithSignature("foo()") );

// 调用 foo() 函数，并转账 1 Wei 
call{value: 1}( abi.encodeWithSignature("foo()") );

```

注意第二个函数调用中，还同时向目标合约转了 1 Wei， 这也是允许的，因为这是一个普通函数调用，而不是纯转账。

## 注意 Gas 不足的问题

定义 `receive` 函数的时候要注意 Gas 不足的问题。前面我们有提到, `send` 和 `transfer` 的 Gas 是固定为 2300 的。所以剩余的 Gas 往往不够进行复杂的操作。如果函数体要执行较复杂的操作，那么可能会抛出 `Out of Gas` 异常。例如，进行下面的这些操作所消耗的 Gas 会超过 2300：

- 修改状态变量
- 创建合约
- 调用其他相对复杂的函数
- 发送 Ether 到其他账户

例如下面的 `receive` 函数永远会被 revert， 因为所使用的 Gas 已经超过 2300。

:::tip `receive` 函数消耗过多 Gas

```solidity

// 用send,transfer函数转账到该合约都会被 revert
// 原因是消耗的 Gas 超过了 2300
contract Example {
    uint a;
    receive() external payable {
        a += 1;
    }
}


```

:::