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
  'WhatsWeb3 org (WW3) 是由Web3极客共建的开源学习社区。是初学者以及Web2开发者转型Web3的桥梁。我们专注Web3技术普及，包括且不限于Solidity基础，Solidity进阶，Openzeppelin标准合约，以及合约安全等主题。WW3与你携手一起探索这未知的Web3领域';

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
            title: 'Solidity入门',
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
