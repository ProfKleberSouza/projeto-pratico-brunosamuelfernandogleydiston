import React from 'react';
import { View } from 'react-native';
import { styles } from './styles';

import Lista from '../list';
import DashBardNavBar from './navbar';

export default function Dashboard() {


    return (
      <View style={styles.container}>
        <Lista></Lista>
      </View>
    );

}
