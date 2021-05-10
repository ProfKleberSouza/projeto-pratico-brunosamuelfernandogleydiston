import React from 'react';
import { View } from 'react-native';
import { styles } from './styles';

import Lista from '../list';

export default function Dashboard() {


    return (
      <View style={styles.container}>
        <Lista></Lista>
      </View>
    );

}
