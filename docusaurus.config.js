const copyright = '2023 © WhatsWeb3 Org';

/** @type {import('@docusaurus/types').DocusaurusConfig} */
module.exports = {
  title: 'WhatsWeb3最佳Web3学习资源',
  tagline:
    'WhatsWeb3帮助你迅速入门Web3开发，熟悉Solidity, Openzeppelin合约，Hardhat, Truffle等技术栈',
  url: 'https://whatsweb3.org',
  baseUrl: '/',
  staticDirectories: ['static'],
  onBrokenLinks: 'warn',
  onBrokenMarkdownLinks: 'throw',
  favicon: 'img/favicon.ico',
  organizationName: 'whatsweborg', // Usually your GitHub org/user name.
  projectName: 'website', // Usually your repo name.
  scripts: [],
  // stylesheets: ['styles/dark-mode.css'],
  themeConfig: {
    prism: {
      theme: require('prism-react-renderer/themes/okaidia'),
      additionalLanguages: ['solidity'],
    },
    zoom: {
      selector: '.markdown :not(em) > img',
      config: {
        background: {
          light: 'rgb(255, 255, 255)',
          dark: 'rgb(50, 50, 50)',
        },
      },
    },
    announcementBar: {
      id: 'announcement-bar',
      content:
        '<a target="_blank" rel="nofollow noopener noreferrer" href="https://github.com/whatsweb3org/website">⭐ Star us on GitHub</a>',
      isCloseable: false,
    },
    image: 'img/website-preview-image.png',
    colorMode: {
      defaultMode: 'light',
      disableSwitch: false,
      respectPrefersColorScheme: true,
    },
    navbar: {
      title: 'WhatsWeb3',
      logo: {
        alt: 'WhatsWeb3',
        width: '32px',
        height: '32px',
        src: 'img/logo.svg',
        srcDark: 'img/logo.svg',
      },
      items: [
        {
          label: '课程列表',
          type: 'dropdown',
          items: [
            { to: '/docs/solidity-basic/intro', label: 'Solidity入门教程' },
            // { to: '/docs/solidity-advance/xxx', label: 'Solidity进阶教程' },
          ],
        },
        // { to: '/blog', label: 'Blog' },
        {
          href: 'https://github.com/whatsweb3org/website',
          position: 'right',
          className: 'header-github-link',
        },
      ],
    },
    footer: {
      style: 'dark',
      links: [
      ],
      copyright,
    },
  },
  presets: [
    [
      '@docusaurus/preset-classic',
      {
        docs: {
          path: 'docs/solidity-basic',
          routeBasePath: 'docs/solidity-basic',
          sidebarPath: require.resolve('./sidebarsBasic.js'),
        },
        googleAnalytics: {
          trackingID: 'G-WRCFLRDWJ5',
          anonymizeIP: false,
        },
        sitemap: {
          changefreq: 'daily',
          priority: 0.5,
          ignorePatterns: ['/tags/**'],
          filename: 'sitemap.xml',
        },
        blog: {
          blogTitle: 'Blog',
          blogDescription:
            'Blog汇集了最新社区发布的文章，让你可以紧跟Web3发展动态',
          showReadingTime: true,
          feedOptions: {
            type: 'all',
            copyright,
          },

          blogSidebarTitle: 'Recent posts',
          blogSidebarCount: 5,
          postsPerPage: 'ALL',
        },
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      },
    ],
  ],
  plugins: [
    // [
    //   '@docusaurus/plugin-content-docs',
    //   {
    //     id: 'solidity-advance',
    //     path: 'docs/solidity-advance',
    //     routeBasePath: 'docs/solidity-advance',
    //     sidebarPath: require.resolve('./sidebarsAdvance.js'),
    //     // ... other options
    //   },
    // ],
    [
      require.resolve('docusaurus-gtm-plugin'),
      {
        id: 'G-WRCFLRDWJ5', // GTM Container ID
      },
    ],
    ['@cmfcmf/docusaurus-search-local', {}],
    require.resolve('docusaurus-plugin-image-zoom'),
  ],
};
