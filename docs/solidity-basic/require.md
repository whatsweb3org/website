---
title: require
last_update:
    date: 1/15/2023
---

# require

合约执行过程中往往会出现一些异常状况，比如输入参数不合法，算数运算时除以0，整型溢出等等。如果出现这些情况，我们就需要进行异常处理。Solidity 异常处理的统一原则是状态回滚（*state reverting*），也就是恢复执行前的状态，就好像什么都没有发生一样。目前 Solidity 提供了三个异常处理的函数：

* [require](require)
* [assert](assert)
* [revert](revert)

本节我们将会介绍 `require` 。

在函数执行前我们常常需要检查入参是否符合要求，再接续后面的执行逻辑。Solidity提供了 `require` 函数，让我们可以检查入参是否满足条件，如果不满足条件，抛出异常。

`require` 函数通常有下面几种用途：

1. 检查输入参数
2. 检查返回结果
3. 在实际执行函数逻辑前检查是否满足预设条件

一般情况下，我们都是在函数一开始的时候就使用 `require` 进行校验。

## require 语法

require 的语法如下所示：

```solidity
require(condition, "My error string");
```

其中 `condition` 是布尔表达式，如果其结果是 `false` 那么就会抛出异常。然后所有状态变量都会恢复原状。

例如下面的示例中，把传入的 Ether 分为两半，一半转入地址 `addr1`，另一边转到地址 `addr2` 。在实际分账之前，使用 `require` 先检查传入的 Ether 是不是偶数。

:::tip Ether对半分账
```solidity
function splitEther(address payable addr1, address payable addr2) public payable {
    require(msg.value % 2 == 0, "Even value required."); // 检查传入的ether是不是偶数
    addr1.transfer(msg.value / 2);
    addr2.transfer(msg.value / 2);
}
```
:::
