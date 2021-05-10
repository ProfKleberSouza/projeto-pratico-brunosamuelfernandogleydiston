import React, { Component } from 'react';
import { Text, View, Image } from 'react-native';
import { TextInput, Button } from 'react-native-paper';
import firebase from '../../database/firebase';
import { styles } from './styles';
export default class Profile extends Component {
  constructor() {
    super();
    this.state = {
      photo: 'https://bootdey.com/img/Content/avatar/avatar2.png',
      firstName: '',
      lastName: '',
      email: '',
      city: '',
      stateUf: '',
      description: '',
      number: '',
      isUpdate: false
    }
    //await firebase.auth().currentUser.updateProfile(this.state);
  }
  updateProfile = (val, prop) => {
    const state = this.state;
    state[prop] = val;
    this.setState(state);
  }
  render() {
    return this.state.isUpdate === false ? (
      <View style={styles.container}>
        <View style={styles.header}></View>
        <Image
          style={styles.avatar}
          source={{ uri: this.state.photo }}
        />
        <View style={styles.body}>
          <View style={styles.bodyContent}>
            <Text
              style={styles.userName}>
              Nome Ultimo Nome
                  {this.state.firstName}&nbsp;{this.state.lastName}
            </Text>
            <Text
              style={styles.userDescription}>
              Lorem ipsum dolor sit amet, saepe sapientem eu nam. Qui ne assum electram expetendis, omittam deseruisse consequuntur ius an,
                  {this.state.description}
            </Text>
            <Text
              style={styles.userInfo}>
              Email@mail.com
                  {this.state.email}
            </Text>
            <Text
              style={styles.userInfo}>
              +55 31 98563-4556
                  {this.state.number}
            </Text>
            <Text
              style={styles.userInfo}>
              Cidade Estado
                  {this.state.city}&nbsp;{this.state.stateUf}
            </Text>
            <Button
              mode='contained'
              uppercase={false}
              style={styles.button}
              labelStyle={{ color: '#ffffff', fontSize: 16, fontWeight: '600', }}
              onPress={() => this.state.isUpdate = true}>
              Atualizar
              </Button>
          </View>
        </View>
      </View>
    ) : (
      <View style={styles.container}>
        <View style={styles.header}></View>
        <Image
          style={styles.avatar}
          source={{ uri: this.state.photo }}
        />
        <View style={styles.body}>
          <View style={styles.bodyContent}>
            <TextInput
              mode='flat'
              style={styles.userName}
              label='Primeiro Nome'
              value={this.state.firstName}
              onChangeText={(val) => this.updateProfile(val, 'firstName')}>
              <TextInput
                mode='flat'
                style={styles.userName}
                label='Último Nome'
                value={this.state.lastName}
                onChangeText={(val) => this.updateProfile(val, 'lastName')}>
                &nbsp;
              </TextInput>
            </TextInput>
            <TextInput
              mode='flat'
              multiline='true'
              numberOfLines='5'
              style={styles.userDescription}
              label='Descrição'
              value={this.state.description}
              onChangeText={(val) => this.updateProfile(val, 'description')}>
            </TextInput>
            <TextInput
              mode='flat'
              style={styles.userInfo}
              label='E-mail'
              value={this.state.email}
              onChangeText={(val) => this.updateProfile(val, 'email')}>
            </TextInput>
            <TextInput
              mode='flat'
              style={styles.userInfo}
              label='Número de contato'
              render={props =>
                <TextInputMask
                  {...props}
                  mask="+[00] [00] [00000] [0000]"
                  value={this.state.number}
                  onChangeText={(val) => this.updateProfile(val, 'number')}>
                </TextInputMask>
              }>
            </TextInput>
            <TextInput
              mode='flat'
              style={styles.userInfo}
              label='Cidade'
              value={this.state.city}
              onChangeText={(val) => this.updateProfile(val, 'city')}>
              &nbsp;
              <TextInput
                mode='flat'
                style={styles.userInfo}
                label='Estado'
                value={this.state.stateUf}
                onChangeText={(val) => this.updateProfile(val, 'stateUf')}>
              </TextInput>
            </TextInput>
            <Button
              mode='contained'
              uppercase={false}
              style={styles.button}
              labelStyle={{ color: '#ffffff', fontSize: 16, fontWeight: '600', }}
              onPress={() => this.state.isUpdate = false}>
              Salvar
              </Button>
          </View>
        </View>
      </View>
    )
  }
}