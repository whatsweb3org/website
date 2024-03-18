---
title: Solidity 数组
last_update:

    date: 2023-01-14

---

# Solidity 数组

假设你有一个合约专门用来的管理你所持有的 NFT，然后可能需要记录你都持有哪些 NFT，它们的 ID 是什么。于是你会想到像下面的示例一样，定义多个 `uint` 变量来记录每个NFT ID:

:::tip 定义多个 `uint` 变量来记录持有的NFT ID

```solidity
uint nftID1 = 1001;
uint nftID2 = 1002;
uint nftID3 = 1003;
uint nftID4 = 1004;
...
```

:::

![](./assets/array/8b7903fe53a24dfda50d162865c4bbbd.png)

上面的示例中我们定义了4个 `uint` ，记录了4个NFT ID。但是假设你是 NFT 持有大户，手上有上万个 NFT 的时候怎么办？如果按照上面的方法我们需要定义上万个 `uint` 变量来记录每个 NFT ID。显然这是不太现实的。这样做主要存在两个问题：

* 定义太多变量了，很麻烦，难以维护
* 能记录的 NFT ID 数量是固定的，不可变的，一旦合约部署了，就不能增加新的 NFT 了

遇到这种情况，数组（_array_）就派上用场了。

## 数组的声明

数组是一种数据结构，它是存储**同类型元素**的有序集合。数组可以按照其长度是否可以改变分下面两种：

* 静态数组（_static array_）
* 动态数组（_dynamic array_）

### 静态数组的声明

假设 `T` 是一种类型，那么静态数组的声明格式如下：

```solidity
T[arrSize] DataLocation arrName;
```

其中 `arrSize` 是数组的长度， `DataLocation` 是数据位置，而 `arrName` 是你为这个数组起的任意名字。

:::info 数组是一种引用类型
注意：数组是一种引用类型，所以你必须在声明，定义的时候加上三个数据位置（_data location_）关键字之一： `storage` , `memory` , `calldata` 。
:::

:::tip 声明静态数组

```solidity
uint[3] memory nftMem;
uint[3] storage nftStorage;
```

<tryit fileName={ 'DeclareStaticArray.sol' } />

:::

要注意在 Solidity 中静态数组的大小必须在编译时确定。这意味着你不能使用变量来指定数组的大小。例如，下面的代码是不合法的：

:::tip 静态数组的大小必须要能够在编译期间确定

```solidity
uint size = 2;
uint[size][size] memory array; // 非法，size 是变量，不能用来指定数组大小
```

<tryit fileName={ 'StaticaArraySizeMustDefinite.sol' } />

:::

### 动态数组的声明

假设 `T` 是一种类型，那么动态数组的声明格式如下：

```solidity
T[] DataLocation arrName;
```

其中 `DataLocation` 是数据位置，而 `arrName` 是你为这个数组起的任意名字。

:::tip 声明动态数组

```solidity
uint[] memory nftMem;
uint[] storage nftStorage;
```

<tryit fileName={ 'DeclareDynamicArray.sol' } />

:::

## 数组的初始化

静态数组的初始化和动态数组的初始化不太一样，我们分开来讨论。

### 静态数组的初始化

#### 零值初始化

如果你只声明静态数组，不手动进行初始化，那么它的所有元素都会被零值初始化（_zero value initialized_)。也就是说所有元素都会被赋予默认值。

:::tip 零值初始化整型数组

```solidity
uint[3] memory nftArr; //所有元素都是0
```

<tryit fileName={ 'ZeroInitialization.sol' } />

:::

#### 数组字面值初始化

你可以使用「数组字面值」对静态数组进行初始化。「数组字面值」的格式是 `[...]` ，例如我们可以有[1, 2, 3]，也可以有 `['str1', 'str2', 'str3']` 等等。下面的例子中我们用数组字面值初始化了一个整型数组：

:::tip 数组字面值初始化静态数组

```solidity
//必须使用uint(1000)显式地将「数组字面值」第一个元素的类型转换成uint
uint[3] memory nftArr = [uint(1000), 1001, 1002]; 
```

