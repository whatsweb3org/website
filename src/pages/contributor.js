import React from 'react';
import Layout from '@theme/Layout';

import HeroSection from '../components/HeroSection';
import FeatureSection from '../components/FeatureSection';
import JoinCommunitySection from '../components/JoinCommunitySection';

const title = '成为贡献者';
const description =
  '加入我们成为贡献者，获得贡献者勋章🏅🏅！在帮助到其他人的同时你也将会获得巨大个人能力提升。「费曼学习法」强调将你学会的知识教授给别人才能获得最大的内容留存。我们一起努力共同建设一个互帮互助的Web3学习社区。';

const DSync = () => {
  return (
    <Layout title={title} description={description}>
      <HeroSection
        title={title}
        description={description}
        // image="/img/feat-dsync.svg"
        image="/img/feynman_learning.svg"
        icon={"/img/logo.svg"}
        buttons={[
          {
            title: '如何贡献',
            href: 'docs/solidity-basic/intro',
            className: 'button--primary',
          },
          {
            title: '开始贡献',
            href: '',
            className: 'button--primary button--outline',
          },
        ]}
      />

      {/*<FeatureSection*/}
      {/*  title=""*/}
      {/*  btnLink=""*/}
      {/*  btnText="了解更多"*/}
      {/*  image={Icon1}*/}
      {/*  direction="right"*/}
      {/*>*/}
      {/*  <p>*/}
      {/*  </p>*/}
      {/*</FeatureSection>*/}

      <JoinCommunitySection />
    </Layout>
  );
};

export default DSync;
