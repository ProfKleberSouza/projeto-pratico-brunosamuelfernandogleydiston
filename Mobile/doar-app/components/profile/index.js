
import * as React from 'react';
import { Text, View } from 'react-native';
import { Avatar, IconButton, Button } from 'react-native-paper';

import { styles } from './styles';

export default function Profile(props) {

  return (
    <View>
      <View style={styles.header}>
        <Avatar.Image
          size={70}
          source={require('../../assets/images/avatar.png')} />
        <Text style={styles.text}>Ana Maria</Text>
        <IconButton
          icon="menu"
          color='black'
          size={30}
          style={styles.menuButton}
          onPress={() => console.log('Pressed')}
        />
      </View>
      <View style={styles.aboutContainer}>
        <Text style={{ fontSize: 20 }}>Quem é você?</Text>
        <Text style={{
          fontSize: 15,
          marginTop: 10,
          borderBottomColor: 'black',
          borderBottomWidth: 1,
          borderBottomEndRadius: 1,
          paddingBottom: 10,
        }}>Is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,
        but also the leap into electronic typesetting.</Text>
      </View>

      <Button
        mode='contained'
        uppercase={false}
        style={styles.button}
        labelStyle={{ color: '#ffffff', fontSize: 16, fontWeight: '600', }}
        onPress={() => props.navigation.navigate('Lista')}>
        Fazer ou Buscar Doação
        </Button>
    </View>
  );
};


