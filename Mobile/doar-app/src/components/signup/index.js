import { registerUser } from '../../controller'

import React, { useState } from 'react';
import { View } from 'react-native';
import { Text, TextInput, Button, ActivityIndicator } from 'react-native-paper';
import { styles } from './styles';

export default function Signup({ navigation }) {

  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [isLoading, setIsLoading] = useState(false);

  const onRegister = () => {
    setEmail('');
    setPassword('');
    setIsLoading(false);
    navigation.navigate('Login');
  }

  if (isLoading) {
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
        value={email}
        onChangeText={(_email) => setEmail(_email)}>
      </TextInput>
      <TextInput
        mode='flat'
        style={styles.inputText}
        label='Senha'
        placeholder='Digite sua senha'
        value={password}
        maxLength={15}
        secureTextEntry={true}
        onChangeText={(_password) => setPassword(_password)}>
      </TextInput>
      <Button
        mode='contained'
        color='#63dadb'
        title='Entrar'
        uppercase={false}
        style={styles.button}
        labelStyle={{ color: '#ffffff', fontSize: 16, fontWeight: '600', }}
        onPress={() => registerUser(email, password, onRegister)}>
        Continue
        </Button>
      <Text
        style={[styles.loginText, { color: '#444444' }]}>
        Tem uma conta?&nbsp;&nbsp;&nbsp;
          <Text
          style={{ ...styles.loginText, ...{ color: '#63dadb' } }}
          onPress={() => navigation.navigate('Login')}>
          Entrar
          </Text>
      </Text>
    </View>
  );
}
