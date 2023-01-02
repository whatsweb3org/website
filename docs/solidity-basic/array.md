---
title: 数组
---

# 数组
假设你有一个合约专门用来的管理你所持有的NFT，然后可能需要记录你都持有哪些NFT，它们的ID是什么。于是你会想到像下面的示例一样，定义多个`uint256`变量来记录每个NFT ID:
![](./assets/array/8b7903fe53a24dfda50d162865c4bbbd.png)


:::tip 定义多个`uint256`变量来记录持有的NFT ID
```solidity
uint256 nftID1 = 1001;
uint256 nftID2 = 1002;
uint256 nftID3 = 1003;
uint256 nftID4 = 1004;
...
```
:::

上面的示例中我们定义了4个`uint256`，记录了4个NFT ID。但是假设你是NFT持有大户，手上有上万个NFT的时候怎么办？如果按照上面的方法我们需要定义上万个`uint256`变量来记录每个NFT ID。显然这是不太现实的。这样做主要存在两个问题：

* 定义太多变量了，很麻烦，难以维护
* 能记录的NFT ID数量是固定的，不可变的，一旦合约部署了，就不能增加新的NFT了

遇到这种情况，数组（_array_）就派上用场了。

# 数组的声明
数组是一种数据结构，它是存储**同类型元素**的有序集合。数组可以按照其长度是否可以改变分下面两种：

* 静态数组（_static array_）
* 动态数组（_dynamic array_）

假设`T`是一种类型，那么静态数组的声明格式如下：

```solidity
T[arrSize] dataLocation arrName;
```

其中`arrSize`是数组的长度，`dataLocation`是数据位置，而`arrName`是你为这个数组起的任意名字。

:::note 数组是一种引用类型
注意：数组是一种引用类型，所以你必须在声明，定义的时候加上三个数据位置（_data location_）关键字之一：`storage`, `memory`, `calldata`。
:::

:::tip 声明一个静态NFT数组
```solidity
uint256[3] memory nftMem;
uint256[3] storage nftStorage;
```
:::

动态数组的声明格式如下：
```solidity
T[] dataLocation arrName;
```

其中`dataLocation`是数据位置，而`arrName`是你为这个数组起的任意名字。

:::tip 声明动态NFT数组
```solidity
uint256[] memory nftMem;
uint256[] storage nftStorage;
```
:::

# 数组的初始化



