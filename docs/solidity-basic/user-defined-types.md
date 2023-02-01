---
title: Solidity 自定义值类型
last_update:

    date: 2023-01-29

---

# Solidity 自定义值类型

「自定义值类型」（*User Defined Value Types*），是用户自定义的「值类型」。还有另外一种自定义的类型是[结构体](struct)，但是它是一种引用类型，之后我们会介绍。「自定义值类型」类似于别名（*alias*），但是不等同于别名。别名和原类型是一模一样的，只不过是名字不同而已。而「自定义值类型」缺少原类型的操作符（也就是 `+ - * /` 等操作符不能再使用）。它的主要存在价值是提高类型安全性和代码可读性。

## 「自定义值类型」的定义

我们可以通过 `type C is V` 来定义新的「自定义值类型」。其中 `C` 是新定义的类型，而 `V` 则必须是Solidity的原生类型。例如，下面的例子中定义了两种新类型：

:::tip 定义User-Defined Value Type

```solidity
type Weight is uint128;
type Price  is uint128;
```

:::

原生类型指的是 Solidity 本身定义的，比如：int, uint, bytes32等等。不能是由原生类型衍生出来的类型。

## 「自定义值类型」有什么好处

### 提高类型安全性

使用「自定义值类型」可以提高代码的类型安全性。例如下面的代码中，会产生编译错误_ "TypeError: Operator + not compatible with types UserDefinedValueType.Weight and UserDefinedValueType.Price." _ 因为 `Weight` 和 `Price` 是不同的类型，不能进行算术运算。这提高了类型安全性，避免直接使用 `uint128` 类型时误用的情况发生。

:::tip 提高类型安全性

```solidity
Weight w = Weight.wrap(10);
Price  p = Price.wrap(5);
Weight wp = w+p; //编译错误
Price  pw = p+w; //编译错误
```

:::

### 提高代码可读性

提高代码可读性就显而易见了，例如前一个例子中你知道 `w` 是 `Weight` 类型，你就知道 `w` 的含义是重量。同理 `p` 的类型为 `Price` ，代表的是价格。

## 类型转换

「自定义值类型」和原生类型之间是没有隐式类型转换的，那么我们应该如何进行类型转换？我们可以通过显式调用下面两个转换函数来达成：

* `C.wrap`    用来将原生类型转换成「自定义值类型」
* `C.unwrap` 用来将「自定义值类型」转换成原生类型

![Untitled](assets/user-defined-types/Untitled.png)

:::tip 「自定义值类型」与原生类型之间的类型转换

```solidity
Weight w = Weight.wrap(100);
uint128 u = Weight.unwrap(w);
```

:::

## 「自定义值类型」不继承操作符

要注意到「自定义值类型」是不继承原生类型的操作符的，包括 `+ - * /` 等等。例如下面的例子中编译器是会报错 "TypeError: Operator + not compatible with types UserDefinedValueType.Weight and UserDefinedValueType.Weight." ：

:::tip 「自定义值类型」使用原生类型操作符报错

```solidity
Weight w1 = Weight.wrap(10);
Weight w2 = Weight.wrap(20);
Weight sum = w1+w2; // 编译器报错
```

:::

如果你确实需要对 `Weight` 实现加法运算，那么你必须自己定义一个新的函数，例如：

:::tip 「自定义值类型」需要自定义函数来代替操作符

```solidity
function add(Weight lhs, Weight rhs) public pure returns(Weight) {
  return Weight.wrap(Weight.unwrap(lhs) + Weight.unwrap(rhs));
}
```

:::

## 小结

1. 自定义值类型是用户自定义的值类型，类似于别名，但是不等同于别名
2. 可以通过 `type C is V` 来定义新的自定义值类型
3. 使用自定义值类型可以提高代码的类型安全性和代码可读性
4. 不同自定义值类型之间不能进行算术运算
5. 自定义值类型和原生类型之间没有隐式类型转换，需要使用强制类型转换进行转换

## 参考资料

https://blog.soliditylang.org/2021/09/27/user-defined-value-types
https://forum.soliditylang.org/t/user-defined-value-types/314/20
https://forum.soliditylang.org/t/user-defined-types-and-operators/456
