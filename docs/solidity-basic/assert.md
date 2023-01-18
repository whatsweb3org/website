---
title: assert
last_update:

    date: 1/15/2023

---

# assert

合约执行过程中往往会出现一些异常状况，比如输入参数不合法，算数运算时除以0，整型溢出等等。如果出现这些情况，我们就需要进行异常处理。Solidity 异常处理的统一原则是状态回滚（*state reverting*），也就是恢复执行前的状态，就好像什么都没有发生一样。目前 Solidity 提供了三个异常处理的函数：

* [require](require)
* [assert](assert)
* [revert](revert)

本节我们将会介绍 `assert` 。

Solidity提供的 `assert` 函数让我们可以检查合约状态是否正常，否则抛出异常。

`assert` 函数通常有下面几种用途：

1. 检查不变性（invariant），例如所有balance之和应该与totalSupply相等
2. 防止那些不应该出现的情况出现 
3. 修改合约状态后，检查合约内部状态是否符合预期

一般情况下，我们都是在函数结尾的时候使用 `assert` 来检查合约的状态。

## assert 语法

`assert` 的语法如下所示：

```solidity
assert(condition);
```

其中 `condition` 是布尔表达式，如果其结果是 `false` 那么就会抛出异常。然后所有状态变量都会恢复原状。

例如下面的示例中，把传入的 Ether 分为两半，一半转入地址 `addr1` ，另一边转到地址 `addr2` 。在实际分账之前，使用 `require` 先检查传入的 Ether 是不是偶数。在分账完成后，使用 `assert` 检查分账前后，合约的balance不受影响。

:::tip Ether对半分账

```solidity
function splitEther(address payable addr1, address payable addr2) public payable {
    require(msg.value % 2 == 0, "Even value required."); // 检查传入的ether是不是偶数
    uint balanceBeforeTransfer = address(this).balance;
    addr1.transfer(msg.value / 2);
    addr2.transfer(msg.value / 2);
    assert(address(this).balance == balanceBeforeTransfer); // 检查分账前后，本合约的balance不受影响
}
```

:::

## assert 与 require 的区别

我们学习的 `assert` 和 `require` 似乎都能够检查异常情况，并抛出异常。它们的区别更多是在语义上的，而不是行为上的。一般情况下 `require` 是用来校验输入输出，与**外部**交互是否符合预期。而 `assert` 是用来校验**内部**是否出现不可接受的错误。一旦 `assert` 抛出异常，说明合约已经有了严重的 Bug ，需要马上处理。你可以把它们的用法当做一个惯例（_convention_）。虽然交替使用不会导致合约出现问题，但是会降低合约的可读性。
