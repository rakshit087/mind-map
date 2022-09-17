import React from 'react';
import {Text, View, StyleSheet} from 'react-native';

export const Dashboard = () => {
  return (
    <View style={style.container}>
      <View style={style.card}>
        <Text>Hello World</Text>
      </View>
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
