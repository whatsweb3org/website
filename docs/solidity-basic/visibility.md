---
title: 可见性
last_update:

    date: 2023-01-29

---

# 可见性

为了保证合约安全性, Solidity 允许对变量和函数的访问进行限制。开发者可以自己指定当前合约的变量和函数可以被哪些合约访问。而 Solidity 中的可见性（ *visibility* ）指的是其他合约对当前合约中的变量或函数的可访问性（ *accessibility* ）。换一种说法就是：其他合约是否能访问当前合约的变量和函数是由可见性决定的。Solidity 中的「可见性修饰符」是用来指定「可见性」层级的。

Solidity支持四种可见性修饰符：

![picture 2](assets/visibility/1674825674344.png)  

其中，**变量**可以使用的可见性修饰符有三个：

* `public` 表示该变量可以在当前合约内部和外部访问
* `private` 表示该变量只能在当前合约内部访问
* `internal` 表示该变量只能在当前合约内部或其「子合约」中访问

而**函数**可以使用上面所有四个修饰符：

* `public` 表示该函数可以在当前合约内部和外部访问
* `external` 表示该函数只能在当前合约外部访问
* `private` 表示该函数只能在当前合约内部访问
* `internal` 表示该函数只能在当前合约内部或其「子合约」中访问

## 合约分类

在我们继续讨论可见性之前，先对合约进行一下分类。因为可见性影响到不同类型的合约对「当前合约」的可访问性（*accessibility*）。根据可见性对不同合约可访问性的影响，我们可以把合约分为三类：

1. 主合约 （也就是当前合约内部）
2. 子合约 （也就是继承「当前合约」的合约）
3. 第三方合约 （也就是当前合约外部）

![picture 3](assets/visibility/1674825791282.png)  

简单来讲，子合约继承了主合约，而第三方合约跟主/子合约没有任何继承关系。把主合约和子合约想象成一个家庭的话，第三方合约就是个陌生人。

要注意我们所谈到的访问限制都是以主合约（当前合约）为视角的。也就是当我们在编写主合约的时候，使用可见性修饰符来决定哪些合约可以访问主合约的哪些变量和函数。

### 主合约

主合约其实就是一个普通合约，内部定义了很多变量和函数。这些变量和函数可能有不同的可见性。主合约可以访问自己内部可见性为 `private` , `internal` , `public` 的任何变量和函数。

```solidity
// 主合约可以访问自己内部可见性为 private, internal, public 的变量和函数
contract MainContract {
    uint varPrivate;
    uint varInternal;
    uint varPublic;

    function funcPrivate() private {}
    function funcInternal() internal {}
    function funcExternal() external {}
    function funcPublic() public {}
}

```

### 子合约

子合约继承了主合约。继承的语法是 `Child is Parent` 。关于继承有关的详细介绍，我们会在 Solidity 进阶指南进行介绍。子合约允许访问主合约中可见性为 `internal` ， `public` 的函数。

```solidity

contract ChildContract is MainContract {
    function funcChild() private {
        funcInternal(); // 子合约可以访问主合约中可见性为internal，public的函数
        funcPublic(); // 子合约可以访问主合约中可见性为internal，public的函数
    }
}

```

### 第三方合约

第三方合约是一个普通合约。可以通过主合约的地址来与主合约进行交互, 其交互语法如下所示。第三方合约可以访问主合约中可见性为 `external` ， `public` 的函数

```solidity

contract ThirdPartyContract {
      function funcThirdParty(address mainContractAddress) private {
            MainContract(mainContractAddress).funcExternal(); // 第三方合约可以访问主合约中可见性为external，public的函数
            MainContract(mainContractAddress).funcPublic(); // 第三方合约可以访问主合约中可见性为external，public的函数
      }
}

```

## 可见性对于合约访问的限制

我们已经提到，可见性就是合约变量和函数的可访问性。那么可见性对每种类型合约的访问限制是什么呢？本小节将会展开讨论。

### public

可见性为 `public` 的变量和函数可以被任何合约访问。也就是可以被 `MainContract` , `ChildContract` , `ThirdPartyContract` 访问。如下图所示：

![picture 4](assets/visibility/1674825830199.png)  

### external

可见性为 `external` 的函数只能被第三方合约访问。也就是只能被 `ThirdPartyContract` 访问。注意变量是没有 `external` 修饰符的。如下图所示：

![picture 7](assets/visibility/1674825905583.png)  

### internal

可见性为 `internal` 的变量和函数可以被主合约和子合约访问。也就是可以被 `MainContract` , `ChildContract` 访问。如下图所示：

![picture 5](assets/visibility/1674825863125.png)  

### private

可见性为 `private` 的变量和函数只能被主合约访问。也就是只能被 `MainContract` 访问。如下图所示：

![picture 8](assets/visibility/1674825933657.png)  

