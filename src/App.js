import React from 'react';
import {NavigationContainer} from '@react-navigation/native';
import {Provider as PaperProvider} from 'react-native-paper';
import {NavigationBar} from './layouts/NavigationBar';
import {TopBar} from './layouts/TopBar';

const App = () => {
  return (
    <PaperProvider>
      <NavigationContainer>
        <TopBar />
        <NavigationBar />
      </NavigationContainer>
    </PaperProvider>
  );
};

export default App;
