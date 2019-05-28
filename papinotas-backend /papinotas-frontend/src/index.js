import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import * as serviceWorker from './serviceWorker';
import { ApolloProvider } from "react-apollo";
import { ApolloClient } from "apollo-boost";
import { HttpLink } from 'apollo-link-http';
import { InMemoryCache } from 'apollo-cache-inmemory';

function csrf () 
{
  if(document.querySelector('meta[name=csrf-token]')!=null)
  {
    return document.querySelector('meta[name=csrf-token]').getAttribute('content');
  }
  else
  {
    return "no-token";
  }
}
const defaultOptions = {
  watchQuery: {
      fetchPolicy: 'cache-and-network',
      errorPolicy: 'all',
  },
  query: {
      fetchPolicy: 'cache-and-network',
      errorPolicy: 'all',
  },
  mutate: {
      errorPolicy: 'all',
  },
};
const client = new ApolloClient({
  link: new HttpLink({
      uri:  'http://localhost:3000/graphql',
      credentials: 'same-origin',
      headers: {
          'X-CSRF-Token': csrf()
      }
  }),
  cache: new InMemoryCache(),
  defaultOptions
}
);

// const client = new ApolloClient({
//   link: httpLink,
//   cache: new InMemoryCache({
//   addTypename: false
//   })
// });

ReactDOM.render(
<ApolloProvider client={client}>
    <App />
</ApolloProvider>
, document.getElementById('root'));

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();

