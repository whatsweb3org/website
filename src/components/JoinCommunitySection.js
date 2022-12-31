import React from 'react';
import Link from '@docusaurus/Link';

import SectionLayout from './SectionLayout';

const JoinCommunitySection = () => {
  return (
    <SectionLayout
      title="加入社区，一起交流讨论"
      description={`Follow us 🐦 on Twitter, ⭐ us on GitHub, and join our community 🗣️ on Discord!`}
    >
      <div
        style={{
          display: 'flex',
          justifyContent: 'center',
          gap: '10px',
          flexWrap: 'wrap',
        }}
      >
        <Link
          href="https://twitter.com/whatsweb3org"
          className="button button--primary button--outline"
        >
          Follow on Twitter
        </Link>
        <Link
          href="https://github.com/whatsweb3org?tab=repositories"
          className="button button--primary button--outline"
        >
          Star on GitHub
        </Link>
        <Link
          href="https://discord.gg/t6vevpcSS9"
          className="button button--primary button--outline"
        >
          Join Discord
        </Link>
      </div>
    </SectionLayout>
  );
};

export default JoinCommunitySection;
