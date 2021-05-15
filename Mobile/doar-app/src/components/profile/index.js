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
      isUpdate: true
    }
  }

  //firebase.auth().currentUser.updateProfile(this.state);

  componentDidUpdate() { }

  updateProfile = (val, prop) => {
    const state = this.state;
    state[prop] = val;
    this.setState(state);
  }
  render() {
    const isUpdate = this.state.isUpdate;
    return (
      <div>
        { isUpdate
          ? (
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
                    onPress={() => this.setState({ isUpdate: false })}>
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
                    style={styles.userEdit}
                    label='Imagem URL'
                    value={this.state.phot}
                    onChangeText={(val) => this.updateProfile(val, 'photo')}>
                  </TextInput>
                  <TextInput
                    mode='flat'
                    style={styles.userEdit}
                    label='Primeiro nome'
                    value={this.state.firstName}
                    onChangeText={(val) => this.updateProfile(val, 'firstName')}>
                  </TextInput>
                  <TextInput
                    mode='flat'
                    style={styles.userEdit}
                    label='Último nome'
                    value={this.state.lastName}
                    onChangeText={(val) => this.updateProfile(val, 'lastName')}>
                  </TextInput>
                  <TextInput
                    mode='flat'
                    multiline='true'
                    numberOfLines='4'
                    style={styles.userEdit}
                    label='Descrição'
                    value={this.state.description}
                    onChangeText={(val) => this.updateProfile(val, 'description')}>
                  </TextInput>
                  <TextInput
                    mode='flat'
                    style={styles.userEdit}
                    label='E-mail'
                    value={this.state.email}
                    onChangeText={(val) => this.updateProfile(val, 'email')}>
                  </TextInput>
                  <TextInput
                    mode='flat'
                    style={styles.userEdit}
                    label='Número de contato'
                    value={this.state.number}
                    onChangeText={(val) => this.updateProfile(val, 'number')}>
                  </TextInput>
                  <TextInput
                    mode='flat'
                    style={styles.userEdit}
                    label='Cidade'
                    value={this.state.city}
                    onChangeText={(val) => this.updateProfile(val, 'city')}>
                  </TextInput>
                  <TextInput
                    mode='flat'
                    style={styles.userEdit}
                    label='Estado'
                    value={this.state.stateUf}
                    onChangeText={(val) => this.updateProfile(val, 'stateUf')}>
                  </TextInput>
                  <Button
                    mode='contained'
                    uppercase={false}
                    style={styles.button}
                    labelStyle={{ color: '#ffffff', fontSize: 16, fontWeight: '600', }}
                    onPress={() => this.setState({ isUpdate: true })}>
                    Salvar
                  </Button>
                </View>
              </View>
            </View>
          )
        }
      </div>
    );
  }
}