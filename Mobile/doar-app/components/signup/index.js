import firebase from '../../database/firebase';

import React, { Component } from 'react';
import { View, Alert } from 'react-native';
import { Text, TextInput, Button, ActivityIndicator } from 'react-native-paper';
import { styles } from './styles';

export default class Signup extends Component {

  constructor() {
    super();
    this.state = {
      displayName: '',
      email: '',
      password: '',
      isLoading: false
    }
  }
  updateSignup = (val, prop) => {
    const state = this.state;
    state[prop] = val;
    this.setState(state);
  }
  registerUser = () => {
    if (this.state.email === '' && this.state.password === '') {
      Alert.alert('Enter details to signup!')
    } else {
      this.setState({
        isLoading: true,
      })
      firebase
        .auth()
        .createUserWithEmailAndPassword(this.state.email, this.state.password)
        .then((res) => {
          res.user.updateProfile({
            displayName: this.state.displayName
          })
          console.log('User registered successfully!')
          this.setState({
            email: '',
            password: '',
            isLoading: false,
          })
          this.props.navigation.navigate('Login')
        })
        .catch(error => this.setState({ errorMessage: error.message }))
    }
  }
  render() {
    if (this.state.isLoading) {
      return (
        <View style={styles.preloader}>
          <ActivityIndicator size="large" color="#9E9E9E" />
        </View>
      )
    }
    return (
      <View style={styles.container}>
        <Text style={[styles.title, { color: '#0a0708' }]}>
          Inscreva-se
        </Text>
        <TextInput
          mode='flat'
          style={styles.inputText}
          label='E-mail'
          placeholder='Digite seu e-mail'
          value={this.state.email}
          onChangeText={(val) => this.updateSignup(val, 'email')}>
        </TextInput>
        <TextInput
          mode='flat'
          style={styles.inputText}
          label='Senha'
          placeholder='Digite sua senha'
          value={this.state.password}
          maxLength={15}
          secureTextEntry={true}
          onChangeText={(val) => this.updateSignup(val, 'password')}>
        </TextInput>
        <Button
          mode='contained'
          color='#63dadb'
          title='Entrar'
          uppercase={false}
          style={styles.button}
          labelStyle={{ color: '#ffffff', fontSize: 16, fontWeight: '600', }}
          onPress={() => this.registerUser()}>
          Continue
        </Button>
        <Text
          style={[styles.loginText, { color: '#444444' }]}>
          Tem uma conta?&nbsp;&nbsp;&nbsp;
          <Text
            style={{ ...styles.loginText, ...{ color: '#63dadb' } }}
            onPress={() => this.props.navigation.navigate('Login')}>
            Entrar
          </Text>
        </Text>
      </View>
    );
  }
}
