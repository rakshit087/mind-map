import React from 'react';
import {View, StyleSheet} from 'react-native';
import {Text} from 'react-native-paper';

export const Settings = () => {
  return (
    <View style={style.container}>
      <Text>Settings</Text>
    </View>
  );
};

const style = StyleSheet.create({
  container: {
    display: 'flex',
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  card: {
    backgroundColor: '#ffffff',
    height: '30%',
    width: '60%',
    borderRadius: 12,
  },
});
