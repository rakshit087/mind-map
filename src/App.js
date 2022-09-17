import React from 'react';
import {NavigationContainer} from '@react-navigation/native';
import {Provider as PaperProvider} from 'react-native-paper';
import {NavigationBar} from './layouts/NavigationBar';

const App = () => {
  return (
    <PaperProvider>
      <NavigationContainer>
        <NavigationBar />
      </NavigationContainer>
    </PaperProvider>
  );
};

export default App;
