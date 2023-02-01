---
title: Solidity if-else
last_update:

    date: 2023-01-14

---

# Solidity if-else

智能合约之所以智能是因为它能够在不同条件下执行不同的操作。所以，这个时候我们需要使用条件判断语句。Solidity的条件语句与C语言别无二致，你可以使用到的三个条件语句分别是：

* `if`
* `else if`
* `else`

其语法规则如下所示：

```solidity
if (contition1) {
    // condition1=true 时执行的代码块
} else if (condition2) {
    // condition1=false 且 contition2=true 时执行的代码块
} else {
    // condition1 和 condition2 同时为 false 时执行的代码块
}
```

## if语句

我们先来看if语句的使用示例：

:::tip 如果年龄小于18岁，就是小孩

```solidity
if (age < 18) {
	ageStage = "teen";
}
```

:::

## else if语句

我们可以在 `if` 语句的基础上**增加一个或者多个** `else if` 语句，如果 `if` 语句为 `false` ，那么我们就可以继续执行 `else if` 语句

:::tip 如果年龄小于18岁，就是小孩；如果年龄大于等于18岁，且小于65岁，就是成年人

```solidity
if (age < 18) {
	ageStage = "teen";
} else if (age < 65) {
	ageStage = "adult";
}
```

:::

## else语句

如果我们想在当所有 `if` 和 `else if` 都不成立的时候通通执行某个操作时，我们就可以使用 `else` 语句

:::tip 如果年龄小于18岁，就是小孩；如果年龄大于等于18岁，且小于65岁，就是成年人；否则就是老年人

```solidity
if (age < 18) {
	ageStage = "teen";
} else if (age < 65) {
	ageStage = "adult";
} else {
	ageStage = "elderly";
}
```

:::
