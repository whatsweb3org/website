---
title: Solidity 数据位置
last_update:

    date: 2023-01-18

---

# Solidity 数据位置

Solidity 要求在声明「引用类型」的时候**必须**要加上数据位置(*data location*)。例如 `uint[] storage` 。虽然说是必须，但是还是要注意有个例外：声明状态变量时不需要加上数据位置。

:::caution 声明「引用类型」的时候必须要加上数据位置

声明「引用类型」的时候必须要加上数据位置。这通常指的是在函数体里面的声明。

注意有个例外：声明状态变量时不需要加上数据位置

:::

Solidity可以指定的数据位置有三种：

* `storage` （数据会被存储在链上，是永久记录的，其生命周期与合约生命周期一致）
* `memory` （数据存储在内存，是易失的，其生命周期与函数调用生命周期一致，函数调用结束数据就消失了）
* `calldata` （与`memory`类似，数据会被存在一个专门存放函数参数的地方，与`memory`不同的是`calldata`数据是不可更改的。另外相比于`memory`，它消耗更少的Gas）

对于 `storage` 和 `memory` 这两个概念我们应该不难理解，可以想象成 `storage` = 磁盘， `memory` = RAM。但是对于 `calldata` 也许你会觉得陌生，到底其与 `memory` 有什么区别，为什么非要分出来这样的一种数据位置。由于这个是入门教程，我们暂时不引入过多的复杂性，使得读者觉得概念太多太复杂，学习路线太陡峭，所以我们会在「Solidity进阶」再深入讨论它们的区别。

目前你只需要知道 `calldata` 相对于 `memory` 有这下面几个区别即可：

* 只能在引用类型的函数参数使用
* 数据不可更改（_immutable_)
* 易失的（_non-persistent_)
* 消耗更少的gas（_gas efficient_)

所以一条简单的原则是：如果你的引用类型函数参数不需要修改，你应该尽可能使用 `calldata` 而不是 `memory` 。

## 参考资料

https://eips.ethereum.org/EIPS/eip-4488
https://eips.ethereum.org/EIPS/eip-2028
https://stackoverflow.com/questions/33839154/in-ethereum-solidity-what-is-the-purpose-of-the-memory-keyword
https://betterprogramming.pub/solidity-tutorial-all-about-calldata-aebbe998a5fc?gi=e169bf2e1867
https://ethereum.stackexchange.com/questions/74442/when-should-i-use-calldata-and-when-should-i-use-memory/74443#74443
