import React from 'react';
import Layout from '@theme/Layout';
import Link from '@docusaurus/Link';
import clsx from 'clsx';

import HeroSection from '../components/HeroSection';
import ProductsSection from '../components/ProductsSection';
import JoinCommunitySection from '../components/JoinCommunitySection';
import FeatureSection from '../components/FeatureSection';

const Icon3 = require('../../static/img/home-buildingblocks.svg').default;

const title = 'Whats Web3';
const description =
  'What\'s Web3是Web3技术初学者以及Web2开发者转型Web3的最佳学习社区。在这里我们提供众多Web3技术学习资源，包括且不限于Solidity，Web3js，Hardhat，Truffle以及合约安全等Web3开发主流技术栈教程，帮助你顺利进入Web3开发领域';

const IndexPage = () => {
  return (
    <Layout title={title} description={description}>
      <HeroSection
        title="WhatsWeb3 (WW3)"
        description={description}
        image="/img/home-hero.svg"
        icon={"/img/logo.svg"}
        buttons={[
          {
            title: 'Solidity入门教程',
            href: 'docs/solidity-basic/intro',
            className: 'button--primary',
          },
          {
            title: '成为贡献者',
            href: 'contributor',
            className: 'button--primary button--outline',
          },
        ]}
      />

      <ProductsSection />

      <FeatureSection title="成为贡献者"
        btnLink="contributor"
        btnText="了解更多"
        image={Icon3}
        direction="right"
      >
        <p>
         WW3所有教程资源均为社区贡献，全公开，全免费
        </p>
        <p>
          我们希望你可以加入我们，一起为Web3贡献更多的优质教程，让更多人可以参与到去中心化应用开发中来。一起创造一个更公开，更透明，更平等的Web3世界。
        </p>
      </FeatureSection>

      <JoinCommunitySection />
    </Layout>
  );
};

export default IndexPage;
