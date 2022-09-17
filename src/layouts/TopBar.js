import React from 'react';
import {Appbar} from 'react-native-paper';

export const TopBar = () => {
  return (
    <Appbar.Header style={{backgroundColor: '#f2f2f2'}}>
      <Appbar.Content title="OTP Cleaner" titleStyle={{fontWeight: '500'}} />
    </Appbar.Header>
  );
};
