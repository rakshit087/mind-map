import React from 'react';
import {createMaterialBottomTabNavigator} from '@react-navigation/material-bottom-tabs';
import {Dashboard} from '../pages/Dashboard';
import {Statistics} from '../pages/Statistics';
import {Settings} from '../pages/Settings';
import MaterialIcons from 'react-native-vector-icons/MaterialIcons';

const Tab = createMaterialBottomTabNavigator();

export const NavigationBar = () => {
  return (
    <Tab.Navigator initialRouteName="Home" shifting={true}>
      <Tab.Screen
        name="Home"
        component={Dashboard}
        options={{
          tabBarLabel: 'Home',
          tabBarIcon: ({color}) => (
            <MaterialIcons name="home" color={color} size={26} />
          ),
        }}
      />
      <Tab.Screen
        name="Statistics"
        component={Statistics}
        options={{
          tabBarLabel: 'Statistics',
          tabBarIcon: ({color}) => (
            <MaterialIcons name="bar-chart" color={color} size={26} />
          ),
        }}
      />
      <Tab.Screen
        name="Settings"
        component={Settings}
        options={{
          tabBarLabel: 'Settings',
          tabBarIcon: ({color}) => (
            <MaterialIcons name="settings" color={color} size={26} />
          ),
        }}
      />
    </Tab.Navigator>
  );
};
