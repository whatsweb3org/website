---
title: 修饰器 
last_update:

    date: 1/27/2023

---

# 修饰器

修饰器可以用来改变函数的行为，它们可以在函数执行前进行预处理和验证操作。例如可以验证函数入参是否符合预期，或者验证调用者是否具有特定的权限。使用修饰器能提高代码复用和可读性。例如下面的示例中，有几个函数要求调用者是 owner 时才能正常调用。 每个函数执行前我们都需要使用 `require(msg.sender == owner, ...)` 对调用者身份进行检查。而这部分的逻辑是重复的。

:::tip 用 `require` 来进行权限检查

```solidity

pragma solidity ^0.8.9;

contract ExampleContract {
    address private owner;

    constructor() public {
        owner = msg.sender;
    }

    function mint() external {
        require(msg.sender == owner, "Only the owner can call this function.");
        // Function code goes here
    }

    function changeOwner() external {
        require(msg.sender == owner, "Only the owner can call this function.");
        // Function code goes here
    }

    function pause() external {
        require(msg.sender == owner, "Only the owner can call this function.");
        // Function code goes here
    }
}

```

:::

在这种情况下，我们可以把权限检查的代码抽出来，变成一个修饰器。如果有函数需要权限检查时就可以使用这个修饰器。如下面所示：

:::tip 用修饰器来进行权限检查

```solidity

pragma solidity ^0.8.9;

contract ExampleContract {
    address private owner;

    constructor() public {
        owner = msg.sender;
    }

    // 将权限检查抽取出来成为一个修饰器
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function.");
        _;
    }

    // Only the owner can call this function
    function mint() external onlyOwner { // 使用 onlyOwner 修饰器来对调用者进行限制
        // Function code goes here
    }

    // Only the owner can call this function
    function changeOwner() external onlyOwner { // 使用 onlyOwner 修饰器来对调用者进行限制
        // Function code goes here
    }

    // Only the owner can call this function
    function pause() external onlyOwner { // 使用 onlyOwner 修饰器来对调用者进行限制
        // Function code goes here
    }
}

```

:::

有了修饰器，你就不需要写同样的代码了，提高了代码复用，降低了出现 bug 的可能性。

## 修饰器的语法

定义修饰器的语法如下所示：

```solidity

modifier modifierName {
    // modifier body 1
    _;
    // modifier body 2
}

```

修饰器的语法是比较简单的，其中要注意 `_` 是一个占位符（*placeholder*），代表的是函数主体（*function body*）。你可以认为函数主体被复制粘贴到 `_` 所在的位置。按照上面的定义，其执行顺序为：

1. 执行 modifier body 1
2. 执行函数主体
3. 执行 modifier body 2

定义完修饰器后你就可以在函数中使用它。修饰器是跟在函数参数列表后面的。

:::tip 使用修饰器

使用单个修饰器

```solidity

function foo() public modifier1 {}

```

使用多个修饰器，他们的执行顺序是从左到右的

```solidity

function foo() public modifier1, modifier2, modifier3 {}

```

:::
