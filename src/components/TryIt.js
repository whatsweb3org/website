import React from 'react';
import Link from '@docusaurus/Link';
import {useLocation} from '@docusaurus/router';


const TryIt = ( { fileName } ) => {
  const location = useLocation();
  return (
    <Link
        className={'button button--lg button--primary'}
        href={'https://remix.ethereum.org/whatsweb3org/website/blob/main' + location.pathname + '/' + fileName}
        // href={'https://remix.ethereum.org/whatsweb3org/website/blob/main/docs/solidity-basic/sample-code/all-code/AddrMemberVariable.sol'}
    >
      { '试一试 >> ' }
    </Link>
  );
};

export default TryIt;
