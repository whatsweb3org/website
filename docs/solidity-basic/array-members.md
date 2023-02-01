---
title: Solidity 数组成员
last_update:

    date: 2023-01-14

---

# Solidity 数组成员

数组作为一种组合数据类型。它内部还包含一些成员变量和成员函数。本节我们将展开介绍这些成员变量和成员函数。

## 成员变量

数组（包括静态数组和动态数组）只有一个成员变量，就是 `length` ，它记录的是数组的长度。我们可以通过 `.` 操作符来获取它的值：

:::tip 获取数组的长度

```solidity
uint[3] memory arr1 = [uint(1000), 1001, 1002];
uint[] memory arr2 = new uint[](3);
uint arr1Len = arr1.length; // 3
uint arr2Len = arr2.length; // 3
```

:::

## 动态数组成员函数

只有动态数组，并且其数据位置为 `storage` 的时候才有成员函数。其他数组，比如静态数组和在 `calldata` , `memory` 的数组是没有成员函数的。这三个成员函数会改变数组的长度。它们分别是：

* `push()` 在数组末尾增加一个元素，并赋予零值；数组长度加一
* `push(x)` 将元素x添加到数组末尾；数组长度加一
* `pop()` 从数组末尾弹出一个元素； 数组长度减一

:::caution 注意

只有动态数组，并且其数据位置为 `storage` 的时候才有成员函数 `push()` , `push(x)` , `pop()`。

注意这三个成员函数会改变数组的长度

:::

:::tip `push` 和 `pop` 函数示例

```solidity
uint[] arr; //定义在storage位置的数组

function pushPop() public {
    // 刚开始没有任何元素
    arr.push(); // 数组有一个元素：[0]
    arr.push(1000); //数组有两个元素：[0, 1000]
    arr.pop(); // 数组剩下一个元素： [0]
}
```

:::

如果我们尝试在「静态数组」或者「数据位置」不是 `storage` 的「动态数组」执行上面的成员函数，编译器会报错：

:::tip 编译错误： 静态数组使用 `push` ， `pop` 成员函数

```solidity
uint[3] memory arr;
arr.push(1); //编译错误，只有 storage 上的动态数组才能调用 push 函数
arr.pop(); // 编译错误，只有 storage 上的动态数组才能调用 pop 函数
```

:::

:::tip 编译错误：数据位置不在 `storage` 的动态数组使用 `push` ， `pop` 成员函数 

```solidity
uint[] memory arr = new uint[](3);
arr.push(1); //编译错误，只有 storage 上的动态数组才能调用 push 函数
arr.pop(); // 编译错误，只有 storage 上的动态数组才能调用 pop 函数
```

:::
