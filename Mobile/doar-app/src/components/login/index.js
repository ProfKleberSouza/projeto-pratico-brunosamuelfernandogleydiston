import { userLogin, isLogged } from '../../controller';

import React, { useEffect, useState } from 'react';
import { Image, SafeAreaView, View } from 'react-native';
import { Text, TextInput, Button, ActivityIndicator } from 'react-native-paper';
import { styles } from './styles';


export default function Login({ navigation }) {

  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [isLoading, setIsLoading] = useState(true);


  const onLogin = (isLogged) => {
    setEmail('');
    setPassword('');
    setIsLoading(false);
    if (isLogged) {
      navigation.navigate('Dashboard');
    }
  }

  useEffect(() => isLogged(onLogin), []);

  if (isLoading) {
    return (
      <View style={styles.preloader}>
        <ActivityIndicator size="large" />
      </View>
    )
  }

  return (
    <SafeAreaView style={styles.container}>
      <View style={{height: 200}}>
      <View style={{ flex: 1, display: 'flex', justifyContent: 'center', alignItems: 'center' }}>
        <Image style={styles.logoStyle} source={require('../../assets/images/doar_login.png')} />
      </View>
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
        onPress={() => userLogin(email, password, onLogin)}>
        Entrar
        </Button>
      <Text
        style={[styles.loginText, { color: '#444444' }]}>
        Não tem uma conta?&nbsp;&nbsp;&nbsp;
          <Text
          style={{ ...styles.loginText, ...{ color: '#63dadb' } }}
          onPress={() => navigation.navigate('Signup')}>
          Inscreva-se
          </Text>
      </Text>
    </SafeAreaView>
  );

}
