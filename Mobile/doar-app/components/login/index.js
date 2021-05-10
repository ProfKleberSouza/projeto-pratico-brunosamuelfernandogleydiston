import React, { Component } from 'react';
import { Image, View, Alert } from 'react-native';
import { Text, TextInput, Button, ActivityIndicator } from 'react-native-paper';
import firebase from '../../database/firebase';
import { styles } from './styles';


export default class Login extends Component {
  constructor() {
    super();
    this.state = {
      email: '',
      password: '',
      isLoading: true
    }
  }
  componentDidMount() {
    firebase.auth().onAuthStateChanged((user) => {
      if (user) {
        console.log('User logged-in successfully!', user)
        this.setState({
          isLoading: false,
          email: '',
          password: ''
        })
        this.setState({
          isLoading: false,
        })
        this.props.navigation.navigate('Dashboard')
      }
    });
  }
  updateInputVal = (val, prop) => {
    const state = this.state;
    state[prop] = val;
    this.setState(state);
  }
  userLogin = () => {
    if (this.state.email === '' && this.state.password === '') {
      Alert.alert('Enter details to signin!')
    } else {
      firebase
        .auth()
        .signInWithEmailAndPassword(this.state.email, this.state.password)
        .then((res) => {
          console.log(res)
          console.log('User logged-in successfully!')
          this.setState({
            isLoading: false,
            email: '',
            password: ''
          })
          this.setState({
            isLoading: true,
          })
          this.props.navigation.navigate('Dashboard')
        })
        .catch(error => this.setState({ errorMessage: error.message }))
    }
  }
  render() {
    if (this.state.isLoading) {
      return (
        <View style={styles.preloader}>
          <ActivityIndicator size="large" />
        </View>
      )
    }
    return (
      <View style={styles.container}>
        <View style={{ flex: 1, display: 'flex', justifyContent: 'center', alignItems: 'center' }}>
          <Image style={styles.logoStyle} source={require('../../assets/images/doar_login.png')} />
        </View>
        <Text style={[styles.title, { color: '#0a0708' }]}>
          Entrar
        </Text>
        <Text style={[styles.subtitle, { color: '#747474' }]}>
          Olá! Prazer em ver você de novo.
        </Text>
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
          onPress={() => this.userLogin()}>
          Entrar
        </Button>
        <Text
          style={[styles.loginText, { color: '#444444' }]}>
          Não tem uma conta?&nbsp;&nbsp;&nbsp;
          <Text
            style={{ ...styles.loginText, ...{ color: '#63dadb' } }}
            onPress={() => this.props.navigation.navigate('Signup')}>
            Inscreva-se
          </Text>
        </Text>
      </View>
    );
  }
}
