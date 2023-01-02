import React from 'react';

import Card from './Card';
import SectionLayout from './SectionLayout';

const products = [
  {
    title: 'Solidity入门教程',
    description:
      '这个教程里你将学会如何用Solidity编写EVM智能合约。你会学会基本的Solidity语法，合约组成结构，数据结构，控制结构等等',
    url: '/docs/solidity-basic/intro',
    btnText: '进入教程',
    icon: '/img/tutorial-logo/solidity-basic.drawio.svg',
  },
  {
    title: 'Solidity进阶教程',
    description:
      '这个教程里你将学会Solidity的进阶内容，包括ABI，函数重载，继承，抽象合约，库等内容',
    url: '',
    icon: '/img/tutorial-logo/solidity-advance.drawio.svg',
  },
  {
    title: 'Openzeppelin合约学习',
    description:
      '这个教程我们将会带你学习由Openzeppelin开源的一系列标准合约，使用这些标准合约可以帮助你进行更高效的合约开发',
    url: '',
    icon: '/img/tutorial-logo/openzeppelin.drawio.svg',
  },
  {
    title: 'Ethernut',
    description:
      '这个教程我们将会带你利用学到的Web3知识，去发现解决一系列漏洞，学习关于合约安全的主题',
    url: '',
    icon: '/img/tutorial-logo/ethernut.drawio.svg',
  },
  {
    title: 'Web3js',
    description:
      '这个教程你将学会如何使用Web3js在你的DApp应用与你部署的合约进行交互',
    url: '',
    icon: '/img/tutorial-logo/web3js.drawio.svg',
  },
  {
    title: 'Hardhat & Truffle',
    description:
      '这个教程将会带你学习如何使用Hardhat和Truffle来自动化测试部署你的合约',
    url: '',
    icon: '/img/tutorial-logo/hardhat.drawio.svg',
  },
];

const ProductsSection = () => {
  return (
    <SectionLayout title="Web3教程">
      <div className="row">
        {products.map(({ title, description, url, icon, btnText }, idx) => (
          <Card
            key={idx}
            idx={idx}
            title={title}
            description={description}
            icon={icon}
            url={url}
            btnText={btnText ? btnText : '教程筹划中'}
          />
        ))}
      </div>
    </SectionLayout>
  );
};

export default ProductsSection;
