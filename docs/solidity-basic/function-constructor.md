---
title: Solidity 构建函数 
last_update:

    date: 2023-02-01

---

# Solidity 构建函数

构建函数是 Solidity 中的一种特殊函数。它的主要作用是对合约状态进行初始化。初始化（*initialization*）指的是为变量分配存储空间并赋予初值。构建函数为我们提供了把变量初始值**参数化**的途径。这样的好处是我们只需要开发一次合约，但是可以部署多份具有不同初始值的合约。接下来我们逐步展开讲解。

## 最简单的初始化方式

我们在此之前已经遇到过初始化了：在定义状态变量的时候直接为其设定默认值。这就是最简单的初始化状态变量的方法。如下面所示，将状态变量 `a` 初始化为 `1`：

:::tip 默认值初始化合约状态

```solidity

contract ExampleContract {
    uint a = 1; // 将 a 初始化为 1 
}

```

<tryit fileName={ 'InitWithDefaultValue.sol' } />

:::

## 使用构建函数初始化

上面提到的初始化方法有一个缺点：如果我想要部署另外一个合约，它的 `a `应该被初始化为 `2`。那么我们就需要去**修改合约**，将 `uint a = 1;` 改为 `uint a = 2;`。其他的也依此类推。

修改合约是很容易出错的。现在我们面对的是一个状态变量，但是当我们面对多个状态变量并且它们的值是彼此关联的时候情况就会变得非常复杂。构建函数就可以帮助我们去管理这种复杂性。把一切初始化关联逻辑都收敛到构建函数内部，这样我们就可以轻松地构建部署新的合约。

如下面所示，我们定义了一个构建函数，里面使用外部传入的参数 `aVal` 对状态变量 `a` 进行了初始化。这样，如果我要部署 `a` 的初始值为 `2` 的合约，我只需要在创建合约时设定入参为 `2` 即可。

:::tip 构建函数初始化合约状态

```solidity

contract ExampleContract {
    uint a; // 状态变量声明，但是还没初始化

    constructor(uint aVal) {
        a = aVal; // 将 a 的值初始化为 aVal
    }
}

```

<tryit fileName={ 'InitWithConstructor.sol' } />

:::

定义了上面的合约后，我们就可以使用 `new` 关键字来新建一个 `a` 的初始值为 `2` 合约：

```solidity

ExampleContract c = new ExampleContract(2);

```

从上面的例子中，我们可以观察到定义构建函数的语法是相对简单明了的：

```solidity

constructor(parameter-list) {
    // constructor body
}

```

其中 `parameter-list` 是以逗号为分割的参数列表，`// construcotr body` 就是构建函数的函数主体。