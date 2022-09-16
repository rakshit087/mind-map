import React from 'react';
import {NavigationContainer} from '@react-navigation/native';
import {createBottomTabNavigator} from '@react-navigation/bottom-tabs';
import {Dashboard} from './pages/Dashboard';

const Tab = createBottomTabNavigator();

const App = () => {
  return (
    <NavigationContainer>
      <Tab.Navigator>
        <Tab.Screen name="Home" component={Dashboard} />
        <Tab.Screen name="Statistics" component={Dashboard} />
        <Tab.Screen name="Settings" component={Dashboard} />
      </Tab.Navigator>
    </NavigationContainer>
  );
};

export default App;
