const copyright = '2023 © WhatsWeb3 Org';

/** @type {import('@docusaurus/types').DocusaurusConfig} */
module.exports = {
  title: 'WhatsWeb3最佳Web3学习资源',
  tagline:
    'WhatsWeb3 org (WW3) 是由Web3极客共建的开源学习社区。是初学者以及Web2开发者转型Web3的桥梁。我们专注Web3技术普及，包括且不限于Solidity基础，Solidity进阶，Openzeppelin标准合约，以及合约安全等主题。WW3与你携手一起探索这未知的Web3领域',
  url: 'https://www.whatsweb3.org',
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
        // {
        //   label: '课程列表',
        //   type: 'dropdown',
        //   items: [
        //     { to: '/docs/solidity-advance/xxx', label: 'Solidity进阶指南' },
        //   ],
        // },
        { to: '/docs/solidity-basic/intro', label: 'Solidity入门指南' },
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
        {
          title: '社区',
          items: [
            {
              label: 'Discord',
              href: 'https://discord.gg/t6vevpcSS9',
            },
            {
              label: 'Twitter',
              href: 'https://twitter.com/whatsweb3org',
            },
          ],
        },
        {
          title: '资源',
          items: [
            {
              label: 'GitHub',
              href: 'https://github.com/whatsweb3org/website',
            },
          ],
        },
        {
          title: '网站',
          items: [
            {
              label: '网站主页',
              href: 'https://www.whatsweb3.org',
            },
          ],
        },
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
          showLastUpdateTime: true,
          editUrl: 'https://github.com/whatsweb3org/website/tree/main',
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
