---
title: break
---

# break

在 Solidity 中，break 关键字用于提前退出循环。使用它可以提高你的程序的执行效率,减少无用开销. 你可以在 for, while, do-while 循环使用 break 关键字. 我们通过一个例子来了解它的具体作用.

:::tip 
```solidity
function leastCommonMultiple() public view returns (uint) {
    uint result;    
    for (uint i = 1; i < 10000; i++) {
        if (i%5 == 0 && i%7 == 0) { // 找到最小公倍数就退出
            resule = i; 
            break; // 跳出循环
        }
        // do something
        console.log("i is not the common multiple of 5 and 7");
    }
    return result;
}
```
:::

函数体内部定义了一个变量 result，该变量用于存储最终结果。然后开始了一个 for 循环，循环变量 i 从 1 开始，每次增加 1，直到达到 10000。在每次循环迭代中，如果 i 是 5 和 7 的最小公倍数（即 i 同时被 5 和 7 整除），那么就将 i 的值赋给 result，并通过 break 语句跳出循环。如果变量 i 不是 5 和 7 的最小公倍数，就会执行一条 console.log 语句。

最后，函数会返回变量 result 的值。