<tryit fileName={ 'StaticArrayInitializeWithLiteral.sol' } />

:::

要注意「数组字面值」的「基础类型」(_base type_)，是其第一个元素的类型。例如上面的例子中， `[uint(1000), 1001, 1002]` 的基础类型是 `uint` ，因为第一个元素是 `uint(1000)` 。其他所有元素都会隐式地被转换成第一个元素的类型。

如果我们不强制将第一个元素转换成与我们所定义的数组的基础类型（在上面的例子中是 `uint` ）相同，那么编译器会报错。如下面的示例所示：

:::tip 「数组字面值」的「基础类型」需要和「数组」的「基础类型」相同
本示例编译期间会报错，类型不匹配。因为第一个元素会被隐式转换成能装得下它的最小整型，也就是 `uint16` 。与我们定义的数组的基础类型 `uint` 不匹配。

```solidity
// 编译报错，类型不匹配
uint[3] memory nftArr = [1000, 1001, 1002]; 
```

<tryit fileName={ 'ArrayLiteralBaseTypeMustMatchArrayBaseType.sol' } />

:::

另外要注意的一点是定义的数组长度必须跟数组字面值的长度是一样的，否则也会编译报错。如下面例子所示：

:::tip 定义的数组长度必须跟数组字面值的长度一致
数组定义的长度为3，但是数组字面值的长度为2

```solidity
uint[3] memory nftArr = [uint(1000), 1001];  //编译错误，长度不匹配
```

<tryit fileName={ 'ArrayLenShouldEqualLiteralLen.sol' } />

:::

### 动态数组初始化

动态数组初始化需要使用到 `new` 关键字。其所有元素值被「零值初始化」，也就是会被赋予默认值。如下所示，初始化了一个整型动态数组：

:::tip 动态数组初始化
初始化了一个有三个元素的动态数组，元素值被初始化为零值

```solidity
uint n = 3;
uint[] memory nftArr = new uint[](n);
```

<tryit fileName={ 'InitDynamicArray.sol' } />

:::

使用 `new` 关键字可以适用于在任何[数据位置](data-location)的动态数组。如果你的动态数组是在 `storage` ，那么你还可以使用数组字面值来初始化：

:::tip 在 `storage` 的动态数组可以用数组字面值初始化

```solidity
uint[] storage Arr = [uint(1), 2]; // 动态数组只有在storage位置才能用数组字面值初始化
```

<tryit fileName={ 'InitStorageDynamicArrayWithLiteral.sol' } />

:::

## 静态数组和动态数组是不同的类型

要注意静态数组和动态数组是不同的类型，所以它们之间是不能相互赋值的。如下面所示：

:::tip 静态数组和动态数组之间不能相互赋值
不能把静态数组赋值给动态数组：

```solidity
uint[2] memory staticArr = [uint(1), 2];
uint[] memory dynamicArr = staticArr; // 编译错误，静态数组和动态数组是不同的类型
```

也不能把动态数组赋值给静态数组：

```solidity
uint[] memory dynamicArr = new uint[](2); 
uint[2] memory staticArr = dynamicArr; // 编译错误，静态数组和动态数组是不同的类型
```

<tryit fileName={ 'StaticaAndDynamicArrayAreDifferentTypes.sol' } />

:::

## 下标访问

跟大多数的编程语言一样，你也可以对Solidity的数组进行下标访问。下标访问所使用的操作符是 `[]` ，下标索引从 `0` 开始。

:::tip 数组的下标访问
下标访问静态数组：

```solidity
uint[3] memory nftArr1 = [uint(1000), 1001, 1002];
nftArr1[0] = 2000;
nftArr1[1] = 2001;
nftArr1[2] = 2002;
```

下标访问动态数组：

```solidity
uint[] memory nftArr2 = new uint[](n);
nftArr2[0] = 1000;
nftArr2[1] = 1001;
nftArr2[2] = 1002;
```

<tryit fileName={ 'AccessArray.sol' } />

:::
