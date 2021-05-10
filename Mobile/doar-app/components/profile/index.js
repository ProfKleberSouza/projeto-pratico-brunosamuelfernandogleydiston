import React, { Component } from 'react';
import { Text, View, Image } from 'react-native';
import { Avatar, Button } from 'react-native-paper';
import firebase from '../../database/firebase';
import { styles } from './styles';

// Link de como implementar atualização
// https://code.tutsplus.com/tutorials/creating-a-blogging-app-using-react-part-5-profile-page--cms-29131

export default class Profile extends Component {
  constructor() {
    super();
    this.state = {
      photo: 'https://bootdey.com/img/Content/avatar/avatar2.png',
      name: '',
      lastName: '',
      email: '',
      city: '',
      stateUf: '',
      description: '',
      number: '',
      isUpdate: false
    } //= firebase.auth().currentUser;
  }
  updateInputVal = (val, prop) => {
    const state = this.state;
    state[prop] = val;
    this.setState(state);
  }
  render() {
    const {
      photo,
      name,
      lastName,
      email,
      city,
      stateUf,
      description,
      number,
    } = this.state;
    return (
      <View style={styles.container}>
        <View style={styles.header}></View>
        <Image
          style={styles.avatar}
          source={{ uri: photo }}
        />
        <View style={styles.body}>
          <View style={styles.bodyContent}>
            <Text
              style={styles.userName}>
              Nome Ultimo Nome
                {name} {lastName}
            </Text>
            <Text
              style={styles.userDescription}>
              Lorem ipsum dolor sit amet, saepe sapientem eu nam. Qui ne assum electram expetendis, omittam deseruisse consequuntur ius an,
                {description}
            </Text>
            <Text
              style={styles.userInfo}>
              Email@mail.com
                {email}
            </Text>
            <Text
              style={styles.userInfo}>
              +55 31 98563-4556
                {number}
            </Text>
            <Text
              style={styles.userInfo}>
              Cidade Estado
                {city} {stateUf}
            </Text>
            <Button
              mode='contained'
              uppercase={false}
              style={styles.button}
              labelStyle={{ color: '#ffffff', fontSize: 16, fontWeight: '600', }}
              onPress={() => this.state.isUpdate === true}>
              Atualizar
            </Button>
          </View>
        </View>
      </View>
    );
  }
}