import React, { Component } from 'react';
import { StyleSheet, View, Alert } from 'react-native';
import { Text, TextInput, Button, ActivityIndicator } from 'react-native-paper';
import firebase from '../database/firebase';
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
  updateInputVal = (val, prop) => {
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
            isLoading: false,
            displayName: '',
            email: '',
            password: ''
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
          label='Nome'
          placeholder='Digite seu nome'
          value={this.state.displayName}
          onChangeText={(val) => this.updateInputVal(val, 'displayName')}
        />
        <TextInput
          mode='flat'
          style={styles.inputText}
          label='E-mail'
          placeholder='Digite seu e-mail'
          value={this.state.email}
          onChangeText={(val) => this.updateInputVal(val, 'email')}
        />
        <TextInput
          mode='flat'
          style={styles.inputText}
          label='Senha'
          placeholder='Digite sua senha'
          value={this.state.password}
          maxLength={15}
          secureTextEntry={true}
          onChangeText={(val) => this.updateInputVal(val, 'password')}
        />
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
const styles = StyleSheet.create({
  container: {
    flex: 1,
    display: 'flex',
    flexDirection: 'column',
    padding: 35,
    backgroundColor: '#fff'
  },
  inputStyle: {
    width: '100%',
    marginBottom: 15,
    paddingBottom: 15,
    alignSelf: 'center',
    borderColor: '#ccc',
    borderBottomWidth: 1
  },
  loginText: {
    color: '#3740FE',
    marginTop: 25,
    textAlign: 'center'
  },
  preloader: {
    left: 0,
    right: 0,
    top: 0,
    bottom: 0,
    position: 'absolute',
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: '#fff'
  },
  title: {
    marginTop: 25,
    marginBottom: 25,
    fontSize: 22,
    fontWeight: '200',
  },
  inputText: {
    width: '100%',
    alignSelf: 'center',
    textAlign: 'left',
    backgroundColor: '#ffffff',
  },
  button: {
    color: '#63dadb',
    marginTop: 30,
  },
  loginText: {
    marginTop: 30,
    textAlign: 'center',
  },
});