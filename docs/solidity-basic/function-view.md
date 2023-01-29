---
title: view函数
last_update:

    date: 1/28/2023

---

# view 函数

`view`（视图）函数只能读取合约状态，不能修改合约状态。在 `view` 函数体修改合约状态时，编译器会直接报错。使用 `view` 函数可以提高代码安全性，避免出现与预期不符副作用。如果你的函数承诺不会修改合约状态，那么你应该将其声明为 `view` 函数。如下所示：

:::tip `view` 函数

```solidity

uint count;
function GetCount() public view returns(uint) {
    return count;
}

```

:::

## 怎样才算修改合约状态

Solidity 有8种行为被认为是修改了合约状态：

1. 修改状态变量
2. 触发事件
3. 创建其他合约
4. 使用 `selfdestruct` 来销毁合约
5. 通过函数调用发送以太币
6. 调用未标记为 `view` 或 `pure` 的任何函数
7. 使用低级别调用，如 `transfer`, `send`, `call`, `delegatecall` 等
8. 使用包含某些操作码的内联汇编