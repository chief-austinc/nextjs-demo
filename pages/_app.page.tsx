import * as React from "react";
import { ApolloProvider } from "@apollo/client";
import { apolloClient } from "../apollo/client";

import "../styles/globals.css";

let isHydrating = true;

function MyApp({ Component, pageProps }) {
  let [isHydrated, setIsHydrated] = React.useState(!isHydrating);

  React.useEffect(() => {
    isHydrating = false;
    setIsHydrated(true);
  }, []);

  if (isHydrated) {
    return (
      <ApolloProvider client={apolloClient}>
        <Component {...pageProps} />
      </ApolloProvider>
    );
  } else {
    return null;
  }
}

export default MyApp;
