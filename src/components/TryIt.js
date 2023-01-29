import React from 'react';
import Link from '@docusaurus/Link';
import {useLocation} from '@docusaurus/router';
import clsx from 'clsx';

const TryIt = ( { fileName } ) => {
  const location = useLocation();

  var splittedPath = location.pathname.split('/');
  var baseName = splittedPath.pop();
  splittedPath.push("sample-code", baseName, fileName);
  var pathToCode = splittedPath.join('/');
  return (
    <Link
        className={clsx('button', 'button--primary')} 
        style={ { textDecoration: 'none' } }
        href={'https://remix.ethereum.org/whatsweb3org/website/blob/main' + pathToCode}
    >
      试一试 »
    </Link>
  );
};

export default TryIt;
