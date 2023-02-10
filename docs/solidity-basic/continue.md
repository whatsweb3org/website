---
title: Solidity continue
last_update:

    date: 2023-01-17

---

# Solidity continue

上一节我们学习了 [break](break) 关键字的用法和使用时机。它让我们可以在条件合适的时候提前退出循环，减少无用开销。这一节我们来学习一下另一个与它经常一起提及的关键字 `continue` 。

在solidity中， `continue` 关键字用于跳过当前循环的剩余部分，并立即开始下一轮循环。它的主要作用是让我们可以在循环中跳过一些数据，然后只处理哪些我们感兴趣的数据。例如，下面是一个使用continue关键字打印1到10的奇数的 Solidity 函数：

:::tip 打印1到10的奇数
在这个函数中，我们将会打印1到10的奇数。在循环体内，我们使用了一个条件判断语句 `i%s==0` 来检查当前数字是否是偶数。如果是，就使用 `continue` 跳过本轮循环，并开始下一轮循环；否则，就打印输出当前数字。这样，我们就可以在循环中跳过某些数据，从而只处理我们感兴趣的数据

```solidity
function printOddNumbers() public {
    for (uint i = 1; i <= 10; i++) {
        if (i%2 == 0) { // 如果是偶数，跳过本次循环
            continue;
        }
        console.log(i); // 如果是奇数，就打印输出
    }
}
```

<tryit fileName={ 'PrintOddNumbers.sol' } />

:::

下图更形象展示了 `continue` 的行为。当执行到 `continue` 的时候，它就不再执行蓝色和绿色框的内容了，而是直接跳回到黄色框里面，然后执行 `iteration-statement` 也就是 `i++` （因为 `iteration-statement` 是在循环体结束之后再执行的）。接着就是再次进入到循环体里面开始新一轮循环。

![](./assets/continue/757a73c67fcc4e14896a6874430573b6.png)

## 小结

1. `break` 和 `continue` 关键字都是用于控制循环的行为
2. `break` 关键字用于提前退出循环，减少无用开销, continue 关键字用于跳过当前循环的剩余部分，并立即开始下一轮循环
3. `continue` 关键字可以用于跳过循环中不感兴趣的数据，只处理感兴趣的数据
